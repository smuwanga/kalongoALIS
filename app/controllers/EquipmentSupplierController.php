<?php

class EquipmentSupplierController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{

		$suppliers = UNHLSEquipmentSupplier::get();

		return View::make('equipment.supplier.index')
			->with('suppliers', $suppliers);
	}


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		return View::make('equipment.supplier.create');
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
		'supplier_name' => 'required',
		'phone' => 'required',
		'email' => 'required',
		'address' => 'required'		
		);
		
		$validator = Validator::make(Input::all(), $rules);

		if ($validator->fails()) {
			return Redirect::back()->withErrors($validator);
		} else {

			$supplier = new UNHLSEquipmentSupplier;

			$supplier->name = Input::get('supplier_name');
			$supplier->phone = Input::get('phone');
			$supplier->email = Input::get('email');
			$supplier->address = Input::get('address');

			$supplier->save();

			return Redirect::to('equipmentsupplier');
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
