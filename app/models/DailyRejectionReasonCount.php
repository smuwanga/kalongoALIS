<?php

class DailyRejectionReasonCount extends Eloquent
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'daily_rejection_reason_counts';

    public $timestamps = false;

    /**
     *
     */
    public function dailySpecimenCount()
    {
      return $this->belongsTo('DailySpecimenCount');
    }
}
