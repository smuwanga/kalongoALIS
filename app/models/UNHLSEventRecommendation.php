<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class UNHLSEventRecommendation extends Eloquent
{
	protected $table = 'unhls_events_recommendations';
	
	
	public function event()
	{
		return $this->belongsTo('UNHLSEvent', 'event_id', 'id');
	}

}