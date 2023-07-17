<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Illuminate\Support\Facades\DB;

class Vote extends Model
{
    use HasFactory;
    protected $table = 'vote';

    protected $fillable = [
        'title',
        'type',
        'type_view',
        'status'
    ];
    
}
