<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class UNHLSFacilityLevel extends Eloquent
{
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'unhls_facility_level';

	public function facility()
	{
		return $this->hasMany('UNHLSFacility', 'level_id', 'id');
	}
	

}