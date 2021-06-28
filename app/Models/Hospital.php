<?php

namespace App\Models;
use App\Models\Doctor;

use Illuminate\Database\Eloquent\Model;

class Hospital extends Model
{
    protected $table = "hospitals";
    protected $fillable = [
        'name',
        'address',
        'country_id'

    ];
    protected $hidden = [
        'created_at'
    ];
    public $timestamps = false;

    public function doctors(){
        return $this->hasMany('App\Models\Doctor','hospital_id', 'id');
    }

    public function country(){
        return $this->belongsTo('App\Models\Country', 'country_id', 'id', 'id');
    }
}
