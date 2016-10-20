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
		DB::statement('SET FOREIGN_KEY_CHECKS=0;');
		
		Schema::table('unhls_facilities', function($table)
		{		
			$table->integer('facility_id')->unsigned();
			$table->foreign('facility_id')->references('id')->on('unhls_facilities');		
		});

		DB::statement('SET FOREIGN_KEY_CHECKS=1;');			
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		//
		Schema::table('unhls_facilities', function(Blueprint $table)
		{	
			$table->dropForeign('users_facility_id_foreign');							
			$table->dropColumn('facility_id');			
		});		
	}

}
