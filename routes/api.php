<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Request;
use App\Http\Controllers\ApiController;
use App\Http\Controllers\GoogleLoginController;
use App\Http\Controllers\FacebookLoginController;

Route::post('/register', [ApiController::class, 'register']);
Route::post('/login', [ApiController::class, 'login']);
Route::middleware('auth:sanctum')->post('/cart/{id}', [ApiController::class, 'addToCart']);
Route::middleware('auth:sanctum')->post('/buynow/{id}', [ApiController::class, 'buyNow']);


Route::get('/category', [ApiController::class, 'datasend']);
Route::get('/products', [ApiController::class, 'product']);
Route::get('/products/{categoryId}', [ApiController::class, 'productsByCategory']); 
Route::get('/product/{id}', [ApiController::class, 'productsById']); 

Route::post('google/callback', [GoogleLoginController::class, 'handleGoogleToken']);
Route::post('facebook/callback', [FacebookLoginController::class, 'handleFacebookToken']);







