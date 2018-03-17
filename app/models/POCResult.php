<?php

class POCResult extends \Eloquent {
	protected $fillable = [];

	protected $table = 'poc_results';

	protected $result = "erer";

	public function result(){
		return $this->attributes["result"];
	}


	public function poc(){
		return $this->hasOne('POC', 'patient_id');
	}

}