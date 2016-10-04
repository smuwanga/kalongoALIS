<?php

class UNHLSStockrequisition extends Eloquent
{
	protected $table = "unhls_stockrequisition";

		/**
	* Function to get the remaining comodities
	*/
	public function available()
	{
		//Total received - total issued
		$totalReceived = DB::table('receipts')->where('commodity_id', '=', $this->id)->sum('quantity');
		$totalIssued = DB::table('issues')->join('topup_requests', 'topup_request_id', '=', 'topup_requests.id')->sum('quantity_issued');

		return $totalReceived - $totalIssued;
	}
}