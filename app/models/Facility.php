<?php

class Facility extends Eloquent
{
	protected $table = "facilities";

	/**
	*
	* District Relationship
	*
	*/
	public function district()
	{
		$this->hasOne('District');
	}

	/**
	 *
	 *FacilityLevel Relationship
	 *
	 */
	 public function facilitylevel()
	 {
	 	$this->hasOne('FacilityLevel');
	 }
}