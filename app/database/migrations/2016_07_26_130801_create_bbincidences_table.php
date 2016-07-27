<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBbincidencesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('unhls_bbincidences', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('facility_id')->unsigned();
			$table->string('serial_no');
			$table->date('occurrence_date');
			$table->time('occurrence_time');
			$table->string('personnel_id');
			$table->string('personnel_surname');
			$table->string('personnel_othername');
			$table->string('personnel_gender');
			$table->date('personnel_dob');
			$table->string('personnel_age');
			$table->string('personnel_cadre');
			$table->string('personnel_telephone');
			$table->string('personnel_email');
			$table->string('nok_name');
			$table->string('nok_telephone');
			$table->string('lab_section');
			$table->string('occurrence');
			$table->string('ulin');
			$table->string('equip_name');
			$table->string('equip_code');
			$table->string('task');
			$table->text('description');
			$table->string('officer_fname');
			$table->string('officer_lname');
			$table->string('officer_cadre');
			$table->string('officer_telephone');
			$table->string('extent');
			$table->text('firstaid');
			$table->string('firstaid_date');
			$table->string('mo_fname');
			$table->string('mo_lname');
			$table->string('mo_designation');
			$table->string('mo_telephone');
			$table->text('cause');
			$table->text('corrective_action');
			$table->string('bo_fname');
			$table->string('bo_lname');
			$table->string('bo_designation');
			$table->string('bo_telephone');
			$table->text('findings');
			$table->text('iprovement_plan');
			$table->string('brm_fname');
			$table->string('brm_lname');
			$table->string('brm_designation');
			$table->string('brm_telephone');
			$table->string('createdby');
			$table->string('updatedby');
			$table->foreign('facility_id')->references('id')->on('unhls_facilities');
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
		Schema::table('unhls_bbincidences', function(Blueprint $table)
		{
			Schema::drop('unhls_bbincidences');
		});
	}

}
