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

define('PAGINATIONCOUNT', 4);

Route::get('youtube', 'NewsController@getVedio')->middleware('auth');

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

Route::group(['prefix' => LaravelLocalization::setLocale()], function(){
    Route::Resource('news','NewsController');

    Route::get('edit/{id}','NewsController@edit')->name('edit-offer');
    Route::post('update/{id}','NewsController@update')->name('update-offer');
    Route::get('delete-offer/{id}','NewsController@destroy')->name('delete-offer');
    Route::group(['prefix'=>'offers'],function(){
        Route::get('news', 'NewsController@index');
        Route::get('get-all-inactive-status', 'NewsController@getAllInactiveOffers');
       // Route::get('create','NewsController@create');
        // Route::post('store','NewsController@store');

    });


});


//////  Begin Ajax Routes /////////////////


Route::group(['prefix' => 'ajax-offers'], function(){

    Route::get('create','OfferController@create');
    Route::post('store', 'OfferController@store')->name('ajax.offer.store');

});



//////  End Ajax Routes /////////////////


///////////// Begin Authentication && Guards //////////////
Route::group(['middleware' => 'checkAge'], function(){

    Route::get('custom-auth', 'AutenticationController@adualt')->name('adualt');


});

Route::get('site', 'AutenticationController@site')->middleware('auth:web');
Route::get('admin', 'AutenticationController@admin')->middleware('auth:admin');
Route::get('admin/login', 'AutenticationController@adminLogin')->name('admin.login');
Route::post('admin/login', 'AutenticationController@checkAdminLogin')->name('save.admin.login');



///////////// End Authentication && Guards //////////////



Route::get('has-one', 'Relation\RelationController@hasOneRelation');

Route::get('has-one-reverse', 'Relation\RelationController@hasOneRelationReverse');

Route::get('get-user-has-phones', 'Relation\RelationController@getUserHasPhone');

Route::get('get-user-not-has-phones', 'Relation\RelationController@getUserNotHasPhone');


############ Begin One to Many Relatioship ############

Route::get('hospital-has-many', 'Relation\RelationController@getHospitalDoctor');

Route::get('hospitals', 'Relation\RelationController@hospitals')->name('hospitals');

Route::get('hospitals/{hospital_id}', 'Relation\RelationController@deleteHospital')->name('hospital.delete');

Route::get('doctors/{hospital_id}', 'Relation\RelationController@doctors')->name('hospital.doctors');


Route::get('hospitals-has-doctors', 'Relation\RelationController@hospitalHasDoctors');

Route::get('hospitals-has-doctors-male', 'Relation\RelationController@hospitalsOnlyHasMaleDoctors');

Route::get('hospitals-not-has-doctors', 'Relation\RelationController@hospitalsNotHasDoctors');





############ End One to Many Relatioship ##############



Route::get('doctors-services', 'Relation\RelationController@getDoctorsServices');

Route::get('services-doctors', 'Relation\RelationController@getServicesDoctor');


Route::get('doctors-services/{doctor_id}', 'Relation\RelationController@getDoctorsServicesById')->name('doctor.service');

Route::post('saveServicesToDoctor', 'Relation\RelationController@saveServicesToDoctor')->name('save.doctor.service');

############ Has One Through #############

Route::get('has-one-through', 'Relation\RelationController@getPatientDoctor');

Route::get('has-many-through', 'Relation\RelationController@getCountryDoctor');


Route::get('accessors', 'Relation\RelationController@getDoctors');


Route::get('collection', 'CollectTut@index');





