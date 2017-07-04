<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateMicrobiologyFunctionalities extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('culture_observations', function(Blueprint $table)
		{
            $table->dropForeign('culture_observations_culture_duration_id_foreign');
			$table->dropColumn('culture_duration_id');
		});

		Schema::table('drug_susceptibility', function(Blueprint $table)
		{
			$table->dropColumn('zone');
		});

		Schema::table('drug_susceptibility', function(Blueprint $table)
		{
            $table->integer('zone_diameter')->unsigned()->nullable()->after('drug_susceptibility_measure_id');
		});

        Schema::create('gram_stain_ranges', function($table)
        {
            $table->increments('id');
            $table->string('name');
        });

        Schema::create('gram_stain_results', function($table)
        {
            $table->increments('id');
            $table->integer('user_id')->unsigned();
            $table->integer('test_id')->unsigned();
            $table->integer('gram_stain_range_id')->unsigned();

            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('test_id')->references('id')->on('unhls_tests');
            $table->foreign('gram_stain_range_id')->references('id')->on('gram_stain_ranges');
        });

        Schema::create('gram_break_points', function($table)
        {
            $table->increments('id');
            $table->integer('drug_id')->unsigned();
            $table->integer('gram_stain_range_id')->unsigned();
            $table->decimal('resistant_max', 4, 1)->nullable();
            $table->decimal('intermediate_min', 4, 1)->nullable();
            $table->decimal('intermediate_max', 4, 1)->nullable();
            $table->decimal('sensitive_min', 4, 1)->nullable();

            $table->foreign('drug_id')->references('id')->on('drugs');
            $table->foreign('gram_stain_range_id')->references('id')->on('gram_stain_ranges');
        });

        /* gram drug susceptibility table */
        Schema::create('gram_drug_susceptibility', function(Blueprint $table)
        {
            $table->increments('id');
            $table->integer('user_id')->unsigned();
            $table->integer('drug_id')->unsigned();
            $table->integer('gram_stain_result_id')->unsigned();
            $table->integer('drug_susceptibility_measure_id')->unsigned();
            $table->integer('zone_diameter')->unsigned()->nullable();
            $table->softDeletes();
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('drug_id')->references('id')->on('drugs');
            $table->foreign('gram_stain_result_id')->references('id')->on('gram_stain_results');
            $table->foreign('drug_susceptibility_measure_id')->references('id')->on('drug_susceptibility_measures');
        });

        Schema::create('zone_diameters', function($table)
        {
            $table->increments('id');
            $table->integer('drug_id')->unsigned();
            $table->integer('organism_id')->unsigned();
            $table->decimal('resistant_max', 4, 1)->nullable();
            $table->decimal('intermediate_min', 4, 1)->nullable();
            $table->decimal('intermediate_max', 4, 1)->nullable();
            $table->decimal('sensitive_min', 4, 1)->nullable();

            $table->foreign('drug_id')->references('id')->on('drugs');
            $table->foreign('organism_id')->references('id')->on('organisms');
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
