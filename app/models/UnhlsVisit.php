<?php

class UnhlsVisit extends Eloquent
{
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'unhls_visits';

	public $timestamps = true;

	/**
	 * Test relationship
	 */
	public function tests()
	{
		return $this->hasMany('UnhlsTest', 'visit_id');
	}

	/**
	 * Test relationship
	 */
	public function ward()
	{
		return $this->belongsTo('Ward', 'ward_id');
	}

	/**
	 * Patient relationship
	 */
	public function patient()
	{
		return $this->belongsTo('UnhlsPatient');
	}

}
