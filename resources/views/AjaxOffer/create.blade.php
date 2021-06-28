@extends('layouts.app')
@section('head')
{{-- <meta name = "csrf-token" content="{{ csrf_token() }}"> --}}
@stop

@section('content')

<div class="container">

    <h1>Add Your Offer</h1>

    <form id="offerForm" >
        @csrf

        {{-- <input type="hidden" name="_token" id="token" value="{{ csrf_token() }}"> --}}
     {{-- <div class="mb-3">
         <label class="form-label">upload Image</label>
         <input type="file" class="form-control" name="image">
       </div> --}}

     <div class="mb-3">
       <label class="form-label">Offer Name Arabic</label>
       <input type="text" class="form-control name_ar" name="name_ar">
     </div>

     <div class="mb-3">
         <label class="form-label">Offer Name English</label>
         <input type="text" class="form-control name_en" name="name_en">
       </div>

     <div class="mb-3">
         <label class="form-label">Offer Price</label>
         <input type="text" class="form-control price" name="price">
     </div>

       <div class="mb-3">
         <label class="form-label">Offer Detaila</label>
         <input type="text" class="form-control details" name="details">
       </div>


     <button id="save_offer" class="btn btn-primary" type="submit" >Submit</button>
   </form>



 </div>
</div>

@stop

@section('scripts')
<script src="{{ asset('public/js/jquery-3.6.0.min.js') }}"></script>
<script>

     console.log('ok');
    //  $(document).ready(function(){

    //     $('#save_offer').on('click',function(e){
    //    // var formData = new formData($('#offerForm'));
    //     //e.preventDefault();
    //     console.log('ok');
    //     $.ajaxSetup({
    //             headers: {
    //                 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    //             }
    //         });
    //     $.ajax({
    //     type : 'post',
    //     // headers : {
    //     //     'X-CSRF-TOKEN' : $('meta[name="csrf-token"]').attr('content')
    //     // },
    //     enctype : 'multipart/form-data',
    //     url : "{{ route('ajax.offer.store') }}",
    //     // data : {
    //     //     '_token':    "{{ csrf_token() }}",
    //     //     'image' :    $("input[name="image"]").val() ,
    //     //     'name_ar' :  $("input[name="name_ar"]").val(),
    //     //     'name_en' :  $("input[name="name_en"]").val(),
    //     //     'price' :    $("input[name="price"]").val() ,
    //     //     'details' :  $("input[name="details"]").val() ,
    //     // },
    //     success : function(data){
    //         if(data.status == true){
    //             alert(data.msg);
    //         }
    //     },
    //     error : function(reject){
    //         if(data.status == false){
    //             alert(data.msg);
    //         }
    //     }
    //    // data : formDate,
    //     // processData : false,
    //     // contentType : false,
    //     // cashe : false,


    //   });


    //  })


    // });

    $(document).ready(function () {
        $('#offerForm').on('submit', function () {
            console.log("ok");
             $.ajaxSetup({
                headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
            });
             //var formData = new formData(this);
            $.ajax({
                type: "POST",
                url: " route('ajax.offer.store') ",
                dataType: 'JSON',
                //data : formData,
            //     data : {
            //     '_token':    "{{ csrf_token() }}",
            //     image :    $("input[name="image"]").val() ,
            //     name_ar :  $("input[name="name_ar"]").val(),
            //     name_en :  $("input[name="name_en"]").val(),
            //     price :    $("input[name="price"]").val() ,
            //    details :  $("input[name="details"]").val() ,
            //    },
                success: function (response) {
                    console.log(response)

                }
            });
        });
    });


</script>
@stop
