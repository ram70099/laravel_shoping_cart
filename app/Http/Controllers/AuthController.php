<?php

namespace App\Http\Controllers;
use App\Models\User;
use App\Models\Cart;
use App\Models\Product;
use App\Mail\SendMail;
use App\Jobs\SendEmail;
use App\Events\PasswordReset;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        // Create the user
        $user = new User();
        $user->name = $request->post('name');
        $user->email = $request->post('email');
        $user->password = Hash::make($request->password);
        $user->save();
        $data = $request->post('email');
        dispatch(new SendEmail($data));
        if ($user) {
            return redirect('/login')->with('success', 'Registration successful!');
        }
    }
    public function login(Request $request)
    {
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            return redirect()->route('home')->with('success', 'login successful');
        }
    }
    public function logout()
    {
        Auth::logout();
        return redirect('/login')->with('success', 'You have been logged out successfully.');
    }

 
    

}
