<?php

class UNHLSStockcard extends Eloquent
{
	protected $table = "unhls_stockcard";


	public function district()
	{
		return $this->belongsTo('District');
	}

		public function facility()
	{
		return $this->belongsTo('UNHLSFacility');
	}

	public function commodity()
	{
		return $this->belongsTo('Commodity');
	}

	public function year()
	{
		return $this->belongsTo('UNHLSFinancialYear');
	}

	public function sourceOfStock($sourceType, $sourceId)
	{
		if($sourceType==\Config::get('constants.FROM_FACILITY'))
		{
			return UNHLSFacility::Find($sourceId);
		}else
		{
			return UNHLSWarehouse::Find($sourceId);;
		}
	}

	public function destinationOfStock($destinationType, $destinationId)
	{
		if($destinationType==\Config::get('constants.TO_FACILITY'))
		{
			return UNHLSFacility::Find($destinationId);
		}else
		{
			return UNHLSStaff::Find($destinationId);
		}	
	}

}