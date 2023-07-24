<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Illuminate\Support\Facades\DB;

class Voted extends Model
{
    use HasFactory;
    protected $table = 'voted';

    protected $fillable = [
        'user_id',
        'vote_id',
    ];
    
}
