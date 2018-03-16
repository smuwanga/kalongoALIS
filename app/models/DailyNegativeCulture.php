<?php

class DailyNegativeCulture extends Eloquent
{
	protected $table = 'daily_negative_cultures';
	public $timestamps = false;

    public function organism()
    {
      return $this->belongsTo('Organism');
    }
}
