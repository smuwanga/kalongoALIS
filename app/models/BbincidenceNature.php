<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class BbincidenceNature extends Eloquent
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
	protected $table = 'unhls_bbnatures';


	public function bbincidence()
	{
		return $this->belongsToMany('Bbincidence', 'unhls_bbincidences_nature', 'nature_id', 'bbincidence_id');
	}
	

}