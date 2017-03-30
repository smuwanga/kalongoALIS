<?php

use Illuminate\Database\QueryException;

/**
 * Contains test resources  
 * 
 */
class UnhlsTestController extends \BaseController {

	/**
	 * Display a listing of Tests. Factors in filter parameters
	 * The search string may match: patient_number, patient name, test type name, specimen ID or visit ID
	 *
	 * @return Response
	 */
	public function index()
	{

		$fromRedirect = Session::pull('fromRedirect');

		if($fromRedirect){

			$input = Session::get('TESTS_FILTER_INPUT');
			
		}else{

			$input = Input::except('_token');
		}

		$searchString = isset($input['search'])?$input['search']:'';
		$testStatusId = isset($input['test_status'])?$input['test_status']:'';
		$dateFrom = isset($input['date_from'])?$input['date_from']:'';
		$dateTo = isset($input['date_to'])?$input['date_to']:'';

		// Search Conditions
		if($searchString||$testStatusId||$dateFrom||$dateTo){

			$tests = UnhlsTest::search($searchString, $testStatusId, $dateFrom, $dateTo);

			if (count($tests) == 0) {
			 	Session::flash('message', trans('messages.empty-search'));
			}
		}
		else
		{
		// List all the active tests
			$tests = UnhlsTest::orderBy('time_created', 'DESC');
		}

		// Create Test Statuses array. Include a first entry for ALL
		$statuses = array('all')+TestStatus::all()->lists('name','id');

		foreach ($statuses as $key => $value) {
			$statuses[$key] = trans("messages.$value");
		}

		// Pagination
		$tests = $tests->paginate(Config::get('kblis.page-items'))->appends($input);

		//	Barcode
		$barcode = Barcode::first();

		// Load the view and pass it the tests
		return View::make('unhls_test.index')
					->with('testSet', $tests)
					->with('testStatus', $statuses)
					->with('barcode', $barcode)
					->withInput($input);
	}

	/**
	 * Listing of Completed tests
	 *@param
	 * @return Response
	 */
	public function completed()
	{
		$fromRedirect = Session::pull('fromRedirect');

		if($fromRedirect){

			$input = Session::get('TESTS_FILTER_INPUT');
			
		}else{

			$input = Input::except('_token');
		}

		$searchString = isset($input['search'])?$input['search']:'';
		$testStatusId = '4';
		$dateFrom = isset($input['date_from'])?$input['date_from']:'';
		$dateTo = isset($input['date_to'])?$input['date_to']:'';
		$tests = UnhlsTest::CompletedTests();

				// Search Conditions
		if($searchString||$testStatusId||$dateFrom||$dateTo){

			$tests = UnhlsTest::completedTests($searchString, $testStatusId, $dateFrom, $dateTo);

			if (count($tests) == 0) {
			 	Session::flash('message', trans('messages.empty-search'));
			}
		}
		else
		{
		// List all the active tests
			$tests = UnhlsTest::orderBy('time_created', 'DESC');
		}

		// Create Test Statuses array. Include a first entry for ALL
		$statuses = array('all')+TestStatus::all()->lists('name','id');

		foreach ($statuses as $key => $value) {
			$statuses[$key] = trans("messages.$value");
		}

		// Pagination
		$tests = $tests->paginate(Config::get('kblis.page-items'))->appends($input);

		//	Barcode
		$barcode = Barcode::first();

		return View::make('unhls_test.completed')
					->with('testSet', $tests)
					->with('testStatus', $statuses)
					->with('barcode', $barcode)
					->withInput($input);

	}


	/**
	 * Listing of pending tests
	 *@param
	 * @return Response
	 */
	public function pending()
	{
		$fromRedirect = Session::pull('fromRedirect');

		if($fromRedirect){

			$input = Session::get('TESTS_FILTER_INPUT');
			
		}else{

			$input = Input::except('_token');
		}

		$searchString = isset($input['search'])?$input['search']:'';
		$testStatusId = '2';
		$dateFrom = isset($input['date_from'])?$input['date_from']:'';
		$dateTo = isset($input['date_to'])?$input['date_to']:'';

				// Search Conditions
		if($searchString||$testStatusId||$dateFrom||$dateTo){

			$tests = UnhlsTest::pendingTests($searchString, $testStatusId, $dateFrom, $dateTo);

			if (count($tests) == 0) {
			 	Session::flash('message', trans('messages.empty-search'));
			}
		}
		else
		{
		// List all the active tests
			$tests = UnhlsTest::orderBy('time_created', 'DESC');
		}

		// Create Test Statuses array. Include a first entry for ALL
		$statuses = array('all')+TestStatus::all()->lists('name','id');

		foreach ($statuses as $key => $value) {
			$statuses[$key] = trans("messages.$value");
		}

		// Pagination
		$tests = $tests->paginate(Config::get('kblis.page-items'))->appends($input);

		//	Barcode
		$barcode = Barcode::first();

		return View::make('unhls_test.pending')
					->with('testSet', $tests)
					->with('testStatus', $statuses)
					->with('barcode', $barcode)
					->withInput($input);

	}


	/**
	 * Listing of started tests
	 *@param
	 * @return Response
	 */
	public function started()
	{
		$fromRedirect = Session::pull('fromRedirect');

		if($fromRedirect){

			$input = Session::get('TESTS_FILTER_INPUT');
			
		}else{

			$input = Input::except('_token');
		}

		$searchString = isset($input['search'])?$input['search']:'';
		$testStatusId = '3';
		$dateFrom = isset($input['date_from'])?$input['date_from']:'';
		$dateTo = isset($input['date_to'])?$input['date_to']:'';

				// Search Conditions
		if($searchString||$testStatusId||$dateFrom||$dateTo){

			$tests = UnhlsTest::startedTests($searchString, $testStatusId, $dateFrom, $dateTo);

			if (count($tests) == 0) {
			 	Session::flash('message', trans('messages.empty-search'));
			}
		}
		else
		{
		// List all the active tests
			$tests = UnhlsTest::orderBy('time_created', 'DESC');
		}

		// Create Test Statuses array. Include a first entry for ALL
		$statuses = array('all')+TestStatus::all()->lists('name','id');

		foreach ($statuses as $key => $value) {
			$statuses[$key] = trans("messages.$value");
		}

		// Pagination
		$tests = $tests->paginate(Config::get('kblis.page-items'))->appends($input);

		//	Barcode
		$barcode = Barcode::first();

		return View::make('unhls_test.completed')
					->with('testSet', $tests)
					->with('testStatus', $statuses)
					->with('barcode', $barcode)
					->withInput($input);

	}


	/**
	 * Listing of samples not yet recieved
	 *@param
	 * @return Response
	 */
	public function notRecieved()
	{
		$fromRedirect = Session::pull('fromRedirect');

		if($fromRedirect){

			$input = Session::get('TESTS_FILTER_INPUT');
			
		}else{

			$input = Input::except('_token');
		}

		$searchString = isset($input['search'])?$input['search']:'';
		$testStatusId = '1';
		$dateFrom = isset($input['date_from'])?$input['date_from']:'';
		$dateTo = isset($input['date_to'])?$input['date_to']:'';

				// Search Conditions
		if($searchString||$testStatusId||$dateFrom||$dateTo){

			$tests = UnhlsTest::startedTests($searchString, $testStatusId, $dateFrom, $dateTo);

			if (count($tests) == 0) {
			 	Session::flash('message', trans('messages.empty-search'));
			}
		}
		else
		{
		// List all the active tests
			$tests = UnhlsTest::orderBy('time_created', 'DESC');
		}

		// Create Test Statuses array. Include a first entry for ALL
		$statuses = array('all')+TestStatus::all()->lists('name','id');

		foreach ($statuses as $key => $value) {
			$statuses[$key] = trans("messages.$value");
		}

		// Pagination
		$tests = $tests->paginate(Config::get('kblis.page-items'))->appends($input);

		//	Barcode
		$barcode = Barcode::first();

		return View::make('unhls_test.completed')
					->with('testSet', $tests)
					->with('testStatus', $statuses)
					->with('barcode', $barcode)
					->withInput($input);

	}



	/**
	 * Listing of verified tests
	 *@param
	 * @return Response
	 */
	public function verified()
	{
		$fromRedirect = Session::pull('fromRedirect');

		if($fromRedirect){

			$input = Session::get('TESTS_FILTER_INPUT');
			
		}else{

			$input = Input::except('_token');
		}

		$searchString = isset($input['search'])?$input['search']:'';
		$testStatusId = '5';
		$dateFrom = isset($input['date_from'])?$input['date_from']:'';
		$dateTo = isset($input['date_to'])?$input['date_to']:'';

				// Search Conditions
		if($searchString||$testStatusId||$dateFrom||$dateTo){

			$tests = UnhlsTest::verified($searchString, $testStatusId, $dateFrom, $dateTo);

			if (count($tests) == 0) {
			 	Session::flash('message', trans('messages.empty-search'));
			}
		}
		else
		{
		// List all the active tests
			$tests = UnhlsTest::orderBy('time_created', 'DESC');
		}

		// Create Test Statuses array. Include a first entry for ALL
		$statuses = array('all')+TestStatus::all()->lists('name','id');

		foreach ($statuses as $key => $value) {
			$statuses[$key] = trans("messages.$value");
		}

		// Pagination
		$tests = $tests->paginate(Config::get('kblis.page-items'))->appends($input);

		//	Barcode
		$barcode = Barcode::first();

		return View::make('unhls_test.completed')
					->with('testSet', $tests)
					->with('testStatus', $statuses)
					->with('barcode', $barcode)
					->withInput($input);

	}



	/**
	 * Recieve a Test from an external system
	 *
	 * @param
	 * @return Response
	 */
	public function receive($id)
	{
		$test = UnhlsTest::find($id);
		$test->test_status_id = UnhlsTest::PENDING;
		$test->time_created = date('Y-m-d H:i:s');
		$test->created_by = Auth::user()->id;
		$test->save();

		return $id;
	}

	/**
	 *Select all tests under a selected test Category - Test Menu
	 *
	 * @return Response
	 */
	public function testList()
	{
		$id =Input::get('id');
		$tests = DB::table('test_types')->select('id', 'name')->where('test_category_id', $id)->get(); 

		return $tests;
	}

	/**
	 * Display a form for creating a new Test.
	 *
	 * @return Response
	 */
	public function create($patientID = 0)
	{
		if ($patientID == 0) {
			$patientID = Input::get('patient_id');
		}

		//Create a Lab categories Array
		//$categories = array('all')+TestCategory::all('name', 'id'); //unhls test menu varriable
		$categories = array('Click to select Test Menu')+TestCategory::lists('name', 'id');//->get()->lists('name', 'id'); //UNHLS

		/* ($categories as $key => $value) {
			$categories[$key] = $value;
		}*/
		$fromRedirect = Session::pull('TEST_CATEGORY');

		if($fromRedirect){
			$input = Session::get('TEST_CATEGORY');
		}else{
			$input = Input::except('_token');
		}

		$testCategoryId = isset($input['test_cat'])?$input['test_cat']:'';

		if($testCategoryId){
			$testTypes = TestType::where('test_category_id', $testCategoryId);
			if(count($testTypes) == 0){
				Session::flash('message', trans('messages.empty-search'));
			}
		}else {

		$testTypes = TestType::where('orderable_test', 1)-> orderBy('name', 'asc')->get();
		$patient = UnhlsPatient::find($patientID);
		}

		//Load Test Create View
		return View::make('unhls_test.create')
					->with('testtypes', $testTypes)
					->with('patient', $patient)
					->with('testCategory', $categories)
					->with('testId', $testCategoryId);
	}

	/**
	 * Save a new Test.
	 *
	 * @return Response
	 */
	public function saveNewTest()
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
			return Redirect::route('unhls_test.create', 
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
			$visit->save();

			/*
			* - Create tests requested
			* - Fields required: visit_id, test_type_id, specimen_id, test_status_id, created_by, requested_by
			*/
			$testTypes = Input::get('testtypes');
			if(is_array($testTypes)){
				foreach ($testTypes as $value) {
					$testTypeID = (int)$value;
					// Create Specimen - specimen_type_id, accepted_by, referred_from, referred_to
					$specimen = new UnhlsSpecimen;
					$specimen->specimen_type_id = TestType::find($testTypeID)->specimenTypes->lists('id')[0];
					$specimen->accepted_by = Auth::user()->id;
					$specimen->save();

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

			$url = Session::get('SOURCE_URL');
			
			return Redirect::to($url)->with('message', 'messages.success-creating-test')
					->with('activeTest', $activeTest);
		}
	}

	/**
	 * Display Collect page 
	 *
	 * @param
	 * @return
	 */
	public function collectSpecimen($specimenID)
	{
		$specimen = UnhlsSpecimen::find($specimenID);
		

		return View::make('unhls_test.collect')->with('specimen', $specimen);
	}

	/**
	 * Refer action
	 *
	 * @return View
	 */
	public function collectSpecimenAction()
	{
		//Validate
		$rules = array(
			'referral-status' => 'required',
			'facility_id' => 'required|non_zero_key',
			'person',
			'contacts'
			);
		$validator = Validator::make(Input::all(), $rules);
		$specimenId = Input::get('specimen_id');

		if ($validator->fails())
		{
			return Redirect::route('unhls_test.refer', array($specimenId))-> withInput()->withErrors($validator);
		} 

		//Insert into referral table
		

		//Update specimen referral statuss
		//$specimen = Specimen::find($specimenId);
		$specimen =Input::get('specimen_id');

		/*DB::transaction(function() use ($referral, $specimen) {
			$referral->save();
			$specimen->referral_id = $referral->id;
			//$specimen->save();
		});*/

		//Start test
		//Input::merge(array('id' => $specimen->test->id)); //Add the testID to the Input
		//$this->start();

		//Return view
		$url = Session::get('SOURCE_URL');

		return Redirect::to($url)->with('message', 'You have successfully captured specimen collection details');
					//->with('activeTest', array($specimen->test->id));
	}

	/**
	 * Display Rejection page 
	 *
	 * @param
	 * @return
	 */
	public function reject($specimenID)
	{
		$specimen = UnhlsSpecimen::find($specimenID);
		$rejectionReason = RejectionReason::all();
		return View::make('unhls_test.reject')->with('specimen', $specimen)
						->with('rejectionReason', $rejectionReason);
	}

	/**
	 * Display Referral page 
	 *
	 * @param
	 * @return
	 */
	public function refer($specimenID)
	{
		$specimen = UnhlsSpecimen::find($specimenID);
		$referralReason = ReferralReason::all();
		$test = UnhlsTest::find($specimenID);
		return View::make('unhls_test.refer')->with('specimen', $specimen)->with('test', $test)
						->with('referralReason', $referralReason);
	}

	/**
	 * Executes Rejection
	 *
	 * @param
	 * @return
	 */
	public function rejectAction()
	{
		//Reject justifying why.
		$rules = array(
			'rejectionReason' => 'required|non_zero_key',
			'reject_explained_to' => 'required',
		);
		$validator = Validator::make(Input::all(), $rules);

		if ($validator->fails()) {
			return Redirect::route('unhls_test.reject', array(Input::get('specimen_id')))
				->withInput()
				->withErrors($validator);
		} else {
			$specimen = UnhlsSpecimen::find(Input::get('specimen_id'));
			$specimen->rejection_reason_id = Input::get('rejectionReason');
			$specimen->specimen_status_id = UnhlsSpecimen::REJECTED;
			$specimen->rejected_by = Auth::user()->id;
			$specimen->time_rejected = date('Y-m-d H:i:s');
			$specimen->reject_explained_to = Input::get('reject_explained_to');
			$specimen->save();
			
			$url = Session::get('SOURCE_URL');
			
			return Redirect::to($url)->with('message', 'messages.success-rejecting-specimen')
						->with('activeTest', array($specimen->test->id));
		}
	}

	/**
	 * Accept a Test's Specimen
	 *
	 * @param
	 * @return
	 */
	public function accept()
	{
		$specimen = UnhlsSpecimen::find(Input::get('id'));
		$specimen->specimen_status_id = UnhlsSpecimen::ACCEPTED;
		$specimen->accepted_by = Auth::user()->id;
		$specimen->time_accepted = date('Y-m-d H:i:s');
		$specimen->save();

		return $specimen->specimen_status_id;
	}

	/**
	 * Display Change specimenType form fragment to be loaded in a modal via AJAX
	 *
	 * @param
	 * @return
	 */
	public function changeSpecimenType()
	{
		$test = UnhlsTest::find(Input::get('id'));
		return View::make('unhls_test.changeSpecimenType')->with('test', $test);
	}

	/**
	 * Update a Test's SpecimenType
	 *
	 * @param
	 * @return
	 */
	public function updateSpecimenType()
	{
		$specimen = UnhlsSpecimen::find(Input::get('specimen_id'));
		$specimen->specimen_type_id = Input::get('specimen_type');
		$specimen->save();

		return Redirect::route('unhls_test.viewDetails', array($specimen->test->id));
	}

	/**
	 * Starts Test
	 *
	 * @param
	 * @return
	 */
	public function start()
	{
		$test = UnhlsTest::find(Input::get('id'));
		$test->test_status_id = UnhlsTest::STARTED;
		$test->time_started = date('Y-m-d H:i:s');
		$test->save();
		// if the test being carried out requires a culture worksheet
		if ($test->testType->microbiologyTestType->worksheet_required) {
			$culture = new Culture;
			$culture->user_id = Auth::user()->id;
			$culture->test_id = $test->id;
			$culture->save();
		}
		return $test->test_status_id;
	}

	/**
	 * Display Result Entry page
	 *
	 * @param
	 * @return
	 */
	public function enterResults($testID)
	{
		$test = UnhlsTest::find($testID);
		// if the test being carried out requires a culture worksheet
		try {
			$test->testType->microbiologyTestType->worksheet_required;
			return Redirect::route('culture.edit', [$test->culture->id]);
		} catch (Exception $e){
			return View::make('unhls_test.enterResults')->with('test', $test);
		}
	}

	/**
	 * Returns test result intepretation
	 * @param
	 * @return
	 */
	public function getResultInterpretation()
	{
		$result = array();
		//save if it is available
		
		if (Input::get('age')) {
			$result['birthdate'] = Input::get('age');
			$result['gender'] = Input::get('gender');
		}
		$result['measureid'] = Input::get('measureid');
		$result['measurevalue'] = Input::get('measurevalue');

		$measure = new Measure;
		return $measure->getResultInterpretation($result);
	}

	/**
	 * Saves Test Results
	 *
	 * @param $testID to save
	 * @return view
	 */
	public function saveResults($testID)
	{
		$test = UnhlsTest::find($testID);
		$test->test_status_id = UnhlsTest::COMPLETED;
		$test->interpretation = Input::get('interpretation');
		$test->tested_by = Auth::user()->id;
		$test->time_completed = date('Y-m-d H:i:s');
		$test->save();
		
		foreach ($test->testType->measures as $measure) {
			$testResult = UnhlsTestResult::firstOrCreate(array('test_id' => $testID, 'measure_id' => $measure->id));
			$testResult->result = Input::get('m_'.$measure->id);

			$inputName = "m_".$measure->id;
			$rules = array("$inputName" => 'max:255');

			$validator = Validator::make(Input::all(), $rules);

			if ($validator->fails()) {
				return Redirect::back()->withErrors($validator)->withInput(Input::all());
			} else {
				$testResult->save();
			}
		}

		//Fire of entry saved/edited event
		Event::fire('test.saved', array($testID));

		$input = Session::get('TESTS_FILTER_INPUT');
		Session::put('fromRedirect', 'true');

		// Get page
		$url = Session::get('SOURCE_URL');
		$urlParts = explode('&', $url);
		if(isset($urlParts['page'])){
			$pageParts = explode('=', $urlParts['page']);
			$input['page'] = $pageParts[1];
		}

		// redirect
		return Redirect::action('UnhlsTestController@index')
					->with('message', trans('messages.success-saving-results'))
					->with('activeTest', array($test->id))
					->withInput($input);
	}

	/**
	 * Display Edit page
	 *
	 * @param
	 * @return
	 */
	public function edit($testID)
	{
		$test = UnhlsTest::find($testID);
		// if the test being carried out requires a culture worksheet
		try {
			$test->testType->microbiologyTestType->worksheet_required;
			return Redirect::route('culture.edit', [$test->culture->id]);
		} catch (Exception $e){
			return View::make('unhls_test.edit')->with('test', $test);
		}

	}

	/**
	 * Display Test Details
	 *
	 * @param
	 * @return
	 */
	public function viewDetails($testID)
	{
		//$result = Test::find($testID)->toSql(); to be deleted for debuging
		//dd($result);
		return View::make('unhls_test.viewDetails')->with('test', UnhlsTest::find($testID));
		//var_dump($test);
	}

	/**
	 * Verify Test
	 *
	 * @param
	 * @return
	 */
	public function verify($testID)
	{
		$test = UnhlsTest::find($testID);
		$test->test_status_id = UnhlsTest::VERIFIED;
		$test->time_verified = date('Y-m-d H:i:s');
		$test->verified_by = Auth::user()->id;
		$test->save();

		//Fire of entry verified event
		Event::fire('test.verified', array($testID));

		return View::make('unhls_test.viewDetails')->with('test', $test);
	}

	/**
	 * Refer the test
	 *
	 * @param specimenId
	 * @return View
	 */
	public function showRefer($specimenId)
	{
		$unhlsspecimen = UnhlsSpecimen::find($specimenId);
		$unhlspatient = UnhlsPatient::find('$specimenId');
		$facilities = UNHLSFacility::all();
		//Referral facilities
		$referralReason = ReferralReason::all();
		return View::make('unhls_test.refer')
			->with('unhlsspecimen', $unhlsspecimen)
			->with('unhlspatient', $unhlspatient)
			->with('facilities', $facilities)
			->with('referralReason', $referralReason);

	}

	/**
	 * Refer action
	 *
	 * @return View
	 */
	public function referAction()
	{
		//Validate
		$rules = array(
			'referral-status' => 'required',
			'facility_id' => 'required|non_zero_key',
			'person',
			'contacts'
			);
		$validator = Validator::make(Input::all(), $rules);
		$specimenId = Input::get('specimen_id');

		if ($validator->fails())
		{
			return Redirect::route('unhls_test.refer', array($specimenId))-> withInput()->withErrors($validator);
		}

		//Insert into referral table
		$referral = new Referral();
		$referral->status = Input::get('referral-status');
		$referral->facility_id = Input::get('facility_id');
		$referral->person = Input::get('person');
		$referral->contacts = Input::get('contacts');
		$referral->user_id = Auth::user()->id;

		//Update specimen referral status
		$specimen = UnhlsSpecimen::find($specimenId);

		DB::transaction(function() use ($referral, $specimen) {
			$referral->save();
			$specimen->referral_id = $referral->id;
			$specimen->save();
		});

		//Start test
		Input::merge(array('id' => $specimen->test->id)); //Add the testID to the Input
		$this->start();

		//Return view
		$url = Session::get('SOURCE_URL');
		
		return Redirect::to($url)->with('message', trans('messages.specimen-successful-refer'))
					->with('activeTest', array($specimen->test->id));
	}
	/**
	 * Culture worksheet for Test
	 *
	 * @param
	 * @return
	 */
	public function culture()
	{
		$test = UnhlsTest::find(Input::get('testID'));
		$test->test_status_id = UnhlsTest::VERIFIED;
		$test->time_verified = date('Y-m-d H:i:s');
		$test->verified_by = Auth::user()->id;
		$test->save();

		//Fire of entry verified event
		Event::fire('unhls_test.verified', array($testID));

		return View::make('unhls_test.viewDetails')->with('test', $test);
	}

}