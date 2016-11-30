<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class Bike extends Eloquent
{
	protected $table = 'bikes';
	
	
	public function facility()
	{
		return $this->belongsTo('UNHLSFacility', 'facility_id', 'id');
	}

}