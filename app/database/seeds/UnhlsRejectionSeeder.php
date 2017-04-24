<?php

class UnhlsRejectionSeeder extends DatabaseSeeder
{
    public function run()
    {
        
        /* Rejection Reasons table */
        $rejection_reasons_array = array(
          array("reason" => "Equipment breakdown"),
          array("reason" => "Reagent stock out"),
          array("reason" => "Supplies stock out"),
          array("reason" => "Power outage"),
          array("reason" => "No testing expertise"),
          array("reason" => "No required equipment"),
          array("reason" => "Confirmatory testing "),
          array("reason" => "For Quality Assuarance (From lower to higher facility)"),
          array("reason" => "Clinicians not requesting"),
          array("reason" => "Other")
        );
        foreach ($rejection_reasons_array as $rejection_reason)
        {
            $rejection_reasons[] = UnhlsRejectionReason::create($rejection_reason);
        }
        $this->command->info('unhls_rejection_reasons seeded');
    }
        
}
