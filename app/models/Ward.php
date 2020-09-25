<?php

class Ward extends Eloquent
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'wards';

    public $timestamps = false;

    
	/**
	*
	*
	*/
	public function wardType()
	{
		return $this->belongsTo('WardType','ward_type_id');
	}

	public function getWardType()
	{
		return WardType::find($this->ward_type_id);
	}
}
