<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class UNHLSEvent extends Eloquent
{
	protected $table = 'unhls_events';
	
	
	public function user()
	{
		return $this->belongsTo('User', 'user_id', 'id');
	}

	public function district()
	{
		return $this->belongsTo('District', 'district_id', 'id');
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

	public static function filtereventsbydate($datefrom,$dateto,$name)
	{
		return UNHLSEvent::Where(function ($query) use ($datefrom,$dateto,$name){
			$query->orWhere('name','LIKE','%$name%');
		})
		->orWhere(function ($query) use ($datefrom,$dateto,$name){
			$query->where('start_date','>=',$datefrom)
			->where('start_date','<=',$dateto);
		})
		->orWhere(function ($query) use ($datefrom,$dateto,$name){
			$query->where('end_date','>=',$datefrom)
			->where('end_date','<=',$dateto);
		})
		->get();
	}

}