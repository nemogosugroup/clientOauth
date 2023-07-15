<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Models\Vote;
use App\Models\VoteOptions;
use App\Models\VoteHistory;

class VoteController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth');
    }

    // /**
    //  * Show the application dashboard.
    //  *
    //  * @return \Illuminate\Contracts\Support\Renderable
    //  */
    // public function index()
    // {
    //     return view('home');
    // }
    public function add(Request $request)
    {
        $name = $request->input('name');
        $voteOptions = $request->input('vote_options') ?? "[]";
        $voteOptions = json_decode($voteOptions, true);
        $type = $request->input('type');
        $typeView = $request->input('type_view');
        // $vote = new Vote([
        //     'name' => $name,
        //     'type' => $type,
        //     'typeView' => $typeView,
        // ]);
        // $vote->save();
        // foreach ($voteOptions as $voteOption) {
        //     $voteOptionModel = new VoteOptions([
        //         'vote_id' => $vote->id,
        //         'name' => $voteOption,
        //     ]);
        //     $voteOptionModel->save();
        // }


        // ----
        DB::beginTransaction();

        try {
            $vote = new Vote([
                'name' => $name,
                'type' => $type,
                'typeView' => $typeView,
            ]);
            $vote->save();

            foreach ($voteOptions as $voteOption) {
                $voteOptionModel = new VoteOptions([
                    'vote_id' => $vote->id,
                    'name' => $voteOption,
                ]);
                $voteOptionModel->save();
            }


            DB::commit();

            $response = [
                "status" => 200,
                "message" => "success",
                "data" => ['voteOptions' => $voteOptions],
                "success" => true
            ];
            return response()->json($response);
        } catch (\Exception $e) {
            DB::rollback();

            $response = [
                "status" => 500,
                "message" => "error",
                "data" => [],
                "success" => false
            ];
            return response()->json($response);
        }
        // ----
        $response = [
            "status"=> 200,
            "message"=>"success",
            "data"=>['voteOptions'=>$voteOptions],
            "success"=>true
        ];
        return response()->json($response);
    }

    public function setStatus(Request $request)
    {
        $id = $request->input('id');
        $action = $request->input('action');
        if ($request->input('action') === 'on') {
            $action = 1;
        } elseif ($request->input('action') === 'off') {
            $action = 0;
        }else{
            $response = [
                "status"=> 200,
                "message"=>"Xử lý thất bại",
                "data"=>[],
                "success"=>false
            ];
            return response()->json($response);
        }
        $vote = Vote::where("id", $id)->first();
        if(!$vote){
            $response = [
                "status"=> 200,
                "message"=>"Không tìm thấy!",
                "data"=>[],
                "success"=>false
            ];
            return response()->json($response);
        }
        $vote->status = $action;
        $vote->save();
        
        $response = [
            "status"=> 200,
            "message"=>"success",
            "data"=>[],
            "success"=>true
        ];
        return response()->json($response);
    }
    public function getInfo(Request $request)
    {
        $id = $request->input('id');
        

        $vote = Vote::where("id", $id)->first();
        if(!$vote){
            $response = [
                "status"=> 200,
                "message"=>"Không tìm thấy!",
                "data"=>[],
                "success"=>false
            ];
            return response()->json($response);
        }
        $voteOptions = VoteOptions::where("vote_id", $id)->get();
        $voteInfo = [
            'id' =>$id,
            'name' => $vote->name,
            'type' => $vote->type,
            'type_view' => $vote->type_view,
            'status' => $vote->status,
            'oftion' => $voteOptions
        ];
        $response = [
            "status"=> 200,
            "message"=>"success",
            "data"=>['voteInfo'=>$voteInfo],
            "success"=>true
        ];
        return response()->json($response);
    }

    public function getAll(Request $request)
    {
        

        $votes = Vote::get();
        
        $response = [
            "status"=> 200,
            "message"=>"success",
            "data"=>['votes'=>$votes],
            "success"=>true
        ];
        return response()->json($response);
    }

    public function vote(Request $request)
    {
        $user = $request->user();
        $id = $request->input('id');
        $voteOptions = $request->input('options') ?? "[]";
        $voteOptions = json_decode($voteOptions, true);
        if(!$user){
            $response = [
                "status"=> 200,
                "message"=>"không tìm thấy tài khoản này!",
                "data"=>[],
                "success"=>false
            ];
            return response()->json($response);
        }
        if(!$id){
            $response = [
                "status"=> 200,
                "message"=>"Id không tìm thấy",
                "data"=>[],
                "success"=>false
            ];
            return response()->json($response);
        }

        $history = Vote::where('vote.id', $id)
        ->join('vote_options', 'vote.id', '=', 'vote_options.vote_id')
        ->join('vote_history', 'vote_options.id', '=', 'vote_history.vote_option_id')
        ->select('vote_history.*', 'vote_options.name as vote_option_name','vote.name as vote_name')
        ->get();
        if(count($history)){
            $response = [
                "status"=> 200,
                "message"=>"Bạn đã vote trước đó",
                "data"=>['history'=>$history],
                "success"=>false
            ];
            return response()->json($response);
        }
        $vote = Vote::where("id", $id)->first();
        if(!$vote ||$vote->status == 0 ){
            $response = [
                "status"=> 200,
                "message"=>"Không tìm thấy đợt vote này",
                "data"=>[],
                "success"=>false
            ];
        }
        foreach ($voteOptions as $voteOption) {
            $voteOptionModel  = VoteOptions::where("id", $voteOption)->first();
            if($voteOptionModel  && $voteOptionModel ->vote_id = $id){
                $voteOptionModel->increment('total_voted');
                $voteOptionModel->save();
                $newVoteHistory = new VoteHistory([
                    'user_id' => $user->id,
                    'vote_option_id' => $voteOptionModel->id,
                ]);
                $newVoteHistory->save();
            }
        }
        $newVoteOptions = VoteOptions::where("vote_id", $id)->get();
        $voteInfo = [
            'id' =>$id,
            'name' => $vote->name,
            'type' => $vote->type,
            'type_view' => $vote->type_view,
            'status' => $vote->status,
            'oftion' => $newVoteOptions
        ];
        $response = [
            "status"=> 200,
            "message"=>"success",
            "data"=>['voteInfo'=>$voteInfo],
            "success"=>true
        ];
        return response()->json($response);
    }
    
}
