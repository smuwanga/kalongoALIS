<?php

use Illuminate\Console\Command;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;

class ChangePocSampleId extends Command {

	/**
	 * The console command name.
	 *
	 * @var string
	 */
	protected $name = 'deduplicate:run';

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
		//
		echo "....started....\n";
		//return ID, sampleID
		//update each
		$all_samples = POC::all();
		$counter=0;
		foreach ($all_samples as $key => $sample) {
			$counter++;
			
			$new_sample_id =$sample->sample_id.$counter;
			$sample->sample_id=$new_sample_id;
			$sample->save();
			
		}
		echo "....finished updating... ". $counter. " samples.\n";
	}

	/**
	 * Get the console command arguments.
	 *
	 * @return array
	 */
	protected function getArguments()
	{
		//return array(
		//	array('example', InputArgument::REQUIRED, 'An example argument.'),
		//);
		return [];
	}

	/**
	 * Get the console command options.
	 *
	 * @return array
	 */
	protected function getOptions()
	{
		//return array(
		//	array('example', null, InputOption::VALUE_OPTIONAL, 'An example option.', null),
		//);
		return [];
	}

}
