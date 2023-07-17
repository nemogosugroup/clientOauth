<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Illuminate\Support\Facades\DB;

class VoteOptions extends Model
{
    use HasFactory;
    protected $table = 'vote_options';

    protected $fillable = [
        'question_id',
        'option',
        'total_voted'
    ];
}
 