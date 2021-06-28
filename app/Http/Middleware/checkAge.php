<?php

namespace App\Http\Middleware;

use Closure;
use Auth;

class checkAge
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {

        $age = Auth::user()->age;

        if($age < 15){
            return redirect()->route('home');
        }
        return $next($request);
    }
}
