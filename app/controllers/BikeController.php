<?php

class BikeController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
		$bikes = Bike::orderBy('id','DESC')->get();		
		
		return View::make('bike.index')->with('bikes', $bikes);
	}


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
		return View::make('bike.create');
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		//

		$bike = new Bike;

		$bike->reg_no = Input::get('reg_no');
		$bike->facility_id = Input::get('facility_id');

		$bike->save();

		return Redirect::to('bike')->with('message', 'Successfully created Bike with Registration '.$bike->reg_no);
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
		$bike = Bike::find($id);

		$firstInsertedId = DB::table('bikes')->min('id');
		$lastInsertedId = DB::table('bikes')->max('id');
		
		$id>=$lastInsertedId ? $nextbike=$lastInsertedId : $nextbike = $id+1;
		$id<=$firstInsertedId ? $previousbike=$firstInsertedId : $previousbike = $id-1;

		return View::make('bike.edit')->with('bike', $bike)
		->with('nextbike', $nextbike)
		->with('previousbike', $previousbike);
	
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
