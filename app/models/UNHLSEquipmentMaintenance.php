<?php

class UNHLSEquipmentMaintenance extends Eloquent
{
	protected $table = "unhls_equipment_maintenance";


	public function supplier()
	{
		return $this->belongsTo('Supplier');
	}


	public function equipment()
	{
		return $this->belongsTo('UNHLSEquipmentInventory');
	}
}