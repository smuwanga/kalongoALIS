<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class Bbincidence extends Eloquent
{
	/**
	 * Enabling soft deletes for patient details.
	 *
	 */
	use SoftDeletingTrait;
	protected $dates = ['deleted_at'];
    	
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'unhls_bbincidences';
	
	
	/**
	 * Facility relationship
	 */
	public function facility()
	{
		return $this->belongsTo('Facility', 'facility_id', 'id');
	}
	
	/**
	 * User relationship
	 */
	public function user()
	{
		return $this->belongsTo('User', 'createdby', 'id');
	}
	
	/**
	 * Nature relationship
	 */
	public function bbnature()
	{
		return $this->belongsToMany('BbincidenceNature', 'unhls_bbincidences_nature', 'bbincidence_id', 'nature_id');
	}
	
	/**
	 * Cause relationship
	 */
	public function bbcause()
	{
		return $this->belongsToMany('BbincidenceCause', 'unhls_bbincidences_cause', 'bbincidence_id', 'cause_id');
	}
	
	/**
	 * Action relationship
	 */
	public function bbaction()
	{
		return $this->belongsToMany('BbincidenceAction', 'unhls_bbincidences_action', 'bbincidence_id', 'action_id');
	}

	/**
	* Search for bbincidencinces meeting given criteria
	*
	* @param String $searchText
	* @return Collection 
	*/
	public static function search($searchText)
	{
		return Bbincidence::where('id', '=', $searchText)
						->orWhere('description', 'LIKE', '%'.$searchText.'%')
						->orWhere('serial_no', 'LIKE', '%'.$searchText.'%');
	}

	public static function facility_search($searchText)
	{
		$user_facility = Auth::user()->facility_id;

		/*return Bbincidence::where('id', '=', $searchText)
						->orWhere('description', 'LIKE', '%'.$searchText.'%')
						->orWhere('serial_no', 'LIKE', '%'.$searchText.'%');*/

		return Bbincidence::where(function ($query) use ($user_facility) {$query
			->where('facility_id', '=', $user_facility);
			})->where(function ($query) use ($searchText) {$query
				->where('id', '=', $searchText)
				->orWhere('description', 'LIKE', '%'.$searchText.'%')
				->orWhere('serial_no', 'LIKE', '%'.$searchText.'%');
			});
	}
	
	/**
	* Filter bbincidencinces by dates
	*/
	public static function filterbydate($datefrom,$dateto)
	{
		return Bbincidence::where('occurrence_date', '>=', $datefrom)
						->Where('occurrence_date', '<=', $dateto);
	}

	public static function facility_filterbydate($datefrom,$dateto)
	{
		$user_facility = Auth::user()->facility_id;
		/*return Bbincidence::where('occurrence_date', '>=', $datefrom)
						->Where('occurrence_date', '<=', $dateto);*/

		return Bbincidence::where(function ($query) use ($user_facility) {$query
			->where('facility_id', '=', $user_facility);
			})->where(function ($query) use ($datefrom,$dateto) {$query
				->where('occurrence_date', '>=', $datefrom)
				->Where('occurrence_date', '<=', $dateto);
			});
	}

	public static function countbbincentcategories()
	{
		 
	}
}