<?php

class DailyNumericRangeCount extends Eloquent
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'daily_numeric_range_counts';

    public $timestamps = false;

    public function resultInterpretation()
    {
      return $this->belongsTo('ResultInterpretation');
    }

    public function dailyTestTypeCount()
    {
      return $this->belongsTo('DailyTestTypeCount');
    }
}
