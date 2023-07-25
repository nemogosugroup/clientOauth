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
        dump("check 1");die;
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
        // $query = "SELECT username, data AS json_result FROM tn_vote WHERE TYPE = 'DOT-1-2023' AND tn_vote.data LIKE '%\"active\":1%'";
        // $jsonResult = DB::select(DB::raw($query));
        // foreach ($jsonResult as $row) {
        //     $jsonResultData = $row->json_result;
        //     $userName =  $row->username;
        //     // Thực hiện các xử lý khác với $jsonResultData
        //     // Ví dụ: chuyển đổi $jsonResultData thành đối tượng JSON
            
        //     $jsonData = json_decode($jsonResultData);
            
        //     // Sử dụng $jsonData cho mục đích khác
            
        //     // Ví dụ: truy cập thuộc tính trong đối tượng JSON
            
        //     foreach ($jsonData as $row1) {
        //         $jsonResultData2 = $row1->list;
        //         foreach($jsonResultData2 as $row2) {
        //             $jsonResultElementData = $row2;
        //             if($jsonResultElementData->note != "" ){
        //                 dump($userName."-".$jsonResultElementData->firstname." ".$jsonResultElementData->lastname."-".$jsonResultElementData->active."-".$jsonResultElementData->note);
        //             }
        //         }
        //     }
        //     // Hoặc truy cập các phần tử trong mảng JSON
        //     // foreach ($jsonData as $key => $value) {
        //     //     // Xử lý từng phần tử trong mảng JSON
        //     // }
        // }
        // die;
        // dd($jsonResult);die;
        // die;
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

        return $request->wantsJson()
            ? new JsonResponse([], 204)
            : redirect('/');
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
