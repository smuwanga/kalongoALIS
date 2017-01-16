<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class BbincidenceNature extends Eloquent
{
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'unhls_bbnatures';


	public function bbincidence()
	{
		return $this->belongsToMany('Bbincidence', 'unhls_bbincidences_nature', 'nature_id', 'bbincidence_id');
	}
	

}