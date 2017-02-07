<?php

class UnhlsVisit extends Eloquent
{
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'visits';

	public $timestamps = true;

	/**
	 * Test relationship
	 */
    public function tests()
    {
        return $this->hasMany('Test', 'visit_id');
    }

	/**
	 * Patient relationship
	 */
	public function patient()
	{
		return $this->belongsTo('UnhlsPatient');
	}

}
