<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'HomeController@index');
Route::get('cities','HomeController@getCities');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::post('save_comment','HomeController@saveComment')->name('comment.save');

Route::delete('delete_comment/{id}','HomeController@deleteComment')->name(('comment.delete'));
Route::get('show-one/{id}','HomeController@showOneComment')->name('one.comment');
Route::post('update-comment/{id}','HomeController@updateComment')->name('comment.update');

Route::Resource('news','NewsController');

Route::get('news','NewsController@index');
Route::get('news/create','NewsController@create');
Route::post('news','NewsController@store');
Route::get('news/{id}/edit','NewsController@edit');
Route::put('news/{id}','NewsController@update');
Route::get('news/{id}','NewsController@show');
Route::delete('news/{id}','NewsController@destroy');






