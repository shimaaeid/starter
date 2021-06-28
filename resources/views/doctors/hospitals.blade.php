@extends('layouts.app')
@section('head')
{{-- <meta name = "csrf-token" content="{{ csrf_token() }}"> --}}
@stop

@section('content')

<div class="container">

    <h1>Hospitals</h1>

    <table class="table">
        <thead>
          <tr>
            <th scope="col">id</th>
            <th scope="col">name</th>
            <th scope="col">Addess</th>

            <th scope="col">Operations</th>
          </tr>
        </thead>
        <tbody>

            @if( isset($hospitals) && $hospitals -> count()  > 0)
            @foreach($hospitals as $hospital)
          <tr>
            <th scope="row">{{ $hospital->id }}</th>
            <td>{{ $hospital->name }}</td>
            <td>{!! $hospital->address !!}</td>
            <td><a href="{{ route('hospital.doctors', $hospital->id) }}" class="btn btn-success">Display Doctors</a></td>
            <td><a href="{{ route('hospital.delete' ,$hospital->id ) }}" class="btn btn-danger">Delete</a></td>
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
