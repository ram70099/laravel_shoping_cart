<?php

namespace App\Http\Controllers;

use Laravel\Socialite\Facades\Socialite;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;  // Add this line to import Str facade
use Google_Client;
use Exception;

class GoogleLoginController extends Controller
{
    public function redirectToGoogle()
    {
        // Redirecting the user to Google OAuth page
        return Socialite::driver('google')->redirect();
    }
    public function handleGoogleToken(Request $request)
    {
        $token = $request->token;

        $client = new Google_Client(['client_id' => env('GOOGLE_CLIENT_ID')]);

        try {
            // Verify the token from Google
            $payload = $client->verifyIdToken($token);

            if ($payload) {
                $googleId = $payload['sub']; // Google ID
                $email = $payload['email'];
                $user = User::where('email', $email)->first();

                // If the user does not exist, create a new user
                if (!$user) {
                    $user = User::create([
                        'name' => $payload['given_name'],
                        'email' => $email,
                        'password' => bcrypt(Str::random(8)), // Generate a random password
                    ]);
                }

                // Login the user
                Auth::login($user);

                // You can return a token or a success message
                return response()->json(['success' => true, 'token' => $user->createToken('YourAppName')->plainTextToken]);

            } else {
                return response()->json(['error' => 'Invalid Google token'], 400);
            }
        } catch (Exception $e) {
            return response()->json(['error' => 'Google login failed', 'message' => $e->getMessage()], 500);
        }
    }
    public function handleGoogleCallback()
{
    try {
        $googleUser = Socialite::driver('google')->stateless()->user();

        $user = User::firstOrCreate(
            ['email' => $googleUser->getEmail()],
            [
                'name' => $googleUser->getName(),
                'password' => bcrypt(Str::random(12)),
            ]
        );

        // Log the user in
        Auth::login($user);
        session()->regenerate();

        // Redirect to homepage or intended page
        return redirect('/')->with('success', 'Google login successful!');
    } catch (\Exception $e) {
        return redirect('/login')->with('error', 'Google login failed: ' . $e->getMessage());
    }
}

}
