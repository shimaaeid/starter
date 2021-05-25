@extends('layouts.app')
@section('content')
<div class="container">
<form action="{{route('comment.update', $comment['id'] )}}"  method="post"
enctype="multipart/form-data">
@csrf

<div class="form-group">
  <input type="text" class="form-control" name="comment" value="{{$comment['comment']}}">
</div>


<button type="submit" class="btn btn-primary">Edit</button>


</form>
</div>

@endsection
