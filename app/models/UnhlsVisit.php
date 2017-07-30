<?php

class UnhlsVisit extends Eloquent
{
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'unhls_visits';

	public $timestamps = true;


	const TEST_REQUEST_PENDING = 1;
	const TEST_REQUEST_MADE = 2;
	const SPECIMEN_RECEIVED = 3;
	const TESTS_COMPLETED = 4;

	/**
	 * Test relationship
	 */
	public function tests()
	{
		return $this->hasMany('UnhlsTest', 'visit_id');
	}

	/**
	 * Test relationship
	 */
	public function ward()
	{
		return $this->belongsTo('Ward', 'ward_id');
	}

	/**
	 * Patient relationship
	 */
	public function patient()
	{
		return $this->belongsTo('UnhlsPatient');
	}

	/**
	 * status
	 */
	public function visitStatus()
	{
		return $this->belongsTo('VisitStatus');
	}

	/**
	 * Specimen relationship
	 */
	public function specimens()
	{
		return $this->belongsTo('UnhlsSpecimen', 'visit_id');
	}

	/**
	 * Search for visits meeting the given criteria
	 *
	 * @param String $searchString
	 * @param String $visitStatusId
	 * @param String $dateFrom
	 * @param String $dateTo
	 * @return Collection
	 */
	public static function search($searchString = '', $visitStatusId = 0, $dateFrom = NULL, $dateTo = NULL)
	{
// $searchString = 'ABOKE';
// Log::info($searchString);
		$visits = UnhlsVisit::with('patient')->where(function($q) use ($searchString){

			$q->whereHas('patient', function($q)  use ($searchString){
				$q->where(function($q) use ($searchString){
					$q->where('external_patient_number', 'like', '%' . $searchString . '%')
					  ->orWhere('patient_number', 'like', '%' . $searchString . '%')
					  ->orWhere('name', 'like', '%' . $searchString . '%')
					  ->orWhere('ulin', 'like', '%' . $searchString . '%');
				});
			});
		});

		/*
		Problematic this right now
		})->where(function($q) use ($searchString){
			$q->where('visit_number', '=', $searchString )//Search by visit number
			->orWhere('id', '=', $searchString);
		});
		*/
// Log::info($visitStatusId);
		if ($visitStatusId > 0) {
			// $visits = UnhlsVisit::where(function($q) use ($visitStatusId)
			$visits = $visits->where(function($q) use ($visitStatusId)
			{
				$q->where('visit_status_id','=', $visitStatusId);
			});
		}

// Log::info($dateFrom);
// Log::info($dateTo);
		//  put default to get content for today
		if ($dateFrom||$dateTo) {
// Log::info('in the date search');
			// $visits = UnhlsVisit::where(function($q) use ($dateFrom, $dateTo)
			$visits = $visits->where(function($q) use ($dateFrom, $dateTo)
			{
				if($dateFrom)$q->where('created_at', '>=', $dateFrom);

				if($dateTo){
					$dateTo = $dateTo . ' 23:59:59';
					$q->where('created_at', '<=', $dateTo);
				}
			});
		}

		$visits = $visits->orderBy('created_at', 'ASC');

		return $visits;
	}
}
