<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class TestType extends Eloquent
{

	/**
	 * Enabling soft deletes for specimen type details.
	 *
	 */
	use SoftDeletingTrait;
	protected $dates = ['deleted_at'];
    	
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'test_types';

	/**
	 * TestCategory relationship
	 */
	public function testCategory()
	{
	  return $this->belongsTo('TestCategory', 'test_category_id');
	}

	/**
	 * SpecimenType relationship
	 */
	public function specimenTypes()
	{
	  return $this->belongsToMany('SpecimenType', 'testtype_specimentypes');
	}

	/**
	 * Measures relationship
	 */
	public function measures()
	{
	  return $this->belongsToMany('Measure', 'testtype_measures');
	}

	/**
	 * Test relationship
	 */
    public function tests()
    {
        return $this->hasMany('Test');
    }

	/**
	 * Set compatible specimen types
	 *
	 * @return void
	 */
	public function setSpecimenTypes($specimenTypes){

		$specimenTypesAdded = array();
		$testTypeID = 0;	

		if(is_array($specimenTypes)){
			foreach ($specimenTypes as $key => $value) {
				$specimenTypesAdded[] = array(
					'test_type_id' => (int)$this->id,
					'specimen_type_id' => (int)$value
					);
				$testTypeID = (int)$this->id;
			}

		}
		// Delete existing test_type measure mappings
		DB::table('testtype_specimentypes')->where('test_type_id', '=', $testTypeID)->delete();

		// Add the new mapping
		DB::table('testtype_specimentypes')->insert($specimenTypesAdded);
	}

	/**
	 * Set test type measures
	 *
	 * @return void
	 */
	public function setMeasures($measures){

		$measuresAdded = array();
		$testTypeID = 0;	

		if(is_array($measures)){
			foreach ($measures as $key => $value) {
				$measuresAdded[] = array(
					'test_type_id' => (int)$this->id,
					'measure_id' => (int)$value
					);
				$testTypeID = (int)$this->id;
			}
		}
		// Delete existing test_type measure mappings
		DB::table('testtype_measures')->where('test_type_id', '=', $testTypeID)->delete();

		// Add the new mapping
		DB::table('testtype_measures')->insert($measuresAdded);
	}

	/**
	* Given the test name we return the test type ID
	*
	* @param $testname the name of the test
	*/
	public static function getTestTypeIdByTestName($testName)
	{
		try 
		{
			$testTypeId = TestType::where('name', 'like', $testName)->firstOrFail();
			return $testTypeId->id;
		} catch (ModelNotFoundException $e) 
		{
			Log::error("The test type ` $testName ` does not exist:  ". $e->getMessage());
			//TODO: send email?
			return null;
		}
	}
	/**
	 * Function to return prevalence counts by month and test type
	 */
	public function getPrevalenceCounts($month){
		return Test::select(DB::raw('ROUND( SUM( IF( test_results.result =  \'Positive\', 1, 0 ) ) *100 / COUNT( tests.specimen_id ) , 2 ) AS rate'))
					->join('test_types', 'tests.test_type_id', '=', 'test_types.id')
					->join('testtype_measures', 'test_types.id', '=', 'testtype_measures.test_type_id')
					->join('measures', 'measures.id', '=', 'testtype_measures.measure_id')
					->join('test_results', 'tests.id', '=', 'test_results.test_id')
					->join('measure_types', 'measure_types.id', '=', 'measures.measure_type_id')
					->where('measures.measure_range', 'LIKE', '%Positive/Negative%')
					->where('test_types.id', '=', $this->id)
					->whereRaw('MONTH(time_created) = '.$month->months)
					->whereRaw('YEAR(time_created) = '.$month->annum)
					->whereRaw('(tests.test_status_id = '.Test::COMPLETED.' OR tests.test_status_id = '.Test::VERIFIED.')')
					->groupBy('test_types.id')
					->get();
	}
}