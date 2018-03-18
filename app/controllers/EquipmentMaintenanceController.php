<?php

class EquipmentMaintenanceController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
		$list = UNHLSEquipmentMaintenance::get();
		return View::make('equipment.maintenance.index')
			->with('list',$list);		
	}


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//

		$equipment_list = UNHLSEquipmentInventory::get()->lists('name','id');
		$supplier_list = Supplier::get()->lists('name','id');
		return View::make('equipment.maintenance.create')
				->with('equipment_list',$equipment_list)
				->with('supplier_list',$supplier_list);

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
		'service_date' => 'required',
		'next_service_date' => 'required',
		'serviced_by' => 'required',
		'serviced_by_phone' => 'required',
		'supplier_id' => 'required'									

		);
		
		$validator = Validator::make(Input::all(), $rules);

		if ($validator->fails()) {
			return Redirect::back()->withErrors($validator);
		} else {

			$item = new UNHLSEquipmentMaintenance;

        	$item->district_id = \Config::get('constants.DISTRICT_ID') ;
        	$item->facility_id = \Config::get('constants.FACILITY_ID');        
        	$item->year_id = \Config::get('constants.FIN_YEAR_ID');  

			$item->equipment_id = Input::get('equipment_id');
			$item->last_service_date = Input::get('service_date');
			$item->next_service_date = Input::get('next_service_date');
			$item->serviced_by_name = Input::get('serviced_by');
			$item->serviced_by_contact = Input::get('serviced_by_phone'); 
			$item->supplier_id = Input::get('supplier_id');      
			$item->comment = Input::get('comment');          

			$item->save();

			return Redirect::to('equipmentmaintenance');
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


}
