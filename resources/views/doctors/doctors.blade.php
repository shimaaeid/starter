@extends('layouts.app')
@section('head')
{{-- <meta name = "csrf-token" content="{{ csrf_token() }}"> --}}
@stop

@section('content')

<div class="container">

    <h1>Doctors</h1>

    <table class="table">
        <thead>
          <tr>
            <th scope="col">id</th>
            <th scope="col">name</th>
            <th scope="col">title</th>
            <th scope="col">التخصص</th>

          </tr>
        </thead>
        <tbody>
            @if( isset($doctors) && $doctors->count() > 0)
            @foreach($doctors as $doctor)
          <tr>
            <th scope="row">{{ $doctor->id }}</th>
            <td>{{ $doctor->name }}</td>
            <td>{{ $doctor->title }}</td>
            <td><a href="{{ route('doctor.service', $doctor->id  ) }}" class="btn btn-success">التخصص</a></td>
          </tr>
          @endforeach
          @endif




        </tbody>
    </table>




 </div>
</div>

@stop

@section('scripts')
<script src="{{ asset('public/js/jquery-3.6.0.min.js') }}"></script>

@stop
