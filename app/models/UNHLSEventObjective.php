<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class UNHLSEventObjective extends Eloquent
{
	protected $table = 'unhls_events_objectives';
	
	
	public function event()
	{
		return $this->belongsTo('UNHLSEvent', 'event_id', 'id');
	}

}