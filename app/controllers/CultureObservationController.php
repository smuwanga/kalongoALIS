<?php

class CultureObservationController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		$cultureObservations = CultureObservation::with('culture','cultureDuration')->get();

		return $cultureObservations;
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
		$observation = new CultureObservation;
		$observation->user_id = Auth::user()->id;
		$observation->culture_id = Input::get('culture_id');
		$observation->culture_duration_id = Input::get('culture_duration_id');
		$observation->observation = Input::get('observation');
		$observation->save();
		return $observation->load('culture','cultureDuration');
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
		$observation = CultureObservation::find($id);
		$observation->user_id = Auth::user()->id;
		$observation->culture_id = Input::get('culture_id');
		$observation->culture_duration_id = Input::get('culture_duration_id');
		$observation->observation = Input::get('observation');
		$observation->save();
		return $observation->load('culture','cultureDuration');
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$observation = CultureObservation::find($id);
		$observation->delete();
		return $id;
	}
}
