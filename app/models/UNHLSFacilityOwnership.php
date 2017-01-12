<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class UNHLSFacilityOwnership extends Eloquent
{
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'unhls_facility_ownership';

	public function facility()
	{
		return $this->hasMany('UNHLSFacility', 'level_id', 'id');
	}
	

}