<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class UNHLSEvent extends Eloquent
{
	protected $table = 'unhls_events';
	
	
	public function user()
	{
		return $this->belongsTo('User', 'user_id', 'id');
	}

	public function objective()
    {
        return $this->hasMany('UNHLSEventObjective','event_id','id');
	}

	public function lesson()
    {
        return $this->hasMany('UNHLSEventLesson','event_id','id');
	}

	public function recommendation()
    {
        return $this->hasMany('UNHLSEventRecommendation','event_id','id');
	}

	public function action()
    {
        return $this->hasMany('UNHLSEventAction','event_id','id');
	}

}