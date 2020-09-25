<?php

class DailySusceptibilityCount extends Eloquent
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'daily_susceptibility_counts';

    public $timestamps = false;

    /**
     *
     */
    public function dailyTestResultCount()
    {
      return $this->belongsTo('DailyTestResultCount');
    }
    /**
     *
     */
    public function disease()
    {
      return $this->belongsTo('Disease');
    }
}
