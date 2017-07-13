<?php

class EquipmentBreakdownController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{

		//
		
		$items = UNHLSEquipmentBreakdown::get();
		return View::make('equipment.breakdown.index')->with('items',$items);

	}


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//

		$breakdown_type = array('1' => 'Hardware', '2' => 'Software', '3' => 'Both');
		return View::make('equipment.breakdown.create')->with('breakdown_type',$breakdown_type);

	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		//

		$rules = array(

		'equipment_id' => 'required',
		'description_problem' => 'required',
		'action_taken' => 'required',
		'request_hsd' => 'required',		
		'priority' => 'required',
		'in_charge' => 'required',
		'breakdown_type' => 'required',
		'breakdown_date' => 'required',
		'reported_by' => 'required',
		'report_date' => 'required'									

		);
		
		$validator = Validator::make(Input::all(), $rules);

		if ($validator->fails()) {
			return Redirect::back()->withErrors($validator);
		} else {

			$item = new UNHLSEquipmentBreakdown;

        	$item->district_id = \Config::get('constants.DISTRICT_ID') ;
        	$item->facility_id = \Config::get('constants.FACILITY_ID');        
        	$item->year_id = \Config::get('constants.FIN_YEAR_ID');  

			$item->equipment_id = Input::get('equipment_id');
			$item->description = Input::get('description_problem');
			$item->action_taken = Input::get('action_taken');
			$item->hsd_request = Input::get('request_hsd');
			$item->priority = Input::get('priority'); 
			$item->in_charge_id = Input::get('in_charge');      
			$item->report_date = Input::get('report_date');     
			$item->breakdown_date = Input::get('report_date');     
			$item->breakdown_type = Input::get('breakdown_type');     
			$item->reported_by = Input::get('reported_by');           
      

			$item->save();

			return Redirect::to('equipmentbreakdown');
	}
}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		//
	}


	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//
	}


	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		//
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
	}


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function restore($id)
	{
		//

		$breakdown = UNHLSEquipmentBreakdown::find($id);
		return View::make('equipment.breakdown.restoration')->with('breakdown',$breakdown);

	}

	public function saveRestore()
	{
		//

		$rules = array(

		'reviewed_by' => 'required',
		'review_date' => 'required'									

		);
		
		$validator = Validator::make(Input::all(), $rules);

		if ($validator->fails()) {
			return Redirect::back()->withErrors($validator);
		} else {

			$breakdown = UNHLSEquipmentBreakdown::find( Input::get('breakdown_id'));

			$breakdown->comment = Input::get('comment'); 
			$breakdown->restored_by = Input::get('reviewed_by');      
			$breakdown->restore_date = Input::get('review_date');           
      

			$breakdown->save();

			return Redirect::to('equipmentbreakdown');
	}
}


}
