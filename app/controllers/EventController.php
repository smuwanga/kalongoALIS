<?php

class EventController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
		$events = UNHLSEvent::orderBy('id','DESC')->get();		
		
		return View::make('event.index')->with('events', $events);
	}


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
		return View::make('event.create');
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
		//	'patient_number' => 'required|unique:patients,patient_number',
			'user_id' => 'required',
			'name' => 'required',
			'start_date' => 'required',
			'end_date' => 'required',

		);
		$validator = Validator::make(Input::all(), $rules);

		if ($validator->fails()) {

			return Redirect::back()->withErrors($validator)->withInput(Input::all());
		}
		else {
			// store

		$event = new UNHLSEvent;

		$event->user_id = Input::get('user_id');
		$event->name = Input::get('name');
		$event->department = Input::get('department');
		$event->type = Input::get('type');
		$event->start_date = Input::get('start_date');
		$event->end_date = Input::get('end_date');

		$event->save();

		// saving the attached report
		if (Input::hasFile('report_path')) {
        	$file = Input::file('report_path');
        	$destinationPath = public_path().'\attachments';
        	//$filename = str_random(3) . '_' . $file->getClientOriginalName();
        	$filename = $event->id . '_' . $file->getClientOriginalName();
        	$uploadSuccess = $file->move($destinationPath, $filename);

        	//$event->report_path = $destinationPath .'\\'. $filename;
        	$event->report_path = $filename;
        	$event->save();
    	}

		return Redirect::to('event')->with('message', 'Successfully registered an event with ID No '.$event->id);
	
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
		$event = UNHLSEvent::find($id);

		$firstInsertedId = DB::table('unhls_events')->min('id');
		$lastInsertedId = DB::table('unhls_events')->max('id');
		
		$id>=$lastInsertedId ? $nextevent=$lastInsertedId : $nextevent = $id+1;
		$id<=$firstInsertedId ? $previousevent=$firstInsertedId : $previousevent = $id-1;

		//dd($event);
		
		//Show the view and pass the $event to it
		return View::make('event.show')->with('event', $event)
		->with('nextevent', $nextevent)
		->with('previousevent', $previousevent);
	}


	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$event = UNHLSEvent::find($id);


		return View::make('event.edit')->with('event', $event);
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
		//
		$rules = array(
		//	'patient_number' => 'required|unique:patients,patient_number',
			'user_id' => 'required',
			'name' => 'required',
			'start_date' => 'required',
			'end_date' => 'required',

		);
		$validator = Validator::make(Input::all(), $rules);

		if ($validator->fails()) {

			return Redirect::back()->withErrors($validator)->withInput(Input::all());
		} else {
		// update
		$event = UNHLSEvent::find($id);

		$event->user_id = Input::get('user_id');
		$event->name = Input::get('name');
		$event->department = Input::get('department');
		$event->type = Input::get('type');
		$event->start_date = Input::get('start_date');
		$event->end_date = Input::get('end_date');

		$event->save();

		// saving the attached report
		if (Input::hasFile('report_path')) {
        	$file = Input::file('report_path');
        	$destinationPath = public_path().'\attachments';
        	//$filename = str_random(3) . '_' . $file->getClientOriginalName();
        	$filename = $event->id . '_' . $file->getClientOriginalName();
        	$uploadSuccess = $file->move($destinationPath, $filename);

        	//$event->report_path = $destinationPath .'\\'. $filename;
        	$event->report_path = $filename;
        	$event->save();
    	}

		return Redirect::to('event')->with('message', 'Successfully updated event information for ID No '.$event->id);
	
		}
	}


	public function editobjectives($id)
	{
		$event = UNHLSEvent::find($id);


		return View::make('event.editobjectives')->with('event', $event);
	}


	public function updateobjectives($id)
	{
		// store

		$objective = new UNHLSEventObjective;

		$objective->objective = Input::get('objective');
		$objective->event_id = Input::get('event_id');

		$objective->save();
    	

		return Redirect::to('event/'.$objective->event_id.'/editobjectives')->with('message', 'Successfully updated objectives for for ID No '.$objective->event_id);
	
	}


	public function editlessons($id)
	{
		$event = UNHLSEvent::find($id);


		return View::make('event.editlessons')->with('event', $event);
	}


	public function updatelessons($id)
	{
		// store

		$lesson = new UNHLSEventLesson;

		$lesson->lesson = Input::get('lesson');
		$lesson->event_id = Input::get('event_id');

		$lesson->save();
    	

		return Redirect::to('event/'.$lesson->event_id.'/editlessons')->with('message', 'Successfully updated lessons for for ID No '.$lesson->event_id);
	}


	public function editrecommendations($id)
	{
		$event = UNHLSEvent::find($id);


		return View::make('event.editrecommendations')->with('event', $event);
	}


	public function updaterecommendations($id)
	{
		// store

		$recommendation = new UNHLSEventRecommendation;

		$recommendation->recommendation = Input::get('recommendation');
		$recommendation->event_id = Input::get('event_id');

		$recommendation->save();
    	

		return Redirect::to('event/'.$recommendation->event_id.'/editrecommendations')->with('message', 'Successfully updated recommendations for for ID No '.$recommendation->event_id);
	}


	public function editactions($id)
	{
		$event = UNHLSEvent::find($id);


		return View::make('event.editactions')->with('event', $event);
	}


	public function updateactions($id)
	{
		// store

		$action = new UNHLSEventAction;

		$action->action = Input::get('action');
		$action->event_id = Input::get('event_id');

		$action->save();
    	

		return Redirect::to('event/'.$action->event_id.'/editactions')->with('message', 'Successfully updated recommendations for for ID No '.$action->event_id);
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
