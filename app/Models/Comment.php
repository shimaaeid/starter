<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    protected $table = "comments";
    protected $fillable = [
        'post_id',
        'user_id',
        'comment',
        'created_at',
        'updated_at',
        'deleted_at'
    ];
    protected $hidden = [
        'created_at',
        'updated_at',
        'deleted_at'
    ];
    public $timestamps = true;

    // owner

    public function user(){
        return $this->belongsTo(User::class , 'user_id','id');
    }


}
