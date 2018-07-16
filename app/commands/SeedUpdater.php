<?php

use Illuminate\Console\Command;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;

class SeedUpdater extends Command {

    /**
     * The console command name.
     *
     * @var string
     */
    protected $name = 'update:seed';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description.';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function fire()
    {
        Eloquent::unguard();

// update report db if you want accurate counts for cbc from the past
        echo "This can mean to take really long, patience\n";
        echo "If all goes as anticipated\n";
        echo "Mubende will take at most 20 minutes to complete \n";
        echo "Jinja will take at most - minutes to complete\n";
        echo "Masaka will take at most - minutes to complete\n";
        echo "Gombe will take at most - minutes to complete\n";
        echo "Mityana will take at most - minutes to complete\n";
        echo "Butabika will take at most - minutes to complete\n";
        echo "Luweero will take at most - minutes to complete\n";
        echo "Maddu will take at most - minutes to complete\n";
        echo "Kayunga I dont know!\n";
        echo "Muknono should be over before you know it!\n";
        echo "NMRL is a diferent ball game !!\n";

        DB::statement("set foreign_key_checks=0;");
        DailyNumericRangeCount::truncate();
        DailyAlphanumericCount::truncate();
        DailyGramStainResultCount::truncate();
        DailyHIVCount::truncate();
        DailySusceptibilityCount::truncate();
        DailyOrganismCount::truncate();
        DailyRejectionReasonCount::truncate();
        DailySpecimenCount::truncate();
        DailySpecimenTypeCount::truncate();
        DailyTestCount::truncate();
        DailyTestTypeCount::truncate();
        DailyTurnAroundTime::truncate();
        DB::statement("set foreign_key_checks=1;");


        Artisan::call('report:day', ['date' => '2017-04-02']);
        Artisan::call('report:day', ['date' => '2017-04-01']);
        Artisan::call('report:day', ['date' => '2017-04-03']);
        Artisan::call('report:day', ['date' => '2017-04-04']);
        Artisan::call('report:day', ['date' => '2017-04-05']);
        Artisan::call('report:day', ['date' => '2017-04-06']);
        Artisan::call('report:day', ['date' => '2017-04-07']);
        Artisan::call('report:day', ['date' => '2017-04-08']);
        Artisan::call('report:day', ['date' => '2017-04-09']);
        Artisan::call('report:day', ['date' => '2017-04-10']);
        Artisan::call('report:day', ['date' => '2017-04-11']);
        Artisan::call('report:day', ['date' => '2017-04-12']);
        Artisan::call('report:day', ['date' => '2017-04-13']);
        Artisan::call('report:day', ['date' => '2017-04-14']);
        Artisan::call('report:day', ['date' => '2017-04-15']);
        Artisan::call('report:day', ['date' => '2017-04-16']);
        Artisan::call('report:day', ['date' => '2017-04-17']);
        Artisan::call('report:day', ['date' => '2017-04-18']);
        Artisan::call('report:day', ['date' => '2017-04-19']);
        Artisan::call('report:day', ['date' => '2017-04-20']);
        Artisan::call('report:day', ['date' => '2017-04-21']);
        Artisan::call('report:day', ['date' => '2017-04-22']);
        Artisan::call('report:day', ['date' => '2017-04-23']);
        Artisan::call('report:day', ['date' => '2017-04-24']);
        Artisan::call('report:day', ['date' => '2017-04-25']);
        Artisan::call('report:day', ['date' => '2017-04-26']);
        Artisan::call('report:day', ['date' => '2017-04-27']);
        Artisan::call('report:day', ['date' => '2017-04-28']);
        Artisan::call('report:day', ['date' => '2017-04-29']);
        Artisan::call('report:day', ['date' => '2017-04-30']);

        Artisan::call('report:day', ['date' => '2017-05-01']);
        Artisan::call('report:day', ['date' => '2017-05-02']);
        Artisan::call('report:day', ['date' => '2017-05-03']);
        Artisan::call('report:day', ['date' => '2017-05-04']);
        Artisan::call('report:day', ['date' => '2017-05-05']);
        Artisan::call('report:day', ['date' => '2017-05-06']);
        Artisan::call('report:day', ['date' => '2017-05-07']);
        Artisan::call('report:day', ['date' => '2017-05-08']);
        Artisan::call('report:day', ['date' => '2017-05-09']);
        Artisan::call('report:day', ['date' => '2017-05-10']);
        Artisan::call('report:day', ['date' => '2017-05-11']);
        Artisan::call('report:day', ['date' => '2017-05-12']);
        Artisan::call('report:day', ['date' => '2017-05-13']);
        Artisan::call('report:day', ['date' => '2017-05-14']);
        Artisan::call('report:day', ['date' => '2017-05-15']);
        Artisan::call('report:day', ['date' => '2017-05-16']);
        Artisan::call('report:day', ['date' => '2017-05-17']);
        Artisan::call('report:day', ['date' => '2017-05-18']);
        Artisan::call('report:day', ['date' => '2017-05-19']);
        Artisan::call('report:day', ['date' => '2017-05-20']);
        Artisan::call('report:day', ['date' => '2017-05-21']);
        Artisan::call('report:day', ['date' => '2017-05-22']);
        Artisan::call('report:day', ['date' => '2017-05-23']);
        Artisan::call('report:day', ['date' => '2017-05-24']);
        Artisan::call('report:day', ['date' => '2017-05-25']);
        Artisan::call('report:day', ['date' => '2017-05-26']);
        Artisan::call('report:day', ['date' => '2017-05-27']);
        Artisan::call('report:day', ['date' => '2017-05-28']);
        Artisan::call('report:day', ['date' => '2017-05-29']);
        Artisan::call('report:day', ['date' => '2017-05-30']);
        Artisan::call('report:day', ['date' => '2017-05-31']);

        Artisan::call('report:day', ['date' => '2017-06-01']);
        Artisan::call('report:day', ['date' => '2017-06-02']);
        Artisan::call('report:day', ['date' => '2017-06-03']);
        Artisan::call('report:day', ['date' => '2017-06-04']);
        Artisan::call('report:day', ['date' => '2017-06-05']);
        Artisan::call('report:day', ['date' => '2017-06-06']);
        Artisan::call('report:day', ['date' => '2017-06-07']);
        Artisan::call('report:day', ['date' => '2017-06-08']);
        Artisan::call('report:day', ['date' => '2017-06-09']);
        Artisan::call('report:day', ['date' => '2017-06-10']);
        Artisan::call('report:day', ['date' => '2017-06-11']);
        Artisan::call('report:day', ['date' => '2017-06-12']);
        Artisan::call('report:day', ['date' => '2017-06-13']);
        Artisan::call('report:day', ['date' => '2017-06-14']);
        Artisan::call('report:day', ['date' => '2017-06-15']);
        Artisan::call('report:day', ['date' => '2017-06-16']);
        Artisan::call('report:day', ['date' => '2017-06-17']);
        Artisan::call('report:day', ['date' => '2017-06-18']);
        Artisan::call('report:day', ['date' => '2017-06-19']);
        Artisan::call('report:day', ['date' => '2017-06-20']);
        Artisan::call('report:day', ['date' => '2017-06-21']);
        Artisan::call('report:day', ['date' => '2017-06-22']);
        Artisan::call('report:day', ['date' => '2017-06-23']);
        Artisan::call('report:day', ['date' => '2017-06-24']);
        Artisan::call('report:day', ['date' => '2017-06-25']);
        Artisan::call('report:day', ['date' => '2017-06-26']);
        Artisan::call('report:day', ['date' => '2017-06-27']);
        Artisan::call('report:day', ['date' => '2017-06-28']);
        Artisan::call('report:day', ['date' => '2017-06-29']);
        Artisan::call('report:day', ['date' => '2017-06-30']);

        Artisan::call('report:day', ['date' => '2017-07-01']);
        Artisan::call('report:day', ['date' => '2017-07-02']);
        Artisan::call('report:day', ['date' => '2017-07-03']);
        Artisan::call('report:day', ['date' => '2017-07-04']);
        Artisan::call('report:day', ['date' => '2017-07-05']);
        Artisan::call('report:day', ['date' => '2017-07-06']);
        Artisan::call('report:day', ['date' => '2017-07-07']);
        Artisan::call('report:day', ['date' => '2017-07-08']);
        Artisan::call('report:day', ['date' => '2017-07-09']);
        Artisan::call('report:day', ['date' => '2017-07-10']);
        Artisan::call('report:day', ['date' => '2017-07-11']);
        Artisan::call('report:day', ['date' => '2017-07-12']);
        Artisan::call('report:day', ['date' => '2017-07-13']);
        Artisan::call('report:day', ['date' => '2017-07-14']);
        Artisan::call('report:day', ['date' => '2017-07-15']);
        Artisan::call('report:day', ['date' => '2017-07-16']);
        Artisan::call('report:day', ['date' => '2017-07-17']);
        Artisan::call('report:day', ['date' => '2017-07-18']);
        Artisan::call('report:day', ['date' => '2017-07-19']);
        Artisan::call('report:day', ['date' => '2017-07-20']);
        Artisan::call('report:day', ['date' => '2017-07-21']);
        Artisan::call('report:day', ['date' => '2017-07-22']);
        Artisan::call('report:day', ['date' => '2017-07-23']);
        Artisan::call('report:day', ['date' => '2017-07-24']);
        Artisan::call('report:day', ['date' => '2017-07-25']);
        Artisan::call('report:day', ['date' => '2017-07-26']);
        Artisan::call('report:day', ['date' => '2017-07-27']);
        Artisan::call('report:day', ['date' => '2017-07-28']);
        Artisan::call('report:day', ['date' => '2017-07-29']);
        Artisan::call('report:day', ['date' => '2017-07-30']);
        Artisan::call('report:day', ['date' => '2017-07-31']);

        Artisan::call('report:day', ['date' => '2017-08-01']);
        Artisan::call('report:day', ['date' => '2017-08-02']);
        Artisan::call('report:day', ['date' => '2017-08-03']);
        Artisan::call('report:day', ['date' => '2017-08-04']);
        Artisan::call('report:day', ['date' => '2017-08-05']);
        Artisan::call('report:day', ['date' => '2017-08-06']);
        Artisan::call('report:day', ['date' => '2017-08-07']);
        Artisan::call('report:day', ['date' => '2017-08-08']);
        Artisan::call('report:day', ['date' => '2017-08-09']);
        Artisan::call('report:day', ['date' => '2017-08-10']);
        Artisan::call('report:day', ['date' => '2017-08-11']);
        Artisan::call('report:day', ['date' => '2017-08-12']);
        Artisan::call('report:day', ['date' => '2017-08-13']);
        Artisan::call('report:day', ['date' => '2017-08-14']);
        Artisan::call('report:day', ['date' => '2017-08-15']);
        Artisan::call('report:day', ['date' => '2017-08-16']);
        Artisan::call('report:day', ['date' => '2017-08-17']);
        Artisan::call('report:day', ['date' => '2017-08-18']);
        Artisan::call('report:day', ['date' => '2017-08-19']);
        Artisan::call('report:day', ['date' => '2017-08-20']);
        Artisan::call('report:day', ['date' => '2017-08-21']);
        Artisan::call('report:day', ['date' => '2017-08-22']);
        Artisan::call('report:day', ['date' => '2017-08-23']);
        Artisan::call('report:day', ['date' => '2017-08-24']);
        Artisan::call('report:day', ['date' => '2017-08-25']);
        Artisan::call('report:day', ['date' => '2017-08-26']);
        Artisan::call('report:day', ['date' => '2017-08-27']);
        Artisan::call('report:day', ['date' => '2017-08-28']);
        Artisan::call('report:day', ['date' => '2017-08-29']);
        Artisan::call('report:day', ['date' => '2017-08-30']);
        Artisan::call('report:day', ['date' => '2017-08-31']);

        Artisan::call('report:day', ['date' => '2017-09-01']);
        Artisan::call('report:day', ['date' => '2017-09-02']);
        Artisan::call('report:day', ['date' => '2017-09-03']);
        Artisan::call('report:day', ['date' => '2017-09-04']);
        Artisan::call('report:day', ['date' => '2017-09-05']);
        Artisan::call('report:day', ['date' => '2017-09-06']);
        Artisan::call('report:day', ['date' => '2017-09-07']);
        Artisan::call('report:day', ['date' => '2017-09-08']);
        Artisan::call('report:day', ['date' => '2017-09-09']);
        Artisan::call('report:day', ['date' => '2017-09-10']);
        Artisan::call('report:day', ['date' => '2017-09-11']);
        Artisan::call('report:day', ['date' => '2017-09-12']);
        Artisan::call('report:day', ['date' => '2017-09-13']);
        Artisan::call('report:day', ['date' => '2017-09-14']);
        Artisan::call('report:day', ['date' => '2017-09-15']);
        Artisan::call('report:day', ['date' => '2017-09-16']);
        Artisan::call('report:day', ['date' => '2017-09-17']);
        Artisan::call('report:day', ['date' => '2017-09-18']);
        Artisan::call('report:day', ['date' => '2017-09-19']);
        Artisan::call('report:day', ['date' => '2017-09-20']);
        Artisan::call('report:day', ['date' => '2017-09-21']);
        Artisan::call('report:day', ['date' => '2017-09-22']);
        Artisan::call('report:day', ['date' => '2017-09-23']);
        Artisan::call('report:day', ['date' => '2017-09-24']);
        Artisan::call('report:day', ['date' => '2017-09-25']);
        Artisan::call('report:day', ['date' => '2017-09-26']);
        Artisan::call('report:day', ['date' => '2017-09-27']);
        Artisan::call('report:day', ['date' => '2017-09-28']);
        Artisan::call('report:day', ['date' => '2017-09-29']);
        Artisan::call('report:day', ['date' => '2017-09-30']);

        Artisan::call('report:day', ['date' => '2017-10-01']);
        Artisan::call('report:day', ['date' => '2017-10-02']);
        Artisan::call('report:day', ['date' => '2017-10-03']);
        Artisan::call('report:day', ['date' => '2017-10-04']);
        Artisan::call('report:day', ['date' => '2017-10-05']);
        Artisan::call('report:day', ['date' => '2017-10-06']);
        Artisan::call('report:day', ['date' => '2017-10-07']);
        Artisan::call('report:day', ['date' => '2017-10-08']);
        Artisan::call('report:day', ['date' => '2017-10-09']);
        Artisan::call('report:day', ['date' => '2017-10-10']);
        Artisan::call('report:day', ['date' => '2017-10-11']);
        Artisan::call('report:day', ['date' => '2017-10-12']);
        Artisan::call('report:day', ['date' => '2017-10-13']);
        Artisan::call('report:day', ['date' => '2017-10-14']);
        Artisan::call('report:day', ['date' => '2017-10-15']);
        Artisan::call('report:day', ['date' => '2017-10-16']);
        Artisan::call('report:day', ['date' => '2017-10-17']);
        Artisan::call('report:day', ['date' => '2017-10-18']);
        Artisan::call('report:day', ['date' => '2017-10-19']);
        Artisan::call('report:day', ['date' => '2017-10-20']);
        Artisan::call('report:day', ['date' => '2017-10-21']);
        Artisan::call('report:day', ['date' => '2017-10-22']);
        Artisan::call('report:day', ['date' => '2017-10-23']);
        Artisan::call('report:day', ['date' => '2017-10-24']);
        Artisan::call('report:day', ['date' => '2017-10-25']);
        Artisan::call('report:day', ['date' => '2017-10-26']);
        Artisan::call('report:day', ['date' => '2017-10-27']);
        Artisan::call('report:day', ['date' => '2017-10-28']);
        Artisan::call('report:day', ['date' => '2017-10-29']);
        Artisan::call('report:day', ['date' => '2017-10-30']);
        Artisan::call('report:day', ['date' => '2017-10-31']);

        Artisan::call('report:day', ['date' => '2017-11-01']);
        Artisan::call('report:day', ['date' => '2017-11-02']);
        Artisan::call('report:day', ['date' => '2017-11-03']);
        Artisan::call('report:day', ['date' => '2017-11-04']);
        Artisan::call('report:day', ['date' => '2017-11-05']);
        Artisan::call('report:day', ['date' => '2017-11-06']);
        Artisan::call('report:day', ['date' => '2017-11-07']);
        Artisan::call('report:day', ['date' => '2017-11-08']);
        Artisan::call('report:day', ['date' => '2017-11-09']);
        Artisan::call('report:day', ['date' => '2017-11-10']);
        Artisan::call('report:day', ['date' => '2017-11-11']);
        Artisan::call('report:day', ['date' => '2017-11-12']);
        Artisan::call('report:day', ['date' => '2017-11-13']);
        Artisan::call('report:day', ['date' => '2017-11-14']);
        Artisan::call('report:day', ['date' => '2017-11-15']);
        Artisan::call('report:day', ['date' => '2017-11-16']);
        Artisan::call('report:day', ['date' => '2017-11-17']);
        Artisan::call('report:day', ['date' => '2017-11-18']);
        Artisan::call('report:day', ['date' => '2017-11-19']);
        Artisan::call('report:day', ['date' => '2017-11-20']);
        Artisan::call('report:day', ['date' => '2017-11-21']);
        Artisan::call('report:day', ['date' => '2017-11-22']);
        Artisan::call('report:day', ['date' => '2017-11-23']);
        Artisan::call('report:day', ['date' => '2017-11-24']);
        Artisan::call('report:day', ['date' => '2017-11-25']);
        Artisan::call('report:day', ['date' => '2017-11-26']);
        Artisan::call('report:day', ['date' => '2017-11-27']);
        Artisan::call('report:day', ['date' => '2017-11-28']);
        Artisan::call('report:day', ['date' => '2017-11-29']);
        Artisan::call('report:day', ['date' => '2017-11-30']);

        Artisan::call('report:day', ['date' => '2017-12-01']);
        Artisan::call('report:day', ['date' => '2017-12-02']);
        Artisan::call('report:day', ['date' => '2017-12-03']);
        Artisan::call('report:day', ['date' => '2017-12-04']);
        Artisan::call('report:day', ['date' => '2017-12-05']);
        Artisan::call('report:day', ['date' => '2017-12-06']);
        Artisan::call('report:day', ['date' => '2017-12-07']);
        Artisan::call('report:day', ['date' => '2017-12-08']);
        Artisan::call('report:day', ['date' => '2017-12-09']);
        Artisan::call('report:day', ['date' => '2017-12-10']);
        Artisan::call('report:day', ['date' => '2017-12-11']);
        Artisan::call('report:day', ['date' => '2017-12-12']);
        Artisan::call('report:day', ['date' => '2017-12-13']);
        Artisan::call('report:day', ['date' => '2017-12-14']);
        Artisan::call('report:day', ['date' => '2017-12-15']);
        Artisan::call('report:day', ['date' => '2017-12-16']);
        Artisan::call('report:day', ['date' => '2017-12-17']);
        Artisan::call('report:day', ['date' => '2017-12-18']);
        Artisan::call('report:day', ['date' => '2017-12-19']);
        Artisan::call('report:day', ['date' => '2017-12-20']);
        Artisan::call('report:day', ['date' => '2017-12-21']);
        Artisan::call('report:day', ['date' => '2017-12-22']);
        Artisan::call('report:day', ['date' => '2017-12-23']);
        Artisan::call('report:day', ['date' => '2017-12-24']);
        Artisan::call('report:day', ['date' => '2017-12-25']);
        Artisan::call('report:day', ['date' => '2017-12-26']);
        Artisan::call('report:day', ['date' => '2017-12-27']);
        Artisan::call('report:day', ['date' => '2017-12-28']);
        Artisan::call('report:day', ['date' => '2017-12-29']);
        Artisan::call('report:day', ['date' => '2017-12-30']);
        Artisan::call('report:day', ['date' => '2017-12-31']);

        Artisan::call('report:day', ['date' => '2018-01-01']);
        Artisan::call('report:day', ['date' => '2018-01-02']);
        Artisan::call('report:day', ['date' => '2018-01-03']);
        Artisan::call('report:day', ['date' => '2018-01-04']);
        Artisan::call('report:day', ['date' => '2018-01-05']);
        Artisan::call('report:day', ['date' => '2018-01-06']);
        Artisan::call('report:day', ['date' => '2018-01-07']);
        Artisan::call('report:day', ['date' => '2018-01-08']);
        Artisan::call('report:day', ['date' => '2018-01-09']);
        Artisan::call('report:day', ['date' => '2018-01-10']);
        Artisan::call('report:day', ['date' => '2018-01-11']);
        Artisan::call('report:day', ['date' => '2018-01-12']);
        Artisan::call('report:day', ['date' => '2018-01-13']);
        Artisan::call('report:day', ['date' => '2018-01-14']);
        Artisan::call('report:day', ['date' => '2018-01-15']);
        Artisan::call('report:day', ['date' => '2018-01-16']);
        Artisan::call('report:day', ['date' => '2018-01-17']);
        Artisan::call('report:day', ['date' => '2018-01-18']);
        Artisan::call('report:day', ['date' => '2018-01-19']);
        Artisan::call('report:day', ['date' => '2018-01-20']);
        Artisan::call('report:day', ['date' => '2018-01-21']);
        Artisan::call('report:day', ['date' => '2018-01-22']);
        Artisan::call('report:day', ['date' => '2018-01-23']);
        Artisan::call('report:day', ['date' => '2018-01-24']);
        Artisan::call('report:day', ['date' => '2018-01-25']);
        Artisan::call('report:day', ['date' => '2018-01-26']);
        Artisan::call('report:day', ['date' => '2018-01-27']);
        Artisan::call('report:day', ['date' => '2018-01-28']);
        Artisan::call('report:day', ['date' => '2018-01-29']);
        Artisan::call('report:day', ['date' => '2018-01-30']);
        Artisan::call('report:day', ['date' => '2018-01-31']);

    }

    /**
     * Get the console command arguments.
     *
     * @return array
     */
    protected function getArguments()
    {
        return [];
    }

    /**
     * Get the console command options.
     *
     * @return array
     */
    protected function getOptions()
    {
        return [];
    }

}
 