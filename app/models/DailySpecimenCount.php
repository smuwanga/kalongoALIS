<?php

class DailySpecimenCount extends Eloquent
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'daily_specimen_counts';

    public $timestamps = false;

    /**
     *
     */
    public function specimenType()
    {
      return $this->belongsTo('SpecimenType');
    }
}
