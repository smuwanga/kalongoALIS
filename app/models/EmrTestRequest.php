<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class EmrTestRequest extends Eloquent
{
	/**
	 * Enabling soft deletes for emr_test_requests.
	 *
	 */
	use SoftDeletingTrait;
	protected $dates = ['deleted_at'];
    	
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'emr_test_request';

	protected $fillable = [];
	

}
