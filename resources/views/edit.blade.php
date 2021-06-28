@extends('layouts.app');
@section('content')

<form method="POST"  action="{{route('update-offer',['id' => $offer->id])}}">
    @csrf
    <div class="mb-3">
      <label class="form-label">Offer Name</label>
      <input type="text" class="form-control" name="name_ar" value="{{ $offer->name_ar }}">
    </div>
    @error('name')
    <small class="form-text text-danger">{{$message}}</small>


    @enderror

    <div class="mb-3">
        <label class="form-label">Offer Name</label>
        <input type="text" class="form-control" name="name_en" value="{{ $offer->name_en }}">
      </div>
      @error('name')
      <small class="form-text text-danger">{{$message}}</small>


      @enderror


    <div class="mb-3">
        <label class="form-label">Offer Price</label>
        <input type="text" class="form-control" name="price" value="{{ $offer->price }}">
    </div>
    @error('price')
    <small class="form-text text-danger">{{$message}}</small>


    @enderror

      <div class="mb-3">
        <label class="form-label">Offer Detaila</label>
        <input type="text" class="form-control" name="details" value="{{ $offer->details }}">
      </div>
      @error('price')
      <small class="form-text text-danger">{{$message}}</small>


      @enderror

    <button type="submit" class="btn btn-primary">Update</button>
  </form>

  @stop


