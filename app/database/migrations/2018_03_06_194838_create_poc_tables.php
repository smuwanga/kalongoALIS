<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePocTables extends Migration {

	/**
	* Run the migrations.
	*
	* @return void
	*/
	public function up()
	{
		Schema::create('poc_tables', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('facility_id');
			$table->integer('district_id');
			$table->string('gender');
			$table->float('age');
			$table->string('exp_no');
			$table->string('provisional_diagnosis');
			$table->string('caretaker_number');
			$table->string('entry_point');
			$table->string('mother_name');
			$table->string('infant_name');
			$table->string('breastfeeding_status');
			$table->string('mother_hiv_status');
			$table->date('collection_date');
			$table->string('pcr_level');
			$table->string('created_by');
			$table->string('pmtct_antenatal');
			$table->string('pmtct_delivery');
			$table->string('pmtct_postnatal');
			$table->date('admission_date');
			$table->string('sample_id');
			// $table->string('sample_received_by');
			// $table->date('sample_received_date');
			// $table->string('tested_by');
			// $table->date('test_date');
			// $table->string('device_used');
			$table->string('infant_pmtctarv');
			$table->string('mother_pmtctarv');
			$table->string('provisional_diagnosis');
			// $table->string('result');
			// $table->string('error_code');
			// $table->string('results_reviewed_by');
			// $table->date('date_reviewed');
			// $table->date('results_dispatched_by');
			$table->timestamps();
		});
	}


	/**
	* Reverse the migrations.
	*
	* @return void
	*/
	public function down()
	{
		Schema::drop('poc_tables');
		Schema::drop('breastfeeding_status');
		Schema::drop('facility_id');
		Schema::drop('district_id');
		Schema::drop('gender');
		Schema::drop('age');
		Schema::drop('age');
		Schema::drop('exp_no');
		Schema::drop('caretaker_number');
		Schema::drop('admimission_date');
		Schema::drop('entry_point');
		Schema::drop('mother_name');
		Schema::drop('infant_name');
		Schema::drop('mother_hiv_status');
		Schema::drop('collection_date');
		Schema::drop('pcr_level');
		Schema::drop('pmtct_antenatal');
		Schema::drop('pmtct_delivery');
		Schema::drop('pmtct_postnatal');
		Schema::drop('sample_id');
		Schema::drop('sample_received_by');
		Schema::drop('sample_received_date');
		Schema::drop('tested_by');
		Schema::drop('test_date');
		Schema::drop('device_used');
		Schema::drop('result');
		Schema::drop('error_code');
		Schema::drop('results_reviewed_by');
		Schema::drop('date_reviewed');
		Schema::drop('infant_pmtctarv');
		Schema::drop('results_dispatched_by');
	}

}
