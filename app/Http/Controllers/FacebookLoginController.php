<?php

namespace App\Http\Controllers;

use Laravel\Socialite\Facades\Socialite;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Exception;
use Illuminate\Support\Facades\Http;


class FacebookLoginController extends Controller
{
    // Redirect the user to the Facebook authentication page
    public function redirectToFacebook()
    {
        return Socialite::driver('facebook')->redirect();
    }
    public function handleFacebookToken(Request $request)
    {
        $request->validate([
            'token' => 'required|string',
        ]);
        try {
            // Use the Facebook Graph API to validate the token and retrieve user info
            $response = Http::get('https://graph.facebook.com/me', [
                'fields' => 'id,name,email',
                'access_token' => $request->token,
            ]);
            if ($response->failed()) {
                throw new Exception('Invalid Facebook token.');
            }
            $facebookUser = $response->json();
            if (!isset($facebookUser['email'])) {
                throw new Exception('Unable to retrieve email from Facebook account.');
            }
            $user = User::where('email', $facebookUser['email'])->first();
            if (!$user) {
                $user = User::create([
                    'name' => explode(' ', $facebookUser['name'])[0], // Use first part of the name
                    'password' => '', // Generate a random password
                    'email' => $facebookUser['email'],
                ]);
            }
            Auth::login($user);
            return response()->json([
                'success' => true,
                'message' => 'Login successful',
                'user' => $user,
                'token' => $user->createToken('access_token')->plainTextToken,
            ]);
        } catch (Exception $e) {
            Log::error('Facebook token login error: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'Something went wrong with Facebook login.',
                'error' => $e->getMessage(),
            ], 400);
        }
    }
    public function handleFacebookCallback()
    {
            $facebookUser = Socialite::driver('facebook')->stateless()->user();

            // Check if the user exists in the database
            $user = User::where('email', $facebookUser->getEmail())->first();

            if (!$user) {
                // Create a new user
                $user = User::create([
                    'firstname' => $facebookUser->getName(),
                    'lastname' => $facebookUser->getName(),
                    'email' => $facebookUser->getEmail(),
                    'password' => bcrypt(Str::random(12)),
                    'facebook_id' => $facebookUser->getId(),
                ]);
            }

            // Log the user in
            Auth::login($user);

            return redirect('/')->with('success', 'Facebook login successful!');
       
    }
}