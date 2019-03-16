<?php

class Therapy extends Eloquent
{
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'therapy';

	public $timestamps = false;

	/**
	*
	*
	*/
	public function clinicianLink()
	{
		return $this->belongsTo('Clinician','clinician_id');
	}


}
