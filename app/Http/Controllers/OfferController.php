<?php

namespace App\Http\Controllers;

use App\Http\Requests\OfferRequest;
use Illuminate\Http\Request;
use App\Models\Offer;
use \Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use App\Traits\OfferTrait;


class OfferController extends Controller
{

    use OfferTrait;
    public function index(){

        $offer= Offer::select('id',
        'name_'.LaravelLocalization::getCurrentLocale().' as name' ,
        'price','details')->get();
        //return redirect('home', compact('offer'));

        return view('home', compact('offer'));

    }

    public function create(){
        return view( 'AjaxOffer.create');
    }

    public function store(OfferRequest $request){
        // Save to DB using Ajax
            dd('ok');
        // return $request->all();

        $file_name = $this->saveImage($request->file('image'),'images/offers' );


       $offer =  Offer::create([
           'image' => $file_name ,
           'name_ar' => $request->name_ar,
           'name_en' => $request->name_en,
           'price' => $request->price,
           'details' => $request->details
       ]);
       if($offer){
        return response()->json([
            'status' => true,
            'msg'  => 'success',
        ]);
       }

        else{
            return response()->json([
                'status' => false,
                'msg'  => 'error',
            ]);

        }


    }
}
