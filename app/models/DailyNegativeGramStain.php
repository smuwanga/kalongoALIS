<?php

class DailyNegativeGramStain extends Eloquent
{
	protected $table = 'daily_negative_gram_stains';

	public $timestamps = false;

    public function gramStainRange()
    {
      return $this->belongsTo('GramStainRange');
    }
}
