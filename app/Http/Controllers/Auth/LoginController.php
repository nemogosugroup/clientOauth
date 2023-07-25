<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
    public function login(Request $request)
    {
        // $query = "SELECT data AS json_result FROM tn_vote WHERE TYPE = 'DOT-1-2023' AND tn_vote.data LIKE '%\"active\":1%'";
        // $jsonResult = DB::select(DB::raw($query));
        // dd($jsonResult);die;
        return view('auth/login');
    }

    /**
     * Log the user out of the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\JsonResponse
     */
    public function logout(Request $request)
    {
        
        if (Auth::check()) {
            // Người dùng đã đăng nhập, thực hiện mã lệnh tại đây
            Auth::user()->logoutFromSSO();
            
        }


        $this->guard()->logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();
        $sessionCookieName = config('session.cookie');
        $response = new \Illuminate\Http\Response();
        if ($response = $this->loggedOut($request)) {
            return $response;
        }


        // $access_token = $request->session()->get("access_token");
        //     Http::withHeaders([
        //         "Accept" => "application/json",
        //         "Authorization" => "Bearer " . $access_token
        //     ])->get(config("auth.sso_host") .  "/logout");
        $request->session()->put("state", $state =  Str::random(40));
        $query = http_build_query([
            "client_id" => config("auth.client_id"),
            "redirect_uri" => config("auth.callback") ,
            "response_type" => "code",
            "scope" => config("auth.scopes"),
            "state" => $state,
            "prompt" => true
        ]);
        return redirect(config("auth.sso_host") .  "/logout?".$query);
        // return $request->wantsJson()
        //     ? new JsonResponse([], 204)
        //     : redirect('/');
    }
    /**
     * Log the user out of the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\JsonResponse
     */
    public function logoutClient(Request $request)
    {
        if (Auth::check()) {
            Auth::user()->logoutFromSSO();
        }

        $this->guard()->logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return JsonResponse(['message' => 'Logged out successfully'], 200);
    }
}
