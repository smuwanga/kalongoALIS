<?php

class DailyGramStainResultCount extends Eloquent
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'daily_gram_stain_result_counts';

    public $timestamps = false;

    /**
     *
     */
    public function dailyMeasureCount()
    {
      return $this->belongsTo('DailyMeasureCount');
    }
    /**
     *
     */
    public function measureRange()
    {
      return $this->belongsTo('MeasureRange');
    }
    /**
     *
     */
    public function interpretation()
    {
      // return $this->belongsTo('not clear');
    }
}
