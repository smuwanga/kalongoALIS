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
		$visits = UnhlsVisit::with('patient')->where(function($q) use ($searchString){

			$q->whereHas('patient', function($q)  use ($searchString)
			{
				$q->where(function($q) use ($searchString){
					$q->where('external_patient_number', '=', $searchString )
					  ->orWhere('patient_number', '=', $searchString )
					  ->orWhere('name', 'like', '%' . $searchString . '%')
					  ->orWhere('ulin', 'like', '%' . $searchString . '%');
				});
			})
		})->where(function($q) use ($searchString){
			$q->where('visit_number', '=', $searchString )//Search by visit number
			->orWhere('id', '=', $searchString);
		});

		if ($visitStatusId > 0) {
			$visits = $visits->where(function($q) use ($visitStatusId)
			{
			    $q->where('visit_status_id','=', $visitStatusId);
			});
		}

		//  put default to get content for today
		if ($dateFrom||$dateTo) {
			$visits = $visits->where(function($q) use ($dateFrom, $dateTo)
			{
				if($dateFrom)$q->where('time_created', '>=', $dateFrom);

				if($dateTo){
					$dateTo = $dateTo . ' 23:59:59';
					$q->where('time_created', '<=', $dateTo);
				}
			});
		}

		$visits = $visits->orderBy('time_created', 'ASC');

		return $visits;
	}
}
