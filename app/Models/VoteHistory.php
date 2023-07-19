<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Illuminate\Support\Facades\DB;

class VoteHistory extends Model
{
    use HasFactory;
    protected $table = 'vote_history';

    protected $fillable = [
        'user_id',
        'vote_option_id',
        'answer',
    ];
    
}
