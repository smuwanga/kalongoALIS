<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class UNHLSEventLesson extends Eloquent
{
	protected $table = 'unhls_events_lessons';
	
	
	public function event()
	{
		return $this->belongsTo('UNHLSEvent', 'event_id', 'id');
	}

}