<?php

namespace App\Listeners;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use App\Events\VedioVeiwer;
use Illuminate\Contracts\Session\Session;

class IncreaseCount
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  object  $event
     * @return void
     */
    public function handle(VedioVeiwer $event)
    {
        if(! session()->has('vedioIsVisited')){

            $this->updateViewer($event->video);

        }else{
            return false;
        }

    }

    function updateViewer($video){

        $video->veiwers =  $video->veiwers + 1;
        $videoData = $video->save();
        Session()->put('vedioIsVisited', $video->id );

    }
}
