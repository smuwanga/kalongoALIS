<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUnhlsFacilitiesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{

		Schema::create('unhls_facilities', function($table)
		{
			$table->increments('id');
			$table->string('code');
			$table->string('name');
			$table->integer('district_id')->unsigned();
			$table->foreign('district_id')->references('id')->on('unhls_districts');
			$table->integer('level_id')->unsigned();
			$table->foreign('level_id')->references('id')->on('unhls_facility_level');
			$table->integer('ownership_id')->unsigned();
			$table->foreign('ownership_id')->references('id')->on('unhls_facility_ownership');
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
		Schema::drop('unhls_facilities');
	}

}
