<?php

class Facility extends Eloquent
{
	protected $table = "unhls_facilities";
	
	/**
	 * Distric relationship
	 */
	public function district()
	{
		return $this->belongsTo('District', 'district_id', 'id');
	}

	public function bbincidence()
    {
        return $this->hasOne('Bbincidence','facility_id','id');
    }
}