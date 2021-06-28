<?php

namespace App\Http\Controllers\Relation;

use App\Http\Controllers\Controller;
use App\Models\Doctor;
use App\Models\Hospital;
use App\Models\Patient;
use App\Models\Phone;
use App\Models\Service;
use App\Models\Country;
use App\User;
use Facade\FlareClient\Http\Response;
use Illuminate\Http\Request;

class RelationController extends Controller
{
    public function hasOneRelation(){
        $user = User::with(['phone' => function($q){
            $q->select('code', 'phone','user_id');

        }])->find(1);

        //return $user->phone->code;
        //return $user->name ;

        ###### لو عايزه انادى ع العلاقه

      //  return $user->phone;

        return Response()->json($user);
    }

    public function hasOneRelationReverse(){
         $phone = Phone::find(1);

        // make some attribute visible on function only

        $phone->makeVisible(['user_id']);
       //reverse
        $phone->makeHidden(['code']);

        $phone->user; // return user of this phone number
        // get all data phone + user

       // $phone -> with('user');
        return $phone;
    }

    public function getUserHasPhone(){
      return   $user = User::whereHas('phone')->get();

       // return user where have phone with condition code
      $user = User::whereHas('phone' , function($q){
        $q->where('code', '02');
    })->get();
}

    public function getUserNotHasPhone(){
       return $user = User::whereDoesntHave('phone')->get();
    }

    ############# one to many relationships method #############

    public function getHospitalDoctor(){
        $hospital = Hospital::find(1);

         $doctors = $hospital->doctors;

         foreach($doctors as $doctor){
             echo $doctor->name.'<br>';
         }


    }

    public function hospitals(){

        $hospitals = Hospital::select('id', 'name', 'address')->get();

        return view('doctors.hospitals', compact('hospitals'));
    }

    public function deleteHospital($hospital_id){

        $hospital = Hospital::find($hospital_id);

        if( ! $hospital ){
            return abort('404');
        }

        // delete doctors belong to this hospital

        $hospital -> doctors() ->delete();

        $hospital -> delete();

        return redirect()->route('hospitals');


    }


    public function doctors($hospital_id){

      $hospital = Hospital::find($hospital_id);

     $doctors = $hospital->doctors;
      return view('doctors.doctors', compact('doctors'));
    }
    // get all hospitals which must have doctors
    public function hospitalHasDoctors(){

       return $hospital = Hospital::whereHas('doctors')->get();

    }

    public function hospitalsOnlyHasMaleDoctors(){
       return  Hospital::with('doctors')->whereHas('doctors', function($q){
            $q->where('gender',1);

        })->get();
    }

    public function hospitalsNotHasDoctors(){

        return $hospital = Hospital::whereDoesntHave('doctors')->get();

    }

    public function getDoctorsServices(){

       return $doctor = Doctor::with('services')->find(3);
       // return $doctor->services;

    }

    public function getServicesDoctor(){

      return   $doctors = Service::with('doctors')->find(2);

    }

    public function getDoctorsServicesById($doctor_id){

        $doctor = Doctor::find($doctor_id);
        $services = $doctor->services;

        $doctors = Doctor::select('id', 'name')->get();
        $service = Service::select('id', 'name') -> get();

        return view('doctors.services', compact('services', 'doctors', 'service'));

    }

    public function saveServicesToDoctor(Request $request){
        $doctor = Doctor::find($request -> doctor_id);
        if( ! $doctor)
           return abort('404');

        $doctor ->services() -> attach($request->service_id);  // many to many insert to db

       // $doctor -> services()->sync($request->service_id);

        $doctor -> services()->syncWithoutDetaching($request->service_id);
        return "success";

    }


    public function getPatientDoctor(){
        $patient = Patient::find(2);

        return $patient ->doctor;
    }

    public function getCountryDoctor(){

        return Hospital::with('doctors')->find(1);
       return  $country = Country::with('doctors')->find(1);

        return $country->doctors;
    }


    public function getDoctors(){
       return $doctors = Doctor::select('id', 'name', 'gender')->get();

        if( isset($doctors) && $doctors->count() > 0){

            foreach($doctors as $doctors){
                $doctors->gender =  $doctors->gender == 1 ? "Male" : "Female";
            }

        }



          return $doctors;

    }


}
