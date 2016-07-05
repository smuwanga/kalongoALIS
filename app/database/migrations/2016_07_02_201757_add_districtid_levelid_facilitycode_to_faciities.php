<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddDistrictidLevelidFacilitycodeToFaciities extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		//Add columns district_id, level_id, facility_code, zone to the Facilities table
		Schema::table(Facilities, function($table){
			$table->integer('district_id');
			$table->integer('level_id');
			$table->integer('facility_code');
			$table->integer('zone');

		})
		//Districts Table
		Schema::create(Districts, function(Blueprint $table){
			$table->increment('id')->unsigned();
			$table->string('name');
			$table->string('region');
			$table->integer('zone');

		});
		//Facility levels Table
		Schema::create(Levels, function(Blueprint, $table){
			$table->increment('id')->unsigned();
			$table->string('name');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		//Districts table
		Schema::dropIfExists('Districts');
		//Levels table
		Schema::dropIfExists('Levels');
	}

}

/* TO DO  add doctrine/dbal dependency to your composer.json file. The Doctrine DBAL library is used to determine the current 
state of the column and create the SQL queries needed to make the specified adjustments to the column.*/
