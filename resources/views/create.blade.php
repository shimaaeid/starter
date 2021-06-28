@extends('layouts.app');
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;600&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <!-- Styles -->
        <style>
            html, body {
                background-color: #fff;
                color: #636b6f;
                font-family: 'Nunito', sans-serif;
                font-weight: 200;
                height: 100vh;
                margin: 0;
            }

            .full-height {
                height: 100vh;
            }

            .flex-center {
                align-items: center;
                display: flex;
                justify-content: center;
            }

            .position-ref {
                position: relative;
            }

            .top-right {
                position: absolute;
                right: 10px;
                top: 18px;
            }

            .content {
                text-align: center;
            }

            .title {
                font-size: 84px;
            }

            .links > a {
                color: #636b6f;
                padding: 0 25px;
                font-size: 13px;
                font-weight: 600;
                letter-spacing: .1rem;
                text-decoration: none;
                text-transform: uppercase;
            }

            .m-b-md {
                margin-bottom: 30px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
              <a class="navbar-brand" href="#">Navbar</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNav">

                <ul>
                    @foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties)
                        <li>
                            <a rel="alternate" hreflang="{{ $localeCode }}" href="{{ LaravelLocalization::getLocalizedURL($localeCode, null, [], true) }}">
                                {{ $properties['native'] }}
                            </a>
                        </li>
                    @endforeach
                </ul>

              </div>
            </div>
          </nav>
        <div class="flex-center position-ref full-height">
            @if (Route::has('login'))
                <div class="top-right links">
                    @auth
                        <a href="{{ url('/home') }}">Home</a>
                    @else
                        <a href="{{ route('login') }}">Login</a>

                        @if (Route::has('register'))
                            <a href="{{ route('register') }}">Register</a>
                        @endif
                    @endauth
                </div>
            @endif


            @if(Session::has('success'))
            <div class="alert alert-success" role="alert">
                {{Session::get('success')}}
              </div>

            @endif

        <div class="content">

               <h1>Add Your Offer</h1>

               <form method="POST"  action="{{url('offers\store')}}" enctype="multipart/form-data">
                @csrf

                <div class="mb-3">
                    <label class="form-label">upload Image</label>
                    <input type="file" class="form-control" name="image">
                  </div>
                  @error('image')
                  <small class="form-text text-danger">{{$message}}</small>


                  @enderror

                <div class="mb-3">
                  <label class="form-label">Offer Name Arabic</label>
                  <input type="text" class="form-control" name="name_ar">
                </div>
                @error('name_ar')
                <small class="form-text text-danger">{{$message}}</small>


                @enderror

                <div class="mb-3">
                    <label class="form-label">Offer Name English</label>
                    <input type="text" class="form-control" name="name_en">
                  </div>
                  @error('name_en')
                  <small class="form-text text-danger">{{$message}}</small>


                  @enderror


                <div class="mb-3">
                    <label class="form-label">Offer Price</label>
                    <input type="text" class="form-control" name="price">
                </div>
                @error('price')
                <small class="form-text text-danger">{{$message}}</small>


                @enderror

                  <div class="mb-3">
                    <label class="form-label">Offer Detaila</label>
                    <input type="text" class="form-control" name="details">
                  </div>
                  @error('price')
                  <small class="form-text text-danger">{{$message}}</small>


                  @enderror

                <button type="submit" class="btn btn-primary">Submit</button>
              </form>



            </div>
        </div>


    </body>
</html>
