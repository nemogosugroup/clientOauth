<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

class CheckRoles
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next, ...$roles)
    {
        $userRoles = json_decode(auth()->user()->roles,true);
        $hasAccess = !empty(array_intersect($userRoles, $roles));
        if ($hasAccess) {
            // Nếu người dùng có quyền truy cập, tiếp tục xử lý yêu cầu
            return $next($request);
        } else {
            // Nếu không có quyền truy cập, xử lý theo ý muốn của bạn
            return new JsonResponse(['error' => 'Unauthorized'], 403);
        }
    }
}
