<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Doctor extends Model
{
    protected $table = "doctors";
    protected $fillable = [
        'name',
        'title',
        'hospital_id',
        'medical_id'
    ];
    protected $hidden = [
        'created_at'
    ];
    public $timestamps = false;

    public function hospital(){
        return $this->belongsTo('App\Models\Hospital','hospital_id', 'id');
    }


    public function services(){
        return $this->belongsToMany('App\Models\Service', 'doctor_service', 'doctor_id', 'service_id', 'id', 'id');
    }

    //Accessors
    public function getGenderAttribute($val){

      return   $val == 1 ? "Male" : "Female";

    }

    


}
