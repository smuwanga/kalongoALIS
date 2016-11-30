<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateUnhlsFacilityTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		DB::statement('SET FOREIGN_KEY_CHECKS=0;');
		
		Schema::table('unhls_facilities', function($table)
		{
		    $table->string('code');
		   	$table->integer('level_id')->unsigned();
		    $table->foreign('level_id')->references('id')->on('unhls_facility_level');	
		    $table->integer('ownership_id')->unsigned();
		    $table->foreign('ownership_id')->references('id')->on('unhls_facility_ownership');	
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
		Schema::table('unhls_facilities', function(Blueprint $table)
		{
			$table->dropColumn('code');
			$table->dropForeign('unhls_facilities_level_id_foreign');			
			$table->dropColumn('level_id');
			$table->dropForeign('unhls_facilities_ownership_id_foreign');							
			$table->dropColumn('ownership_id');			

		});
	}

}
