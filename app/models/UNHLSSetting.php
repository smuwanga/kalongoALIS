<?php

class UNHLSSetting extends Eloquent
{
	protected $table = "unhls_setting";


	public function district()
	{
		return $this->belongsTo('District');
	}

	public function facility()
	{
		return $this->belongsTo('UNHLSFacility');
	}

	public function year()
	{
		return $this->belongsTo('UNHLSFinancialYear');
	}
}