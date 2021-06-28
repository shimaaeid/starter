@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>

                <div class="card-body">
                     @if(Session::has('success'))
                            <div class="alert alert-success justify-content-center d-flex" role="alert">
                                {{ Session::get('success') }}
                            </div>
                     @endif
                    @if(isset($posts) && $posts->count() > 0)

                    @if(session()->has('sussess_msg'))
                    <div class="alert alert-success">
                    {{ session()->get('sussess_msg') }}
                    </div>
                    @endif

                    @foreach ($posts as  $post)
                        <div class="card-body">

                                    <h1> {{$post->title}} - @if(Auth::id() == $post->user->id) owner @endif</h1>
                                    <br>
                                     {{$post->content}}

                                    <br>
                                    <br>

                                        <h3 class="col-4">التعليقات</h3>

                                    <br><br>
                                    @if($post->comments()->count() > 0)
                                        @foreach ($post->comments as  $comment)
                                        <div class="row">
                                            <p class="col-4" style="text-align: center"><a href="{{ route( 'one.comment' , $comment->id) }}">{{$comment->comment}}</a></p>
                                            <a href="{{ route( 'one.comment' , $comment->id) }}" class="btn btn-success">Edit</a>
                                            <a class=" offset-1 col-2">
                                                {!! Former::horizontal_open()->method('DELETE')->action(action("HomeController@deleteComment" , $comment->id))  !!}
                                                {!! Form::submit('Delete') !!}
                                                {!! Former::close() !!}
                                            </a>
                                            <br><br>
                                        </div>

                                        @endforeach

                                    @endif

                                    <br><br>
                                <form action="{{route('comment.save')}}"  method="post"
                                      enctype="multipart/form-data">
                                    @csrf

                                    <input type="hidden" name="post_id" value="{{$post->id}}">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="comment">
                                    </div>

                                    @if(Auth::id() != $post->user->id)

                                     <button type="submit" class="btn btn-primary">أضافه ردك</button>
                                     @endif

                                </form>

                        </div>

                    @endforeach
                    @endif

                </div>

                <div>
                    <table class="table">
                        <thead>
                          <tr>
                            <th scope="col">id</th>
                            <th scope="col">name</th>
                            <th scope="col">price</th>
                            <th scope="col">details</th>
                            <th scope="col">Operations</th>
                          </tr>
                        </thead>
                        <tbody>
                            @foreach($offer as $offer)
                          <tr>
                            <th scope="row">{{ $offer->id }}</th>
                            <td>{{ $offer->name }}</td>
                            <td>{{ $offer->price }}</td>
                            <td>{{ $offer->details }}</td>
                            <td><a href="{{ route('edit-offer',['id' =>  $offer->id ]) }}" class="btn btn-success">Edit</a></td>
                            <td><a href="{{ route('delete-offer',['id' =>  $offer->id ]) }}" class="btn btn-success">Delete</a></td>
                          </tr>

                          @endforeach


                        </tbody>
                    </table>


                </div>

                {{-- {!! $offer['index']->links() !!} --}}



            </div>
        </div>
    </div>
</div>
@endsection
