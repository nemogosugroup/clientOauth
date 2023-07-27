<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Models\Vote;
use App\Models\Voted;
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
                            'is_required' => isset($question['is_required']) && $question['is_required'] == true ? 1 : 0,

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
                            'is_required' => isset($question['is_required']) && $question['is_required'] == true ? 1 : 0,

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
                            'is_required' => isset($question['is_required']) && $question['is_required'] == true ? 1 : 0,

                        ]);
                        $voteQuestionModel->save();
                        $voteOptionModel = new VoteOptions([
                            'question_id' => $voteQuestionModel->id,
                            'option' => $question['question'],
                        ]);
                        $voteOptionModel->save();
                        break;
                    // case 4:
                        // $voteQuestionModel = new VoteQuestions([
                        //     'vote_id' => $vote->id,
                        //     'question' => $question['question'],
                        //     'type' => $question['type'],
                        //     'is_required' => isset($question['is_required']) && $question['is_required'] == true ? 1 : 0,

                        // ]);
                        // $voteQuestionModel->save();
                        // $voteOptions = $question['options'];
                        // foreach ($voteOptions as $voteOption) {
                        //     $voteOptionModel = new VoteOptions([
                        //         'question_id' => $voteQuestionModel->id,
                        //         'option' => $voteOption['answer_value'],
                        //     ]);
                        //     $voteOptionModel->save();
                        // }
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
        if ($vote->is_public !== 0) {
            $response = [
                "status" => 200,
                "message" => "Trang vote đã được public, không được phép xoá.",
                "data" => [],
                "success" => false
            ];
            return response()->json($response);
        }
        $vote->title = $title;
        $vote->save();
        foreach ($questions as $question) {
            if (isset($question['sub_type']) && $question['sub_type'] === 'new') {
                // thêm mới question
                switch ($question['type']) {
                    case 1:
                        $voteQuestionModel = new VoteQuestions([
                            'vote_id' => $vote->id,
                            'question' => $question['question'],
                            'type' => $question['type'],
                            'is_required' => isset($question['is_required']) && $question['is_required'] == true ? 1 : 0,
                        ]);
                        $voteQuestionModel->save();
                        $voteOptions = $question['options'];
                        foreach ($voteOptions as $voteOption) {
                            $voteOptionModel = new VoteOptions([
                                'question_id' => $voteQuestionModel->id,
                                'option' => $voteOption['option'],
                            ]);
                            $voteOptionModel->save();
                        }
                        break;
                    case 2:
                        $voteQuestionModel = new VoteQuestions([
                            'vote_id' => $vote->id,
                            'question' => $question['question'],
                            'type' => $question['type'],
                            'is_required' => isset($question['is_required']) && $question['is_required'] == true ? 1 : 0,

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
                            'is_required' => isset($question['is_required']) && $question['is_required'] == true ? 1 : 0,

                        ]);
                        $voteQuestionModel->save();
                        $voteOptionModel = new VoteOptions([
                            'question_id' => $voteQuestionModel->id,
                            'option' => $question['question'],
                        ]);
                        $voteOptionModel->save();
                        break;
                        break;
                    
                    default:
                        # code...
                        break;
                }
            }elseif(isset($question['sub_type']) && $question['sub_type'] == 'remove'){
                // xoá question.

                // 1. xoá history nếu có
                VoteHistory::join('vote_options', 'vote_history.vote_option_id', '=', 'vote_options.id')
                ->where('vote_options.question_id', '=', $question['question_id'])
                ->delete();
                // 2. xoá các option
                VoteOptions::where('vote_options.question_id', '=', $question['question_id'])
                ->delete();
                // 3. xoá question
                VoteQuestions::where('vote_questions.id', '=', $question['question_id'])
                ->delete();
            }else{
                //update
                $voteQuestionModel = VoteQuestions::where("vote_id", $voteId)->where("id", $question['question_id'])->first();
                if($voteQuestionModel){
                    $voteQuestionModel->question = $question['question'];
                    $voteQuestionModel->type = $question['type'];
                    $voteQuestionModel->is_required = $question['is_required'];
                    $voteQuestionModel->save();
                    switch ($question['type']) {
                        case 1:
                            // update question
                            
                            if($voteQuestionModel){
                                $voteOptions = $question['options'];
    
                                foreach ($voteOptions as $voteOption) {
                                    if(isset($voteOption['sub_type']) && $voteOption['sub_type'] === 'new'){
                                        // thêm mới option
                                        $voteOptionModel = new VoteOptions([
                                            'question_id' => $voteQuestionModel->id,
                                            'option' => $voteOption['option'],
                                        ]);
                                        $voteOptionModel->save();
                                    }elseif(isset($voteOption['sub_type']) && $voteOption['sub_type'] == 'remove'){
                                        // 1. xoá history nếu có
                                        VoteHistory::join('vote_options', 'vote_history.vote_option_id', '=', 'vote_options.id')
                                        ->where('vote_options.question_id', '=', $voteQuestionModel->id)
                                        ->where('vote_options.id', '=', $voteOption['option_id'])
                                        ->delete();
                                        // 2. xoá các option
                                        VoteOptions::where('vote_options.question_id', '=', $voteQuestionModel->id)
                                        ->where('vote_options.id', '=', $voteOption['option_id'])
                                        ->delete();
                                    }else{
                                        //update
                                        $voteOptionModel = VoteOptions::where("id", $voteOption['option_id'])->first();
                                        if($voteOptionModel){
                                            $voteOptionModel->option = $voteOption['option'];
                                            $voteOptionModel->save();
                                        }
                                    } 
                                }
                            }
                            
                            break;
                        case 2:
                            if($voteQuestionModel){
                                $voteOptions = $question['options'];
    
                                foreach ($voteOptions as $voteOption) {
                                    if(isset($voteOption['sub_type']) && $voteOption['sub_type'] === 'new'){
                                        // thêm mới option
                                        $voteOptionModel = new VoteOptions([
                                            'question_id' => $voteQuestionModel->id,
                                            'option' => $voteOption['option'],
                                        ]);
                                        $voteOptionModel->save();
                                    }elseif(isset($voteOption['sub_type']) && $voteOption['sub_type'] == 'remove'){
                                        // 1. xoá history nếu có
                                        VoteHistory::join('vote_options', 'vote_history.vote_option_id', '=', 'vote_options.id')
                                        ->where('vote_options.question_id', '=', $voteQuestionModel->id)
                                        ->where('vote_options.id', '=', $voteOption['option_id'])
                                        ->delete();
                                        // 2. xoá các option
                                        VoteOptions::where('vote_options.question_id', '=', $voteQuestionModel->id)
                                        ->where('vote_options.id', '=', $voteOption['option_id'])
                                        ->delete();
                                    }else{
                                        //update
                                        $voteOptionModel = VoteOptions::where("id", $voteOption['option_id'])->first();
                                        if($voteOptionModel){
                                            $voteOptionModel->option = $voteOption['option'];
                                            $voteOptionModel->save();
                                        }
                                    } 
                                }
                            }
                            break;
                        case 3:
                            // 1. xoá history nếu có
                            VoteHistory::join('vote_options', 'vote_history.vote_option_id', '=', 'vote_options.id')
                            ->where('vote_options.question_id', '=', $voteQuestionModel->id)
                            ->delete();
                            // 2. xoá các option
                            VoteOptions::where('vote_options.question_id', '=', $voteQuestionModel->id)
                            ->delete();
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
                
            }
        }
        // DB::beginTransaction();

        // try {
            

        //     DB::commit();

        //     $response = [
        //         "status" => 200,
        //         "message" => "success",
        //         "data" => [],
        //         "success" => true
        //     ];
        //     return response()->json($response);
        // } catch (\Exception $e) {
        //     DB::rollback();

        //     $response = [
        //         "status" => 500,
        //         "message" => "error",
        //         "data" => $e,
        //         "success" => false
        //     ];
        //     return response()->json($response);
        // }
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
            'vote.status', 
            'vote.is_public', 
            'vote.title',
            'vote_questions.question as question', 
            'vote_questions.type as type', 
            'vote_questions.is_required as is_required', 
            'vote_questions.id as question_id', 
            'vote_options.option as option', 
            'vote_options.id as option_id',
            'vote_options.total_voted as total_voted')
        ->join('vote_questions', 'vote.id', '=', 'vote_questions.vote_id')
        ->join('vote_options', 'vote_questions.id', '=', 'vote_options.question_id')
        ->where('vote.id', $voteId)
        ->get();

        $user = $request->user();
        $isVoted = Voted::where('user_id', $user->id)
            ->where('vote_id', $voteId)
            ->exists();

        $result = [];
        foreach ($data as $item) {
            $result[$item->id]['vote_id'] = $item->id;
            $result[$item->id]['title'] = $item->title;
            $result[$item->id]['status'] = $item->status;
            $result[$item->id]['is_public'] = $item->is_public;
            $result[$item->id]['questions'][$item->question_id]['type'] = $item->type;
            $result[$item->id]['questions'][$item->question_id]['is_required'] = $item->is_required == 1;
            $result[$item->id]['questions'][$item->question_id]['question_id'] = $item->question_id;
            $result[$item->id]['questions'][$item->question_id]['question'] = $item->question;
            $result[$item->id]['questions'][$item->question_id]['options'][] = [
                'option_id'=>$item->option_id,
                'option'=>$item->option,
                'total_voted'=>$item->total_voted
            ];
        }
        $response = [
            "status"=> 200,
            "message"=>"success",
            "data"=>['voteInfo'=>$result,'is_voted'=>$isVoted],
            "success"=>true
        ];
        return response()->json($response);
    }

    public function search(Request $request)
    {
        $keyword = $request->input('search');
        $keyword = $keyword ?? null;
        
        // if ($keyword == null) {
        //     $response = [
        //         "status"=> 200,
        //         "message"=>"success",
        //         "data"=>['voteInfo'=>[]],
        //         "success"=>true
        //     ];
        //     return response()->json($response);
        // }
        $limit = $request->input('limit');
        $data = Vote::select(
            'vote.id', 
            'vote.status', 
            'vote.title'
        );
        if($keyword) {
            $data->where('vote.title', 'LIKE', "%".$keyword."%"); // Sử dụng 'LIKE' ở đây
        }
        // Nếu $limit có giá trị, thì giới hạn số lượng kết quả trả về
        $data->orderBy('vote.id', 'desc');
        if ($limit) {
            $data = $data->limit((int)$limit)->get();
        } else {
            $data = $data->get();
        }
       

        $result = [];
        $response = [
            "status"=> 200,
            "message"=>"success",
            "data"=>['voteInfo'=>$data,'countVoteInfo'=>count($data)],
            "success"=>true
        ];
        return response()->json($response);
    }

    public function getAll(Request $request)
    {
        $data = Vote::select(
            'vote.id',
            'vote.status',
            'vote.title',
            'vote_questions.question as question',
            'vote_questions.type as type',
            'vote_questions.is_required as is_required',
            'vote_questions.id as question_id',
            'vote_options.option as option',
            'vote_options.id as option_id',
            'vote_options.total_voted as total_voted',
            DB::raw('JSON_UNQUOTE(JSON_ARRAYAGG(vote_history.answer)) as answer')
        )
        ->join('vote_questions', 'vote.id', '=', 'vote_questions.vote_id')
        ->join('vote_options', 'vote_questions.id', '=', 'vote_options.question_id')
        ->leftJoin('vote_history', 'vote_history.vote_option_id', '=', 'vote_options.id')
        // ->where('vote.id', $id)
        ->groupBy(
            'vote.id',
            'vote.status',
            'vote.title',
            'vote_questions.question',
            'vote_questions.type',
            'vote_questions.id',
            'vote_options.option',
            'vote_options.id',
            'vote_options.total_voted'
        )
        ->get();

        $result = [];
        foreach ($data as $item) {
            $result[$item->id]['vote_id'] = $item->id;
            $result[$item->id]['title'] = $item->title;
            $result[$item->id]['status'] = $item->status;
            $result[$item->id]['questions'][$item->question_id]['type'] = $item->type;
            $result[$item->id]['questions'][$item->question_id]['is_required'] = $item->is_required;
            $result[$item->id]['questions'][$item->question_id]['question_id'] = $item->question_id;
            $result[$item->id]['questions'][$item->question_id]['question'] = $item->question;
            $answer = $item->answer != "[null]" ? utf8_encode($item->answer) : [];
            $result[$item->id]['questions'][$item->question_id]['options'][] = [
                'option_id'=>$item->option_id,
                'option'=>$item->option,
                'total_voted'=>$item->total_voted,
                'answer'=>$answer
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
    public function getCountVote()
    {
        $count = Vote::count();

        
        $response = [
            "status"=> 200,
            "message"=>"success",
            "data"=>['count_vote'=>$count],
            "success"=>true
        ];
        return response()->json($response);
    }
    
    public function vote(Request $request)
    {
        $user = $request->user();
        $id = $request->input('id');
        $voteInfos = $request->input('vote_info') ?? "[]";
        $voteInfos = json_decode($voteInfos, true);
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

        $isVoted = Voted::select('id')
        // ->join('vote_questions', 'vote.id', '=', 'vote_questions.vote_id')
        // ->join('vote_options', 'vote_questions.id', '=', 'vote_options.question_id')
        // ->join('vote_history', 'vote_options.id', '=', 'vote_history.vote_option_id')
        ->where('voted.vote_id', $id)
        ->where('voted.user_id',$user->id)
        ->exists();
        if($isVoted){
            $response = [
                "status"=> 200,
                "message"=>"Bạn đã vote trước đó",
                "data"=>[],
                "success"=>false
            ];
            return response()->json($response);
        }

        // xử lý vote start
        

        // ----
        DB::beginTransaction();

        try {
            $vote = Vote::where("id", $id)->first();
            if(!$vote){
                throw new \Exception("Không tìm thấy đợt vote này");
            }
            if($vote && $vote->status == 0 ){
                throw new \Exception("Thời gian vote đã kết thúc");
            }
            $newVoted= new Voted([
                'user_id' => $user->id,
                'vote_id' => $id,
            ]);
            foreach ($voteInfos as $index => $voteOptions) {
                $voteQuestion = VoteQuestions::where("id", $index)
                    ->where("vote_id", $id)
                    ->first();
                $newVoted->save();
                if($voteQuestion){
                    switch ($voteQuestion->type) {
                        case 1:
                            if(count($voteOptions)>0){
                                
                                foreach ($voteOptions as $voteOption) {
                                    $voteOptionModel  = VoteOptions::where("id", $voteOption)->where("question_id",$index)->first();
                                    if($voteOptionModel){
                                        $voteOptionModel->increment('total_voted');
                                        $voteOptionModel->save();
                                        if($vote->is_anonymous !== 1){
                                            $newVoteHistory = new VoteHistory([
                                                'user_id' => $user->id,
                                                'vote_option_id' => $voteOptionModel->id,
                                            ]);
                                            $newVoteHistory->save();
                                        }
                                        
                                    }
                                }
                            }
                            break;
                        case 2:
                            if(count($voteOptions) > 1){
                                throw new \Exception("Chỉ 1 đáp án cho câu :".$voteQuestion->question."!");
                            }
                            if(count($voteOptions) > 0){
                                $voteOptionModel  = VoteOptions::where("id", $voteOptions[0])->where("question_id",$index)->first();
                                if($voteOptionModel){
                                    $voteOptionModel->increment('total_voted');
                                    $voteOptionModel->save();
                                    if($vote->is_anonymous !== 1){
                                        $newVoteHistory = new VoteHistory([
                                            'user_id' => $user->id,
                                            'vote_option_id' => $voteOptionModel->id,
                                        ]);
                                        $newVoteHistory->save();
                                    }
                                }
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
                                $saveUserId = 0;
                                if($vote->is_anonymous !== 1){
                                    $saveUserId = $user->id;
                                }
                                $newVoteHistory = new VoteHistory([
                                    'user_id' => $saveUserId,
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
        $data = Vote::select(
            'vote.id', 
            'vote.title','vote_questions.question as question', 'vote_questions.type as type', 'vote_questions.id as question_id', 'vote_options.option as option', 'vote_options.id as option_id','vote_options.total_voted as total_voted')
        ->join('vote_questions', 'vote.id', '=', 'vote_questions.vote_id')
        ->join('vote_options', 'vote_questions.id', '=', 'vote_options.question_id')
        ->where('vote.id', $id)
        ->get();

        $result = [];
        foreach ($data as $item) {
            $result[$item->id]['vote_id'] = $item->id;
            $result[$item->id]['title'] = $item->title;
            $result[$item->id]['questions'][$item->question_id]['type'] = $item->type;
            $result[$item->id]['questions'][$item->question_id]['question_id'] = $item->question_id;
            $result[$item->id]['questions'][$item->question_id]['question'] = $item->question;
            $result[$item->id]['questions'][$item->question_id]['options'][] = [
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
    
}
