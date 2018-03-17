<?php

class UNHLSEquipmentMaintenance extends Eloquent
{
	protected $table = "unhls_equipment_maintenance";



	public function equipment()
	{
		return $this->belongsTo('UNHLSEquipmentInventory');
	}

	public function supplier()
	{
		return $this->belongsTo('UNHLSEquipmentSupplier');
	}

}