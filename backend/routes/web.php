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

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\RegionController;
use App\Http\Controllers\DistrictController;
use App\Http\Controllers\CommuneController;
use App\Http\Controllers\FormationsanitaireController;
use App\Http\Controllers\MaintenancePageController;
use App\Http\Controllers\MotifController;
use App\Http\Controllers\ProfessionController;
use App\Http\Controllers\Profilscontroller;
use App\Http\Controllers\VillageController;
use App\Http\Controllers\QuartierController;
use App\Http\Controllers\RecensementController;
use App\Http\Controllers\ReferencementcontreController;
use App\Http\Controllers\ReferencementController;
use App\Http\Controllers\ThemeController;
use App\Models\Profession;
use Illuminate\Contracts\Foundation\MaintenanceMode;

Route::resource('region', RegionController::class);
Route::resource('district', DistrictController::class);
Route::resource('commune', CommuneController::class);
Route::resource('formationsanitaire', FormationsanitaireController::class);
Route::resource('village', VillageController::class);
Route::resource('quartier', QuartierController::class);
Route::resource('theme', ThemeController::class);
Route::resource('motif', MotifController::class);
Route::resource('profil', Profilscontroller::class);
Route::resource('profession', ProfessionController::class);
Route::resource('MaintenancePage', MaintenancePageController::class);
Route::resource('referencement', ReferencementController::class);
Route::resource('referencementcontre', ReferencementcontreController::class);  
Route::resource('recensement', RecensementController::class); 

Route::get('/login', [AuthController::class, 'login'])  ->name('login');
Route::get('/register', [AuthController::class, 'register'])  ->name('register');
Route::get('/logout', [AuthController::class, 'logout'])  ->name('logout');
Route::get('/refresh', [AuthController::class, 'refresh'])  ->name('refresh');
Route::get('/me', [AuthController::class, 'me'])  ->name('me');
Route::get('/showMaintenancePage', [MaintenancePageController::class, 'showMaintenancePage'])->name('showMaintenancePage');
Route::get('/listeRecensement', [ReferencementController::class, 'listeRecensement'])->name('listeRecensement');
Route::get('/recensement/editidRecencement/{id}', [ReferencementController::class, 'editidRecencement'])
    ->name('referencement.editidRecencement');
Route::get('/createchefmenage', [RecensementController::class, 'createchefmenage'])->name('createchefmenage');
Route::get('/createmembre', [RecensementController::class, 'createmembre'])->name('createmembre');
Route::post('/storechefmenage', [RecensementController::class, 'storechefmenage'])->name('storechefmenage');
Route::post('/storemembre', [RecensementController::class, 'storemembre'])->name('storemembre');

    


//Route::get('/', function () {
//    return view('auth.login');
//}); // page d'acceuil

Route::get('/', function () {
    return view('admin');
});




