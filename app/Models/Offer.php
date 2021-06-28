<?php

namespace App\Models;

use App\Scopes\OfferScope;
use Illuminate\Database\Eloquent\Model;

class Offer extends Model
{
    protected $table = "offers";
    protected $fillable = [
        'name_ar',
        'name_en',
        'price',
        'details',
        'image',
        'status',
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

    // register global scope

    protected static function boot(){
        parent::boot();
        static::addGlobalScope(new OfferScope);
    }

    public function scopeInactive($query){

        return $query->where('status', 0);

    }

    // mutators

    public function setNameEnAttribute($val){

        $this->attributes['name_en']  = strtoupper($val);

    }


}
