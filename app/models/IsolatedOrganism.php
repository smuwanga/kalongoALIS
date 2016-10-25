<?php

class IsolatedOrganism extends Eloquent
{
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'isolated_organisms';

	public function culture()
	{
		return $this->belongsTo('Culture');
	}

	public function organism()
	{
		return $this->belongsTo('Organism');
	}


}
