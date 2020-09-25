<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class BbincidenceNatureIntermediate extends Eloquent
{
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'unhls_bbincidences_nature';

	public function bbnature()
	{
		return $this->belongsTo('BbincidenceNature', 'nature_id', 'id');
	}

	public function bbincidence()
	{
		return $this->belongsTo('Bbincidence', 'bbincidence_id', 'id');
	}
}