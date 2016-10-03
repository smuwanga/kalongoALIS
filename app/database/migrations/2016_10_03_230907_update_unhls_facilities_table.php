<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateUnhlsFacilitiesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('unhls_facilities', function(Blueprint $table)
		{
			$table->string('code')->after('id');
			$table->string('level')->after('district_id');
			$table->string('ownership')->after('level');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('unhls_facilities', function(Blueprint $table)
		{
			//
		});
	}

}
