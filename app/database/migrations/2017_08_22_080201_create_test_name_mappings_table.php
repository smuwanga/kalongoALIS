<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTestNameMappingsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('test_name_mappings', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('test_type_id')->unsigned()->nullable();
			$table->string('standard_name');
			$table->string('system_name')->unique();
		});

		Schema::create('measure_name_mappings', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('test_name_mapping_id')->unsigned();
			$table->integer('measure_id')->unsigned()->nullable();
			$table->string('standard_name');
			$table->string('system_name')->unique();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('measure_name_mappings');
		Schema::drop('test_name_mappings');
	}

}
