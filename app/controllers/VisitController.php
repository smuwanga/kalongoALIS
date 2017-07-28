<?php

class VisitController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{

/*
- receptionist will just create the visit(request) which will appear on the doctor's queue
- doctor

on the side bar show...
patient queue

new users

receptionist(creates new patient, creates new visit, can delete visit)
clinician(makes requests on new visits, using a list generated from test menu complete with lab sections, can delete tests if no specimen attached to it yet)
phlebotomist(accepts specimens on the new visit, can delete specimens)
technologist(can enter results, can edit results)


lists without considering, user

new visits - for doctor, first of the day listed first
new (visits) requests - (with specimen not recieved)for phlebotomist, first of the day listed first, action = send to clinician
new (visits) requests - (with specimen recieved) for technologist, first of the day listed first
new (tests pending) requests - (with specimen recieved) for technologist, first of the day listed first
new (tests started) requests - first of the day listed first
new (tests completed) requests - first of the day listed first
new (tests verified) requests - first of the day listed first

	patients


visit
if receptionist
	view new visits of the day
	create new visits of the day
if clinician
	view new visits of the day
	create new tests of the day
if phlebotomist
	view new visits of the day with test requests
	create new specimens
if technologist
	view new visits with test requests and specimens


visit to have new statuses
request_pending
request_made
sample_collected
report_ready


the phlebotomist will recieved the specimen and attach it to test of that patient that has no specimen

if receptionist
	new visits
if clinician
	new visits
if phlebotomist
	new requests
if technologist
	Lab Requests
	Lab Reports

	all tests
	pending tests
	started tests
	completed tests
	veriffied tests

list namin for the different users

on registering a patient auto generate a visit, and tell the plebotomist

the search should work depending on permissions of the fellow
- a drop down of where he is working and say you don't have access rights for this page please contact A-LIS focal person

*/
		$fromRedirect = Session::pull('fromRedirect');

		if($fromRedirect){
			$input = Session::get('TESTS_FILTER_INPUT');
		}else{
			$input = Input::except('_token');
		}

		$searchString = isset($input['search'])?$input['search']:'';
		$visitStatusId = isset($input['visit_status'])?$input['visit_status']:'';
		$dateFrom = isset($input['date_from'])?$input['date_from']:date('Y-m-d');
		$dateTo = isset($input['date_to'])?$input['date_to']:date('Y-m-d');

		// todays date overriding any input, put according to role of user
		// $dateFrom = date('Y-m-d');
$dateFrom = date('2017-07-04');
		// $dateFrom = date('2017-07-10 00:00:00');
		// Log::info($dateFrom);
		// $dateTo = date('Y-m-d');
/*
		reset visit status depending on permssions
		even for what is returned to the interface
		$visitStatusId = isset($input['visit_status'])?$input['visit_status']:'';
		if (condition) {
			$input['visit_status'] = etc
		}
*/
		// Search Conditions
		if($searchString||$visitStatusId||$dateFrom||$dateTo){

			$visits = UnhlsVisit::search($searchString, $visitStatusId, $dateFrom, $dateTo);

			if (count($visits) == 0) {
				Session::flash('message', trans('messages.empty-search'));
			}
		}
		else
		{
		// List all the active visits
			$visits = UnhlsVisit::orderBy('created_at', 'ASC');
		}

		// Create Visit Statuses array. Include a first entry for ALL
		$statuses = array('all')+VisitStatus::all()->lists('name','id');

		foreach ($statuses as $key => $value) {
			$statuses[$key] = trans("messages.$value");
		}

		// Pagination
		// $visits = $visits->paginate(Config::get('kblis.page-items'))->appends($input);
		$visits = $visits->paginate(Config::get('kblis.page-items'));

		//	Barcode
		$barcode = Barcode::first();

		// Load the view and pass it the visits
		return View::make('visit.index')
					->with('visits', $visits)
					->with('visitStatus', $statuses)
					->with('barcode', $barcode)
					->withInput($input);
	}

/*
new functions functions
create visit
store visit
requestTest
requestTestStore
receiveSpecimen
receiveSpecimenStore
show visit
- list tests
*/

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
		return View::make('visit.appointment.create')
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
		// list all information on the visit and permission to access them
	}


	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
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

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function requestTestCreate($visitID)
	{
		//Create a Lab categories Array
		$categories = ['Select Lab Section']+TestCategory::lists('name', 'id');

		$visit = UnhlsVisit::find($visitID);

		//Load Test Create View
		return View::make('visit.request.create')
					->with('visit', $visit)
					->with('testCategory', $categories)
					->with('ward', $wards);
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function requestTestStore($visitId)
	{
		//Create New Test
		$rules = array(
			// 'visit_type' => 'required',
			'physician' => 'required',
			'testtypes' => 'required',
		);
		$validator = Validator::make(Input::all(), $rules);

		// process the login
		if ($validator->fails()) {
			return Redirect::route('visit.create', 
				array(Input::get('patient_id')))->withInput()->withErrors($validator);
		} else {

			// $visitType = ['Out-patient','In-patient'];
			$activeTest = array();

			/*
			 * - Create a visit
			 * - Fields required: visit_type, patient_id
			 */
			$visit = UnhlsVisit::find($visitId);
			// $visit->patient_id = Input::get('patient_id');
			// $visit->visit_type = $visitType[Input::get('visit_type')];
			// $visit->ward_id = Input::get('ward_id');
			// $visit->bed_no = Input::get('bed_no');
			$visit->status_id = Visit::TEST_REQUEST_MADE;
			$visit->save();

			$therapy = new Therapy;
			$therapy->patient_id = Input::get('patient_id');
			$therapy->visit_id = $visit->id;
			$therapy->previous_therapy = Input::get('previous_therapy');
			$therapy->current_therapy = Input::get('current_therapy');
			$therapy->clinical_notes = Input::get('clinical_notes');
			$therapy->clinician = Input::get('clinician');
			$therapy->contact = Input::get('contact');
			$therapy->save();

			/*
			 * - Create tests requested
			 * - Fields required: visit_id, test_type_id, specimen_id, test_status_id, created_by, requested_by
			 */
            $testLists = Input::get('test_list');
            if(is_array($testLists)){
                foreach ($testLists as $testList) {
                    // Create Specimen - specimen_type_id, accepted_by, referred_from, referred_to
                    /*
                    $specimen = new UnhlsSpecimen;
                    $specimen->specimen_type_id = $testList['specimen_type_id'];
                    $specimen->accepted_by = Auth::user()->id;
                    $specimen->time_collected = Input::get('collection_date');
                    $specimen->time_accepted = Input::get('reception_date');
                    $specimen->save();
                    */
                    foreach ($testList['test_type_id'] as $id) {
                        $testTypeID = (int)$id;

                        $test = new UnhlsTest;
                        $test->visit_id = $visit->id;
                        $test->test_type_id = $testTypeID;
                        // $test->specimen_id = $specimen->id;
                        $test->test_status_id = UnhlsTest::SPECIMEN_NOT_RECEIVED;
                        $test->created_by = Auth::user()->id;
                        $test->requested_by = Input::get('clinician');
                        $test->save();

                        // $activeTest[] = $test->id;
                    }
                }
            }

			$url = Session::get('SOURCE_URL');
			// todo: return the relevant sauccess message, also make the clinician able to view with relevant details
			return Redirect::to($url)->with('message', 'messages.success-creating-test');
					// ->with('activeTest', $activeTest);
		}

	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function receiveSpecimenCreate($visitID)
	{
		// if ($visitID == 0) {
			// $visitID = Input::get('patient_id');
		// }
		$visit = UnhlsVisit::find($visitID);
		//Create a Lab categories Array
		$categories = ['Select Lab Section']+TestCategory::lists('name', 'id');
		// $wards = ['Select Sample Origin']+Ward::lists('name', 'id');

		// sample collection default details
		$now = new DateTime();
		$collectionDate = $now->format('Y-m-d H:i');
		$receptionDate = $now->format('Y-m-d H:i');

/*		$fromRedirect = Session::pull('TEST_CATEGORY');

		if($fromRedirect){
			$input = Session::get('TEST_CATEGORY');
		}else{
			$input = Input::except('_token');
		}*/

		$specimenTypes = ['select Specimen Type']+SpecimenType::lists('name', 'id');

		// $patient = UnhlsPatient::find($patientID);

		//Load Test Create View
		return View::make('visit.specimen.create')
					->with('collectionDate', $collectionDate)
					->with('receptionDate', $receptionDate)
					->with('specimenTypes', $specimenTypes)
					->with('visit', $visit);
					// ->with('patient', $patient)
					// ->with('testCategory', $categories)
					// ->with('ward', $wards);
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function receiveSpecimenStore($visitID)
	{
		//Create New Test
		$rules = array(
			'collection_date' => 'required',
			'reception_date' => 'required',
			// 'testtypes' => 'required',
		);
		$validator = Validator::make(Input::all(), $rules);

		// process the login
		if ($validator->fails()) {
			return Redirect::route('visit.create', 
				array(Input::get('patient_id')))->withInput()->withErrors($validator);
		} else {

			/*$visitType = ['Out-patient','In-patient'];
			$activeTest = array();*/

			/*
			 * - Create a visit
			 * - Fields required: visit_type, patient_id
			 */
			$visit = UnhlsVisit::find($visitID);
			/*$visit->patient_id = Input::get('patient_id');
			$visit->visit_type = $visitType[Input::get('visit_type')];
			$visit->ward_id = Input::get('ward_id');
			$visit->bed_no = Input::get('bed_no');
			$visit->save();*/

			/*$therapy = new Therapy;
			$therapy->patient_id = Input::get('patient_id');
			$therapy->visit_id = $visit->id;
			$therapy->previous_therapy = Input::get('previous_therapy');
			$therapy->current_therapy = Input::get('current_therapy');
			$therapy->save();*/

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
                    foreach ($testList['test_id'] as $id) {
                        $testID = (int)$id;

                        $test = UnhlsTest::find($testID);
                        // $test->visit_id = $visit->id;
                        // $test->test_type_id = $testTypeID;
                        $test->specimen_id = $specimen->id;
                        $test->test_status_id = UnhlsTest::PENDING;
                        // $test->created_by = Auth::user()->id;
                        // $test->requested_by = Input::get('physician');
                        $test->save();

                        // $activeTest[] = $test->id;
                    }
                }
            }

			$url = Session::get('SOURCE_URL');
			
			return Redirect::to($url)->with('message', 'messages.success-creating-test');
					// ->with('activeTest', $activeTest);
		}

	}
}
