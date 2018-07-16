<?php

class DailyAlphanumericCount extends Eloquent
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'daily_alphanumeric_counts';

    public $timestamps = false;

    public function dailyTestTypeCount()
    {
      return $this->belongsTo('DailyTestTypeCount');
    }

    public function resultInterpretation()
    {
      return $this->belongsTo('ResultInterpretation');
    }
}
