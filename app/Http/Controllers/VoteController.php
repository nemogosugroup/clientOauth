<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Models\Vote;
use App\Models\VoteQuestions;
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
        $title = $request->input('title');
        $questions = $request->input('questions') ?? "[]";
        $questions = json_decode($questions, true);
        if (json_last_error() !== 0) {
            $response = [
                "status" => 200,
                "message" => "xử lý dữ liệu false",
                "data" => [],
                "success" => false
            ];
            return response()->json($response);
            
        }
        $typeView = $request->input('type_view');
        // $vote = new Vote([
        //     'title' => $title,
        //     'typeView' => $typeView,
        // ]);
        // $vote->save();
        // foreach ($questions as $question) {
        //     $voteQuestionModel = new VoteQuestions([
        //         'vote_id' => $vote->id,
        //         'question' => $question['question'],
        //         'type' => $question['type'],
        //     ]);
        //     $voteQuestionModel->save();
        //     $voteOptions = $question['options'];
        //     foreach ($voteOptions as $voteOption) {
        //         $voteOptionModel = new VoteOptions([
        //             'question_id' => $voteQuestionModel->id,
        //             'option' => $voteOption['answer_value'],
        //         ]);
        //         $voteOptionModel->save();
        //     }
        // }


        // ----
        DB::beginTransaction();

        try {
            $vote = new Vote([
                'title' => $title,
                'typeView' => $typeView,
            ]);
            $vote->save();
            foreach ($questions as $question) {
                switch ($question['type']) {
                    case 1:
                        $voteQuestionModel = new VoteQuestions([
                            'vote_id' => $vote->id,
                            'question' => $question['question'],
                            'type' => $question['type'],
                        ]);
                        $voteQuestionModel->save();
                        $voteOptions = $question['options'];
                        foreach ($voteOptions as $voteOption) {
                            $voteOptionModel = new VoteOptions([
                                'question_id' => $voteQuestionModel->id,
                                'option' => $voteOption['answer_value'],
                            ]);
                            $voteOptionModel->save();
                        }
                        break;
                    case 2:
                        $voteQuestionModel = new VoteQuestions([
                            'vote_id' => $vote->id,
                            'question' => $question['question'],
                            'type' => $question['type'],
                        ]);
                        $voteQuestionModel->save();
                        $voteOptions = $question['options'];
                        foreach ($voteOptions as $voteOption) {
                            $voteOptionModel = new VoteOptions([
                                'question_id' => $voteQuestionModel->id,
                                'option' => $voteOption['answer_value'],
                            ]);
                            $voteOptionModel->save();
                        }
                        break;
                    case 3:
                        $voteQuestionModel = new VoteQuestions([
                            'vote_id' => $vote->id,
                            'question' => $question['question'],
                            'type' => $question['type'],
                        ]);
                        $voteQuestionModel->save();
                        $voteOptionModel = new VoteOptions([
                            'question_id' => $voteQuestionModel->id,
                            'option' => $question['question'],
                        ]);
                        $voteOptionModel->save();
                        break;
                    
                    default:
                        # code...
                        break;
                }
            }


            DB::commit();

            $response = [
                "status" => 200,
                "message" => "success",
                "data" => [],
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

    public function update(Request $request)
    {
        $voteId = $request->input('vote_id');
        $type_view = $request->input('type_view');
        $questions = $request->input('questions') ?? "[]";
        $questions = json_decode($questions, true);
        if (json_last_error() !== 0) {
            $response = [
                "status" => 200,
                "message" => "xử lý dữ liệu false",
                "data" => [],
                "success" => false
            ];
            return response()->json($response);
            
        }
        $typeView = $request->input('type_view');
        $vote = Vote::where("id", $voteId)->first();
        if(!$vote){
            $response = [
                "status"=> 200,
                "message"=>"Không tìm thấy!",
                "data"=>[],
                "success"=>false
            ];
            return response()->json($response);
        }
        foreach ($questions as $question) {
            if($question['options'] && count($question['options']) >0 ){
                $questionId = $question['question_id'] ?? 0;
                if($questionId > 0){
                    $voteQuestionModel = VoteQuestions::where("id", $question['question_id'])->where("vote_id", $voteId)->first();
                    if(!$voteQuestionModel){
                        $response = [
                            "status"=> 200,
                            "message"=>"Không tìm thấy!",
                            "data"=>[],
                            "success"=>false
                        ];
                        return response()->json($response);
                    }
                }else{
                    $voteQuestionModel = new VoteQuestions([
                        'vote_id' => $vote->id,
                        'question' => $question['question'],
                        'type' => $question['type'],
                    ]);
                    $voteQuestionModel->save();
                }
    
                $voteOptions = $question['options'];
                foreach ($voteOptions as $voteOption) {
                    $voteOptionModel = new VoteOptions([
                        'question_id' => $voteQuestionModel->id,
                        'option' => $voteOption['answer_value'],
                    ]);
                    $voteOptionModel->save();
                }
            }
            
        }


        // ----
        DB::beginTransaction();

        try {
            $vote = Vote::where("id", $voteId)->first();
            if(!$vote){
                $response = [
                    "status"=> 200,
                    "message"=>"Không tìm thấy!",
                    "data"=>[],
                    "success"=>false
                ];
                return response()->json($response);
            }
            foreach ($questions as $question) {
                if($question['options'] && count($question['options']) >0 ){
                    $questionId = $question['question_id'] ?? 0;
                    if($questionId > 0){
                        $voteQuestionModel = VoteQuestions::where("id", $question['question_id'])->where("vote_id", $voteId)->first();
                        if(!$voteQuestionModel){
                            $response = [
                                "status"=> 200,
                                "message"=>"Không tìm thấy!",
                                "data"=>[],
                                "success"=>false
                            ];
                            return response()->json($response);
                        }
                    }else{
                        $voteQuestionModel = new VoteQuestions([
                            'vote_id' => $vote->id,
                            'question' => $question['question'],
                            'type' => $question['type'],
                        ]);
                        $voteQuestionModel->save();
                    }
        
                    $voteOptions = $question['options'];
                    foreach ($voteOptions as $voteOption) {
                        $voteOptionModel = new VoteOptions([
                            'question_id' => $voteQuestionModel->id,
                            'option' => $voteOption['answer_value'],
                        ]);
                        $voteOptionModel->save();
                    }
                }
                
            }
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
            "data"=>[],
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
        $voteId = $request->input('id');
        $data = Vote::select(
            'vote.id', 
            'vote.title','vote_questions.question as question', 'vote_questions.type as type', 'vote_questions.id as question_id', 'vote_options.option as option', 'vote_options.id as option_id','vote_options.total_voted as total_voted')
        ->join('vote_questions', 'vote.id', '=', 'vote_questions.vote_id')
        ->join('vote_options', 'vote_questions.id', '=', 'vote_options.question_id')
        ->where('vote.id', $voteId)
        ->get();

        $result = [];
        foreach ($data as $item) {
            $result[$item->id]['vote_id'] = $item->id;
            $result[$item->id]['title'] = $item->title;
            $result[$item->id]['questions'][$item->question_id]['type'] = $item->type;
            $result[$item->id]['questions'][$item->question_id][$item->question][] = [
                'option_id'=>$item->option_id,
                'option'=>$item->option,
                'total_voted'=>$item->total_voted
            ];
        }
        $response = [
            "status"=> 200,
            "message"=>"success",
            "data"=>['voteInfo'=>$result],
            "success"=>true
        ];
        return response()->json($response);
    }

    public function getAll(Request $request)
    {
        

        $data = Vote::select('vote.id', 'vote.title','vote_questions.question as question', 'vote_questions.type as type', 'vote_questions.id as question_id', 'vote_options.option as option', 'vote_options.id as option_id','vote_options.total_voted as total_voted')
        ->join('vote_questions', 'vote.id', '=', 'vote_questions.vote_id')
        ->join('vote_options', 'vote_questions.id', '=', 'vote_options.question_id')
        // ->where('vote.id', $id)
        ->get();

        $result = [];
        foreach ($data as $item) {
            $result[$item->id]['vote_id'] = $item->id;
            $result[$item->id]['title'] = $item->title;
            $result[$item->id]['questions'][$item->question_id]['type'] = $item->type;
            $result[$item->id]['questions'][$item->question_id][$item->question][] = [
                'option_id'=>$item->option_id,
                'option'=>$item->option,
                'total_voted'=>$item->total_voted];
        }
        $response = [
            "status"=> 200,
            "message"=>"success",
            "data"=>['voteInfo'=>$result],
            "success"=>true
        ];
        return response()->json($response);
    }

    public function vote(Request $request)
    {
        $user = $request->user();
        $id = $request->input('id');
        $voteInfos = $request->input('vote_info');
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
        ->join('vote_questions', 'vote.id', '=', 'vote_questions.vote_id')
        ->join('vote_options', 'vote_questions.id', '=', 'vote_options.question_id')
        ->join('vote_history', 'vote_options.id', '=', 'vote_history.vote_option_id')
        ->select('vote_history.*', 'vote_options.option as option','vote.title as vote_title')
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

        // xử lý vote start
        

        // ----
        DB::beginTransaction();

        try {
            $vote = Vote::where("id", $id)->first();
            if(!$vote ||$vote->status == 0 ){
                throw new \Exception("Không tìm thấy đợt vote này");
            }
            foreach ($voteInfos as $index => $voteOptions) {
                $voteQuestion = VoteQuestions::where("id", $index)
                    ->where("vote_id", $id)
                    ->first();
                if($voteQuestion){
                    switch ($voteQuestion->type) {

                        case 1:
                            foreach ($voteOptions as $voteOption) {
                                $voteOptionModel  = VoteOptions::where("id", $voteOption)->where("question_id",$index)->first();
                                if($voteOptionModel){
                                    $voteOptionModel->increment('total_voted');
                                    $voteOptionModel->save();
                                    $newVoteHistory = new VoteHistory([
                                        'user_id' => $user->id,
                                        'vote_option_id' => $voteOptionModel->id,
                                    ]);
                                    $newVoteHistory->save();
                                }
                            }
                            break;
                        case 2:
                            if(count($voteOptions)>1){
                                throw new \Exception("Chỉ 1 đáp án cho câu :".$voteQuestion->question."!");
                            }
                            $voteOptionModel  = VoteOptions::where("id", $voteOptions[0])->where("question_id",$index)->first();
                            if($voteOptionModel){
                                $voteOptionModel->increment('total_voted');
                                $voteOptionModel->save();
                                $newVoteHistory = new VoteHistory([
                                    'user_id' => $user->id,
                                    'vote_option_id' => $voteOptionModel->id,
                                ]);
                                $newVoteHistory->save();
                            }
                            break;
                        case 3:
                            if(!is_string($voteOptions)){
                                throw new \Exception("Đáp án không hợp lệ cho câu :".$voteQuestion->question."!");
                            }
                            $voteOptionModel  = VoteOptions::where("question_id",$index)->first();
                            if($voteOptionModel){
                                $voteOptionModel->increment('total_voted');
                                $voteOptionModel->save();
                                $newVoteHistory = new VoteHistory([
                                    'user_id' => $user->id,
                                    'vote_option_id' => $voteOptionModel->id,
                                    'answer'=> $voteOptions
                                ]);
                                $newVoteHistory->save();
                            }
                            break;
                        default:
                            # code...
                            break;
                    }
                }
            }
            
            DB::commit();
        } catch (\Exception $e) {
            DB::rollback();

            $response = [
                "status" => 200,
                "message" => $e->getMessage(),
                "data" => [],
                "success" => false
            ];
            return response()->json($response);
        }
        // ----

        // xử lý vote end
        $data = Vote::select('vote.id', 'vote_questions.question as question', 'vote_options.option as option', 'vote_options.id as option_id','vote_options.total_voted as total_voted')
        ->join('vote_questions', 'vote.id', '=', 'vote_questions.vote_id')
        ->join('vote_options', 'vote_questions.id', '=', 'vote_options.question_id')
        ->where('vote.id', $id)
        ->get();

        $result = [];
        foreach ($data as $item) {
            $result[$item->id]['vote_id'] = $item->id;
            $result[$item->id]['questions'][$item->question][] = ['option_id'=>$item->option_id,'option'=>$item->option,'total_voted'=>$item->total_voted];
        }

        $response = [
            "status"=> 200,
            "message"=>"success",
            "data"=>['voteInfo'=>$result],
            "success"=>true
        ];
        return response()->json($response);
    }
    
}
