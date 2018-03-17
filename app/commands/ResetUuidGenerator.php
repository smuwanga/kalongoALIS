<?php

use Illuminate\Console\Command;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ResetUuidGenerator extends Command {

    /**
     * The console command name.
     *
     * @var string
     */
    protected $name = 'reset:ulin';

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
/*        Schema::dropIfExists('lab_number_generator');
        Schema::create('lab_number_generator', function($table)
        {
            $table->increments('id');
        });
*/
UuidGenerator::truncate();
DB::statement("ALTER TABLE uuids AUTO_INCREMENT = 1;");

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
