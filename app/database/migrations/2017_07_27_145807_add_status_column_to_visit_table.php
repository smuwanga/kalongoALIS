<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddStatusColumnToVisitTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('visit_statuses', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('name',45);
		});

		Schema::table('unhls_visits', function (Blueprint $table) {
			$table->integer('visit_status_id')->nullable();
			$table->foreign('visit_status_id')->references('id')->on('visit_statuses');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		//
	}

}
