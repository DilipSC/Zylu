<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EmployeeController;

Route::get('/health', function () {
    return response()->json([
        'status' => true,
        'message' => 'API working fine!'
    ]);
});

Route::get('/employee',[EmployeeController::class,'getEmployee']);
Route::post('/employee',[EmployeeController::class,'createEmployee']);

