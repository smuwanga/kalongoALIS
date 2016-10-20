<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateUsersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		//
		$table->integer('facility_id')->unsigned();
		$table->foreign('facility_id')->references('id')->on('unhls_facilities');			
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		//
		$table->dropForeign('users_facility_id_foreign');							
		$table->dropColumn('facility_id');				
	}

}
