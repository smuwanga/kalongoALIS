<?php

class DailyTurnAroundTime extends Eloquent
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'daily_turn_around_time';

    public $timestamps = false;

    /**
     *
     */
    public function dailyTestCount()
    {
      return $this->belongsTo('DailyTestCount');
    }
}
