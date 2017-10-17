<?php

class TestNameMapping extends Eloquent
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'test_name_mappings';

    public $timestamps = false;

    public function testType()
    {
      return $this->belongsTo('TestType');
    }

    public function measureNameMappings()
    {
      return $this->hasMany('MeasureNameMapping');
    }
}
