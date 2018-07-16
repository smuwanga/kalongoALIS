<?php

class UNHLSEquipmentBreakdown extends Eloquent
{
	protected $table = "unhls_equipment_breakdown";



	public function equipment()
	{
		return $this->belongsTo('UNHLSEquipmentInventory');
	}

	public function staff($id)
	{

		$staff = UNHLSStaff::find($id);
		return $staff->firstName." ".$staff->lastName;

	}

}