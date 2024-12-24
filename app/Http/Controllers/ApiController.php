<?php
// Laravel ApiController
namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\User;
use App\Models\Cart;
use App\Models\Product;
use App\Models\OrderDetail;
use Illuminate\Support\Facades\Log;

use App\Jobs\SendEmail;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class ApiController extends Controller
{
  

    public function datasend()
    {
        $categories = Category::all();
        return response()->json([
            'categories' => $categories,
        ]);
    }


public function login(Request $request)
{
    $credentials = $request->only('email', 'password');

    if (Auth()->attempt($credentials)) 
    {
        $user = auth()->user();
        $token = $user->createToken('laravel_api')->plainTextToken; 
        return response()->json([
            'success' => true,
            'token' => $token,
            'user' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
            ]
        ], 200);
    }

    return response()->json([
        'message' => 'Invalid credentials'
    ], 401);
}


public function register(Request $request)
{
    $validatedData = $request->validate([
        'name' => 'required|string|max:255',
        'email' => 'required|email|unique:users,email',
        'password' => 'required|string|min:6',
    ]);
    $user = User::create([
        'name' => $validatedData['name'],
        'email' => $validatedData['email'],
        'password' => bcrypt($validatedData['password']),
    ]);
    $data = $validatedData['email'];
    dispatch(new SendEmail($data));

    return response()->json(['message' => 'Registration successful!', 'user' => $user], 201);
}

    function product() {
     
            $products = Product::inRandomOrder()->take(6)->get();
            $user = Auth::user();
            Log::info('Authenticated user:', ['user' => $user]);

        return response()->json([
            'products' => $products,
            'data' => $user,
        ]);
    }
    function productsByCategory($categoryId = null) {
        $products = Product::where('category_id', $categoryId)->get();
        return response()->json([
            'products' => $products,
        ]);
    }
    function productsById($id = null) {
        $product = Product::findOrFail($id);
        if($product) {
            return response()->json([
                'product' => $product,
            ]);
        }
        else{
            return response()->json([
                'product' => 'data not found',
            ]);
        }
       
    }
    public function addToCart(Request $request)
    {
        if (Auth::check()) { 
            $user = Auth::user();
            $quantity = 1;
             $cartItem = Cart::where('user_id', $user->id)
            ->where('product_id', $request->id)
            ->first();
        if ($cartItem) {
            $cartItem->quantity += $quantity;
            $cartItem->save();
        } else {
            Cart::create([
                'user_id' => $user->id,
                'product_id' => $request->id,
                'quantity' => $quantity,
            ]);
        }
        return redirect()->back()->with('success', 'Product added to cart!');
        } else {
            return response()->json(['success' => false, 'message' => 'User not authenticated.'], 401);
        }
    }
    public function buyNow(Request $request)
    {
        if (Auth::check()) { 

        $user = Auth::user();
        $quantity = $request->input('quantity') ?: 1;
        $product = Product::find($request->id);
        $order = OrderDetail::where('order_id', $user->id)
            ->where('product_id', $request->id)
            ->first();
        if ($order) {
            $order->quantity +=$quantity;
            $product->ordered +=$quantity;
            $order->save();
        } else {
            OrderDetail::create([
                'order_id' => $user->id,
                'product_id' => $request->id,
                'price' => $product->price,
                'quantity' => $quantity,
            ]);
        }
        $product->pstock -= $quantity;
        $product->save();
       
        return redirect()->back()->with('success', $quantity);
    } else {
        return response()->json(['success' => false, 'message' => 'User not authenticated.'], 401);
    }
    }
    
    
    
    
}