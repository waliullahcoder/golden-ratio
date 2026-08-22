<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Symfony\Component\HttpFoundation\Response;

class Admin
{
    /**
     * Handle an incoming request.
     */
    public function handle(Request $request, Closure $next): Response
    {
        if (Auth::check()) {
            return $next($request);
        }

        // guest user হলে intended URL save করবে
        if ($request->method() === 'GET' && !$request->ajax()) {
            Session::put('url.intended', $request->fullUrl());
        }

        return redirect()->route('admin.login.index');
    }
}
