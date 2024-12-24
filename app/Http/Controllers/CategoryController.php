<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Cart;
use App\Models\OrderDetail;
use Illuminate\Support\Facades\Auth;

use Illuminate\Http\Request;
use App\Models\Category;

class CategoryController extends Controller
{
    protected $categories;
    protected $products;

    public function __construct()
    {
        $this->categories = Category::all();
    }

    private function getProducts($categoryId = null)
    {
        if ($categoryId) {
            return Product::where('category_id', $categoryId)->get();
        } else {
            return Product::inRandomOrder()->take(9)->get();
        }
    }

    public function showCategories(Request $request)
    {
        $categoryId = $request->query('category');
        $products = $this->getProducts($categoryId);
        $viewName = $request->is('shop') ? 'Shop' : 'Index';

        return view($viewName, ['categories' => $this->categories, 'products' => $products]);
        
    }

    public function show($id)
    {
        $product = Product::findOrFail($id);
        return view('Product.detail', ['product' => $product, 'categories' => $this->categories]);
    }
    public function cart()
    {
        $user = Auth::user();
        $cartItems = Cart::where('user_id', $user->id)->get();
        $products = Product::whereIn('id', $cartItems->pluck('product_id'))->get();

        return view('cart', ['categories' => $this->categories, 'products' => $products]);
    }
    public function removecart(Request $request)
    {
        $user = Auth::user();
        Cart::where('user_id', $user->id)
            ->where('product_id', $request->product_id)
            ->delete();
        return redirect()->back()->with('success', 'Product removed from cart!');
    }
    public function buyNow(Request $request)
    {
        $user = Auth::user();
        $quantity = $request->input('quantity') ?: 1;
        $product = Product::find($request->product_id);
        $order = OrderDetail::where('order_id', $user->id)
            ->where('product_id', $request->product_id)
            ->first();
        if ($order) {
            $order->quantity +=$quantity;
            $product->ordered +=$quantity;
            $order->save();
        } else {
            OrderDetail::create([
                'order_id' => $user->id,
                'product_id' => $request->product_id,
                'price' => $product->price,
                'quantity' => $quantity,
            ]);
        }
        $product->pstock -= $quantity;
        $product->save();
       
        return redirect()->back()->with('success', 'Product removed from cart!');
    }
    public function addToCart(Request $request)
    {
        $user = Auth::user();
        $quantity = $request->input('quantity') ?: 1;
        if (!$quantity) {
            return redirect()->back()->with('error', 'Product not found.');
        }
        $cartItem = Cart::where('user_id', $user->id)
            ->where('product_id', $request->product_id)
            ->first();
        if ($cartItem) {
            $cartItem->quantity += $quantity;
            $cartItem->save();
        } else {
            Cart::create([
                'user_id' => $user->id,
                'product_id' => $request->product_id,
                'quantity' => $quantity,
            ]);
        }
        return redirect()->back()->with('success', 'Product added to cart!');
    }
}
