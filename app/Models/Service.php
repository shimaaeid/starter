<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    protected $table = "service";
    protected $fillable = [
        'name'

    ];
    protected $hidden = [
        'created_at',
        'updated_at',
        'pivot'
    ];
    public $timestamps = false;


    public function doctors(){
        return $this->belongsToMany('App\Models\Doctor', 'doctor_service', 'doctor_id', 'service_id', 'id', 'id');
    }
}
