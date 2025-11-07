<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Employee;

class EmployeeController extends Controller
{
    public function getEmployee(){
        $employees = Employee::all();
        return response() -> json([
            'message' => 'ok',
            'employee' => $employees
        ],200);
    }

    public function createEmployee(Request $request){
        $request->validate([
            'employee_name' => 'required|string|max:255',
            'experience_in_years' => 'required|integer|min:0',
            'is_active' => 'required|boolean',
        ]);

        $employee = Employee::create([
            'employee_name' => $request->employee_name,
            'experience_in_years' => $request->experience_in_years,
            'is_active' => $request->is_active,
        ]);
        
        return response()->json([
            'message' => 'ok',
            'employee' => $employee
        ], 201);
    }
}
