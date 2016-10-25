<?php

class MicrobiologyTestType extends Eloquent
{
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'microbiology_test_types';
	public $timestamps = false;

	public function testType()
	{
		return $this->belongsTo('TestType');
	}
}
