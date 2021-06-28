@extends('layouts.app')
@section('head')
{{-- <meta name = "csrf-token" content="{{ csrf_token() }}"> --}}
@stop

@section('content')

<div class="container">

    <h1>Services</h1>

    <table class="table">
        <thead>
          <tr>
            <th scope="col">id</th>
            <th scope="col">name</th>

          </tr>
        </thead>
        <tbody>
            @if( isset($services) && $services->count() > 0)
            @foreach($services as $services)
          <tr>
            <th scope="row">{{ $services->id }}</th>
            <td>{{ $services->name }}</td>
          </tr>
          @endforeach
          @endif







        </tbody>
    </table>


    <div class="content">

        <h1 style="text-align: center">Add Service</h1>

        <form method="POST"  action="{{ route('save.doctor.service') }}">
         @csrf


           <div class="mb-3">
             <label class="form-label">Doctors</label>
             <select class="form-control" name="doctor_id">
                 @foreach ($doctors as $doctors )

                 <option value="{{ $doctors->id }}">{{ $doctors->name }}</option>

                 @endforeach

             </select>
           </div>

           <div class="mb-3">
            <label class="form-label">Services</label>
            <select class="form-control" name="service_id[]" multiple>
                @foreach ($service as $service )
                <option value="{{ $service->id }}">{{ $service ->name }}</option>

                @endforeach

            </select>
          </div>


         <button type="submit" class="btn btn-primary">Submit</button>
       </form>



     </div>
 </div>





 </div>
</div>

@stop

@section('scripts')
<script src="{{ asset('public/js/jquery-3.6.0.min.js') }}"></script>

@stop
