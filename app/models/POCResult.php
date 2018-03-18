<?php

class POCResult extends \Eloquent {
	protected $fillable = [];

	protected $table = 'poc_results';

	public function poc(){
		return $this->belongsTo('POC', 'patient_id');
	}

}