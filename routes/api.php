<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

//Route::apiResource('district','DistrictController');

Route::apiResource('todo','TodoController');

Route::apiResource('user','UserController');

Route::post('loginTalha','CustomAuthController@loginTalha');

Route::post('registerTalha','CustomAuthController@registerTalha');

Route::get('duplicateCheck','CustomAuthController@duplicateCheck');

Route::apiResource('role','RoleController');

Route::get('userList','HomeController@userList');

Route::apiResource('permission','PermissionController');
Route::get('userPermissionList','PermissionController@userPermissionList');


Route::get('permissionOfRole/{roleId}','PermissionController@permissionOfRole');

Route::post('permissionSet','PermissionController@permissionSet');





Route::get('roleOfUser/{userId}','RoleController@roleOfUser');

Route::post('roleSet','RoleController@roleSet');




