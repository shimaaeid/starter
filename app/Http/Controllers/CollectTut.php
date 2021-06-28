<?php

namespace App\Http\Controllers;
use App\Models\Offer;

use Illuminate\Http\Request;

class CollectTut extends Controller
{
    public function index(){
        $numbers = [1,2,3,4];

        ####  Array to collect

        // $col = collect($numbers);
        // return $col ->avg();

        // $names = collect(['name', 'age']);
        // return $names->combine(['amed', '28']);

        // $ages = collect([1,5,5,6,6,8]);
        // return $ages->countby();

        //  $ages = collect([1,5,5,6,6,8]);
        // return $ages->duplicates();

        //each remove from db result
            // $offers = Offer::get();

            // $offers->each(function($offer){

            //     unset($offer->name_ar);
            //     $offer->test = "test";
            //     return $offer;

            // });

            // return $offers;


        //filter

                // $offers = Offer::get();
                // $offers = collect($offers);

                // $result = $offers->filter(function($value, $key){

                //     return $value['name_en'] == 'test2';

                // });

                // return array_values($result->all());

        //search
        // transform

         $offers = Offer::get();
                $offers = collect($offers);

                $result = $offers->transform(function($value, $key){

                    return 'name is '.$value['name_en'];

                });

                return array_values($result->all());





    }
}
