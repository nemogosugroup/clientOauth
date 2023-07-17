<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Illuminate\Support\Facades\DB;

class VoteQuestions extends Model
{
    use HasFactory;
    protected $table = 'vote_questions';

    protected $fillable = [
        'vote_id',
        'question',
        'type'
    ];
    
}
 