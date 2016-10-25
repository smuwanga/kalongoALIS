<?php

class DrugSusceptibilityController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		$drugSusceptibilities = DrugSusceptibility::all();
		return $drugSusceptibilities;
	}


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$drugSusceptibility = new DrugSusceptibility;
		$drugSusceptibility->user_id = Auth::user()->id;
		$drugSusceptibility->culture_id = Input::get('culture_id');
		$drugSusceptibility->isolated_organism_id = Input::get('isolated_organism_id');
		$drugSusceptibility->drug_id = Input::get('drug_id');
		$drugSusceptibility->drug_susceptibility_measure_id = Input::get('drug_susceptibility_measure_id');
		$drugSusceptibility->zone = Input::get('zone');
		$drugSusceptibility->save();

		return $drugSusceptibility;
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
