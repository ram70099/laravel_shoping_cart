<?php
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ApiController;
use App\Http\Controllers\FacebookLoginController;
use App\Http\Controllers\GoogleLoginController;
use App\Models\Category;


Route::get('/', [CategoryController::class, 'showCategories'])->name('home');
Route::get('/shop', [CategoryController::class, 'showCategories'])->name('shop');
Route::get('/product/{id}', [CategoryController::class, 'show'])->name('product.detail');
Route::get('/login', function () {
    return view('Login/Login');
});
Route::get('/register', function () {
    return view('Login/Register');
});
Route::get('/contact', function () {
    return view('ContactUs/ContactUs');
});

Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);
Route::get('/logout', [AuthController::class, 'logout']);

Route::get('google', [GoogleLoginController::class, 'redirectToGoogle'])->name('google.login');
Route::get('google/callback', [GoogleLoginController::class, 'handleGoogleCallback']);


Route::get('facebook', [FacebookLoginController::class, 'redirectToFacebook'])->name('facebook.login');
Route::get('facebook/callback', [FacebookLoginController::class, 'handleFacebookCallback']);

Route::post('/cart/add', [CategoryController::class, 'addToCart'])->name('cart.add');
Route::get('/cart', [CategoryController::class, 'cart'])->name('cart.show');
Route::post('/cart/remove', [CategoryController::class, 'removecart'])->name('cart.remove');

Route::post('/buy-now', [CategoryController::class, 'buyNow'])->name('product.buy');









