<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;

class AutenticationController extends Controller
{
    public function adualt(){

        return view('custom.index');

    }

    public function site(){
        return view('site');
    }

    public function admin(){
        return view('admin');
    }

    public function adminLogin(){
        return view('auth.adminLogin');
    }

    public function checkAdminLogin(Request $request){

        $this->validate($request,[
            'email' => 'required|email',
            'password' => 'required|min:6'

        ]);

        if(Auth::guard('admin')->attempt([
            'email' => $request->email,
            'password' => $request->password])){
                return redirect()->intended('/admin');

            }

            return back()->withInput($request->only('email'));


    }
}
