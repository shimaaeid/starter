<?php

namespace App\Http\Controllers;

use App\Events\NewNotification;
use App\Models\Comment;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {

        $posts = Post::with(['comments' => function($q){
            $q -> select('id','post_id','comment');

        }])->get();
        return view('home',compact('posts'));
    }

    public function  saveComment(Request $request)
    {

        // var_dump(Auth::id());
        // die();
        Comment::create([
            'post_id' => $request->post_id,
            'user_id' => Auth::id(),
            'comment' => $request->comment,
        ]);
        // $data = array();
        // $data['user_id'] = Auth::id();
        // $data['user_name'] = Auth::user()->name;
        // $data['comment'] = $request->comment;
        // $data['post_id'] = $request->post_id;

        $data = [
            'user_id' => Auth::id(),
            'user_name'  => Auth::user()->name,
            'comment' => $request->comment,
            'post_id' => $request->post_id,
        ];

        ///   save  notify in database table ////

        //event(new NewNotification($data));

        return redirect()->back()->with(['success' => 'تم اضافه تعليقك بنجاح ']);
    }

    public function deleteComment($id){
        //return $id;
        Comment::where('id',$id)->delete();
        return redirect()->back()->with([
            'sussess_msg' => 'Comment Deleted Successfuly'
        ]);
    }

    public function showOneComment($id){

        $comment = Comment::where('id',$id)->select('id','comment')->first();
        //return $comment;

        return view('one-comment',compact('comment'));
    }

    public function updateComment(Request $request,$id){
        //return $request->all();
       $comment = Comment::where('id', $id)->update([
            'comment' => $request->comment
        ]);

        return redirect('/home')->with(['success' => 'Comment Updated Successfully']);
    }
}
