<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class BbincidenceCause extends Eloquent
{
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'unhls_bbcauses';

	public function bbincidence()
	{
		return $this->belongsToMany('Bbincidence', 'unhls_bbincidences_cause', 'cause_id', 'bbincidence_id');
	}
	

}