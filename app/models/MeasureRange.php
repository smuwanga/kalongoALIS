<?php

class MeasureRange extends Eloquent
{
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'measure_range';

	public $timestamps = false;

	/**
	 * Measure relationship
	 */
	// public function measure()
	// {
	//   return $this->belongsTo('Measure');
	// }
}