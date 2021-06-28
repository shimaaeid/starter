<?php

namespace App\Http\Controllers;

use App\Models\Offer;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Http\Requests\OfferRequest;
use App\Models\Video;
use App\Traits\OfferTrait;
use \Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use App\Events\VedioVeiwer;
use App\Scopes\OfferScope;

class NewsController extends Controller
{
    use OfferTrait;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $obj = new \stdClass;
        // $obj->id = 5;
        // $obj->name = "shimaa";
        // return view('welcome',compact('obj'));

        $offer= Offer::select('id',
       'name_'.LaravelLocalization::getCurrentLocale().' as name' ,
       'price','details')->paginate(PAGINATIONCOUNT);
       //return redirect('home', compact('offer'));

       return view('home', compact('offer'));


    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(OfferRequest $request)
    {


       $file_name = $this->saveImage($request->file('image'),'images/offers' );


       Offer::create([
           'image' => $file_name ,
           'name_ar' => $request->name_ar,
           'name_en' => $request->name_en,
           'price' => $request->price,
           'details' => $request->details
       ]);

       return redirect()->back()->with(['success' => 'تم اضافه العرض بنجاح']);
    }



    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
       // $offer = Offer::findorFail($id);

       $offer = Offer::select('id','name_ar','name_en','price','details')->find($id);
       return view('edit', compact('offer'));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $offer = Offer::select('id','name_ar','name_en','price','details')->find($id);
        if(!$offer){
            return redirect()-back();
        };
        $offer->update([
            'name_ar' => $request->name_ar,
            'name_en' => $request->name_en,
            'price' => $request->price,
            'details' => $request->details,
        ]);


        $offer= Offer::select('id',
        'name_'.LaravelLocalization::getCurrentLocale().' as name' ,
        'price','details')->get();

       // return redirect()->route('home',compact('offer'))->with(['success' => 'success']);


    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
       $offer = Offer::find($id);
       if(! $offer)
          return redirect()->back()->with(['error' => 'id not found']);

        $offer->delete();
        return redirect()->route('home')->with(['success' => 'success']);
    }

    public function getVedio(){
        $vidio = Video::first();
        event(new VedioVeiwer($vidio));
        return view('youtube')->with('vidio', $vidio);
    }

    public function getAllInactiveOffers(){
      // return  Offer::get();

       /// how to remove glodal scope

       return Offer::withoutGlobalScope(OfferScope::class)->get();
    }
}
