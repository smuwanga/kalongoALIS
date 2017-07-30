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
         
        VisitStatus::create(["name" => "test-request-pending"]);
        VisitStatus::create(["name" => "test-request-made"]);
        VisitStatus::create(["name" => "samples-collected"]);
        VisitStatus::create(["name" => "tests-completed"]);
        
        /* Permissions table */
        $permissions = array(
            array("name" => "manage_appointments", "display_name" => "Can manage appointments with Clinician"),
            array("name" => "make_labrequests", "display_name" => "Can make lab requests"),
        );

        $superadmin = Role::find(1);
        foreach ($permissions as $permission) {
            $superadmin->attachPermission(Permission::create($permission));
        }
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
