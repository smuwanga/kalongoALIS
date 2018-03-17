<?php

use Illuminate\Database\QueryException;

/**
 *Contains functions for managing patient records
 *
 */
class PocController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
		{
		$search = Input::get('search');

		$patients = POC::all();
		// ->paginate(Config::get('kblis.page-items'))->appends(Input::except('_token'));

		if (count($patients) == 0) {
		 	Session::flash('message', trans('messages.no-match'));
		}

		// Load the view and pass the patients
		$antenatal = array('0'=>'Lifelong ART', '1' => 'No ART', '2' => 'UNKNOWN');
		return View::make('poc.index')
		->with('antenatal',$antenatal)
		->with('patients', $patients)->withInput(Input::all());
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//Create patients
		$hiv_status = array('0' => 'Positive', '1' => 'Negative', '2' => 'Unknown');
		// $entry_point = array('0' => '', '1' => 'Negative', '2' => 'Unknown');
		$antenatal= array('0'=>'Lifelong ART', '1' => 'No ART', '2' => 'UNKNOWN');

		return View::make('poc.create')
		->with('hiv_status', $hiv_status)
			->with('antenatal', $antenatal);
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

			'infant_name' => 'required',
			'age'       => 'required',
			'gender' => 'required',
			'mother_name' => 'required' ,
			// 'entry_point' => 'required' ,
		);
		$validator = Validator::make(Input::all(), $rules);

		if ($validator->fails()) {

			return Redirect::back()->withErrors($validator)->withInput(Input::all());
		} else {
			// store



$patient = new POC;
$patient->district_id = \Config::get('constants.DISTRICT_ID');
$patient->facility_id = \Config::get('constants.FACILITY_ID');
// $patient->facility_id	= Input::get('facility_id');
// $patient->district_id	= Input::get('district_id');
$patient->gender	= Input::get('gender');
$patient->age	= Input::get('age');
$patient->exp_no = Input::get('exp_no');
$patient->caretaker_number	= Input::get('caretaker_number');
$patient->admission_date	= Input::get('admission_date');
$patient->breastfeeding_status	= Input::get('breastfeeding_status');
$patient->entry_point	= Input::get('entry_point');
$patient->mother_name	= Input::get('mother_name');
$patient->infant_name	= Input::get('infant_name');
$patient->mother_hiv_status	= Input::get('mother_hiv_status');
$patient->collection_date	= Input::get('collection_date');
$patient->pcr_level	= Input::get('pcr_level');
$patient->pmtct_antenatal	= Input::get('pmtct_antenatal');
$patient->pmtct_delivery	= Input::get('pmtct_delivery');
$patient->pmtct_postnatal	= Input::get('pmtct_postnatal');
$patient->sample_id	= Input::get('sample_id');
$patient->created_by = Auth::user()->id;
// $patient->sample_received_by	= Input::get('sample_received_by');
// $patient->sample_received_date	= Input::get('sample_received_date');
// $patient->tested_by	= Input::get('tested_by');
// $patient->test_date	= Input::get('test_date');
// $patient->device_used	= Input::get('device_used');
// $patient->result	= Input::get('result');
// $patient->error_code	= Input::get('error_code');
// $patient->results_reviewed_by	= Input::get('results_reviewed_by');
// $patient->date_reviewed	= Input::get('date_reviewed');
// $patient->results_dispatched_by	= Input::get('results_dispatched_by');


			try{
				$patient->save();

				return Redirect::route('poc.index')
				->with('message', 'Successfully saved patient information:!');

			}catch(QueryException $e){
				Log::error($e);
				echo $e->getMessage();
			}

			// redirect
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
		//Show a patient
		$patient = POC::find($id);

		//Show the view and pass the $patient to it
		return View::make('poc.show')->with('patient', $patient);
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//Get the patient
		$patient = POC::find($id);
		$antenatal= array('0'=>'Ante-natal', '1' => 'Delivery', '2' => 'Post-natal');

		//Open the Edit View and pass to it the $patient
		return View::make('poc.edit')
		->with('antenatal', $antenatal)
		->with('patient', $patient);
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
		$rules = array(
			'infant_name' => 'required',
			'age'       => 'required',
			'gender' => 'required',
			'mother_name' => 'required'
		);
		$validator = Validator::make(Input::all(), $rules);

		// process the login
		if ($validator->fails()) {
			return Redirect::to('poc/' . $id . '/edit')
				->withErrors($validator)
				->withInput(Input::except('password'));
		}

		 else {
			// Update
			$patient = POC::find($id);

			$patient->district_id = \Config::get('constants.DISTRICT_ID');
			$patient->facility_id = \Config::get('constants.FACILITY_ID');
			// $patient->facility_id	= Input::get('facility_id');
			// $patient->district_id	= Input::get('district_id');
			$patient->gender	= Input::get('gender');
			$patient->age	= Input::get('age');
			$patient->exp_no = Input::get('exp_no');
			$patient->caretaker_number	= Input::get('caretaker_number');
			$patient->admission_date	= Input::get('admission_date');
			$patient->entry_point	= Input::get('entry_point');
			$patient->mother_name	= Input::get('mother_name');
			$patient->infant_name	= Input::get('infant_name');
			$patient->infant_pmtctarv	= Input::get('infant_pmtctarv');
			$patient->mother_hiv_status	= Input::get('mother_hiv_status');
			$patient->collection_date	= Input::get('collection_date');
			$patient->pcr_level	= Input::get('pcr_level');
			// $patient->pmtct_antenatal	= Input::get('pmtct_antenatal');
			// $patient->pmtct_delivery	= Input::get('pmtct_delivery');
			// $patient->pmtct_postnatal	= Input::get('pmtct_postnatal');
			$patient->sample_id	= Input::get('sample_id');
			$patient->created_by = Auth::user()->id;
			// $patient->sample_received_by	= Input::get('sample_received_by');
			// $patient->sample_received_date	= Input::get('sample_received_date');
			// $patient->tested_by	= Input::get('tested_by');
			// $patient->test_date	= Input::get('test_date');
			// $patient->device_used	= Input::get('device_used');
			// $patient->result	= Input::get('result');
			// $patient->error_code	= Input::get('error_code');
			// $patient->results_reviewed_by	= Input::get('results_reviewed_by');
			// $patient->date_reviewed	= Input::get('date_reviewed');
			// $patient->results_dispatched_by	= Input::get('results_dispatched_by');

			$patient->save();

			// redirect
			$url = Session::get('SOURCE_URL');
			return Redirect::to($url)
			->with('message', 'The patient details were successfully updated!') ->with('activepatient',$patient ->id);

		}
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
	 * Remove the specified resource from storage (soft delete).
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function delete($id)
	{
		//Soft delete the patient
		$patient = UnhlsPatient::find($id);

		$patient->delete();

		// redirect
			$url = Session::get('SOURCE_URL');
			return Redirect::to($url)
			->with('message', 'The commodity was successfully deleted!');
	}

	/**
	 * Return a Patients collection that meets the searched criteria as JSON.
	 *
	 * @return Response
	 */
	public function search()
	{
        return UnhlsPatient::search(Input::get('text'))->take(Config::get('kblis.limit-items'))->get()->toJson();
	}

	/**
	 *Return a unique Lab Number
	 *
	 * @return string of current age concatenated with incremental Number.
	 */
	// Private function generateUniqueLabID(){

	// 	//Get Year, Month and day of today. If Jan O1 then reset last insert ID to 1 to start a new cycle of IDs
	// 	$year = date('Y');
	// 	$month = date('m');
	// 	$day = date('d');

	// 	if($month == '01' && $day == '01'){
	// 		$lastInsertId = 1;
	// 	}
	// 	else{
	// 		$lastInsertId = DB::table('unhls_patients')->max('id')+1;
	// 	}
	// 	$fcode = \Config::get('constants.FACILITY_CODE');
	// 	$num = $year.str_pad($lastInsertId, 6, '0', STR_PAD_LEFT);
	// 	return $fcode.'-'.$num;
	// }


}
