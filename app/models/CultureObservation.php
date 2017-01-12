<?php

class CultureObservation extends Eloquent
{
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'culture_observations';

	public function culture()
	{
		return $this->belongsTo('Culture');
	}

	public function cultureDuration()
	{
		return $this->belongsTo('CultureDuration');
	}

}
