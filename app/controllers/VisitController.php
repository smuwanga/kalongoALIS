<?php

class VisitController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		$visits = UnhlsVisit::all();
		return View::make('visit.index')->with('visits', $visits);
	}


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create($patientID = 0)
	{
		if ($patientID == 0) {
			$patientID = Input::get('patient_id');
		}

		//Create a Lab categories Array
		$categories = ['Select Lab Section']+TestCategory::lists('name', 'id');
		$wards = ['Select Sample Origin']+Ward::lists('name', 'id');

		// sample collection default details
		$now = new DateTime();
		$collectionDate = $now->format('Y-m-d H:i');
		$receptionDate = $now->format('Y-m-d H:i');

		$fromRedirect = Session::pull('TEST_CATEGORY');

		if($fromRedirect){
			$input = Session::get('TEST_CATEGORY');
		}else{
			$input = Input::except('_token');
		}

		$specimenTypes = ['select Specimen Type']+SpecimenType::lists('name', 'id');

		$patient = UnhlsPatient::find($patientID);

		//Load Test Create View
		return View::make('visit.create')
					->with('collectionDate', $collectionDate)
					->with('receptionDate', $receptionDate)
					->with('specimenType', $specimenTypes)
					->with('patient', $patient)
					->with('testCategory', $categories)
					->with('ward', $wards);
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		//Create New Test
		$rules = array(
			'visit_type' => 'required',
			'physician' => 'required',
			'testtypes' => 'required',
		);
		$validator = Validator::make(Input::all(), $rules);

		// process the login
		if ($validator->fails()) {
			return Redirect::route('visit.create', 
				array(Input::get('patient_id')))->withInput()->withErrors($validator);
		} else {

			$visitType = ['Out-patient','In-patient'];
			$activeTest = array();

			/*
			 * - Create a visit
			 * - Fields required: visit_type, patient_id
			 */
			$visit = new UnhlsVisit;
			$visit->patient_id = Input::get('patient_id');
			$visit->visit_type = $visitType[Input::get('visit_type')];
			$visit->ward_id = Input::get('ward_id');
			$visit->bed_no = Input::get('bed_no');
			$visit->save();

			$therapy = new Therapy;
			$therapy->patient_id = Input::get('patient_id');
			$therapy->visit_id = $visit->id;
			$therapy->previous_therapy = Input::get('previous_therapy');
			$therapy->current_therapy = Input::get('current_therapy');
			$therapy->save();

			// make this functional
			/*$clinician = new Clinician;
			$clinician->name = Input::get('physician');// practitioner
			$clinician->cadre = Input::get('cadre');// designation
			$clinician->phone_contact = Input::get('phone_contact');
			$clinician->email = Input::get('email');
			$clinician->save();*/

			/*
			 * - Create tests requested
			 * - Fields required: visit_id, test_type_id, specimen_id, test_status_id, created_by, requested_by
			 */
            $testLists = Input::get('test_list');
            if(is_array($testLists)){
                foreach ($testLists as $testList) {
                    // Create Specimen - specimen_type_id, accepted_by, referred_from, referred_to
                    $specimen = new UnhlsSpecimen;
                    $specimen->specimen_type_id = $testList['specimen_type_id'];
                    $specimen->accepted_by = Auth::user()->id;
                    $specimen->time_collected = Input::get('collection_date');
                    $specimen->time_accepted = Input::get('reception_date');
                    $specimen->save();
                    foreach ($testList['test_type_id'] as $id) {
                        $testTypeID = (int)$id;

                        $test = new UnhlsTest;
                        $test->visit_id = $visit->id;
                        $test->test_type_id = $testTypeID;
                        $test->specimen_id = $specimen->id;
                        $test->test_status_id = UnhlsTest::PENDING;
                        $test->created_by = Auth::user()->id;
                        $test->requested_by = Input::get('physician');
                        $test->save();

                        $activeTest[] = $test->id;
                    }
                }
            }

			$url = Session::get('SOURCE_URL');
			
			return Redirect::to($url)->with('message', 'messages.success-creating-test')
					->with('activeTest', $activeTest);
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
		if ($patientID == 0) {
			$patientID = Input::get('patient_id');
		}

		//Create a Lab categories Array
		$categories = ['Select Lab Section']+TestCategory::lists('name', 'id');
		$wards = ['Select Sample Origin']+Ward::lists('name', 'id');

		// sample collection default details
		$now = new DateTime();
		$collectionDate = $now->format('Y-m-d H:i');
		$receptionDate = $now->format('Y-m-d H:i');

		$fromRedirect = Session::pull('TEST_CATEGORY');

		if($fromRedirect){
			$input = Session::get('TEST_CATEGORY');
		}else{
			$input = Input::except('_token');
		}

		$specimenTypes = ['select Specimen Type']+SpecimenType::lists('name', 'id');

		$patient = UnhlsPatient::find($patientID);

		//Load Test Create View
		return View::make('visit.create')
					->with('collectionDate', $collectionDate)
					->with('receptionDate', $receptionDate)
					->with('specimenType', $specimenTypes)
					->with('patient', $patient)
					->with('testCategory', $categories)
					->with('ward', $wards);
	}


	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		//Create New Test
		$rules = array(
			'visit_type' => 'required',
			'physician' => 'required',
			'testtypes' => 'required',
		);
		$validator = Validator::make(Input::all(), $rules);

		// process the login
		if ($validator->fails()) {
			return Redirect::route('visit.create', 
				array(Input::get('patient_id')))->withInput()->withErrors($validator);
		} else {

			$visitType = ['Out-patient','In-patient'];
			$activeTest = array();

			/*
			 * - Create a visit
			 * - Fields required: visit_type, patient_id
			 */
			$visit = new UnhlsVisit;
			$visit->patient_id = Input::get('patient_id');
			$visit->visit_type = $visitType[Input::get('visit_type')];
			$visit->ward_id = Input::get('ward_id');
			$visit->bed_no = Input::get('bed_no');
			$visit->save();

			$therapy = new Therapy;
			$therapy->patient_id = Input::get('patient_id');
			$therapy->visit_id = $visit->id;
			$therapy->previous_therapy = Input::get('previous_therapy');
			$therapy->current_therapy = Input::get('current_therapy');
			$therapy->save();

			/*
			 * - Create tests requested
			 * - Fields required: visit_id, test_type_id, specimen_id, test_status_id, created_by, requested_by
			 */
            $testLists = Input::get('test_list');
            if(is_array($testLists)){
                foreach ($testLists as $testList) {
                    // Create Specimen - specimen_type_id, accepted_by, referred_from, referred_to
                    $specimen = new UnhlsSpecimen;
                    $specimen->specimen_type_id = $testList['specimen_type_id'];
                    $specimen->accepted_by = Auth::user()->id;
                    $specimen->time_collected = Input::get('collection_date');
                    $specimen->time_accepted = Input::get('reception_date');
                    $specimen->save();
                    foreach ($testList['test_type_id'] as $id) {
                        $testTypeID = (int)$id;

                        $test = new UnhlsTest;
                        $test->visit_id = $visit->id;
                        $test->test_type_id = $testTypeID;
                        $test->specimen_id = $specimen->id;
                        $test->test_status_id = UnhlsTest::PENDING;
                        $test->created_by = Auth::user()->id;
                        $test->requested_by = Input::get('physician');
                        $test->save();

                        $activeTest[] = $test->id;
                    }
                }
            }

			$url = Session::get('SOURCE_URL');
			
			return Redirect::to($url)->with('message', 'messages.success-creating-test')
					->with('activeTest', $activeTest);
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
}
