<?php

class MeasureNameMapping extends Eloquent
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'measure_name_mappings';

    public $timestamps = false;

    public function testNameMapping()
    {
      return $this->belongsTo('TestNameMapping');
    }

    public function measure()
    {
      return $this->belongsTo('Measure');
    }
}
