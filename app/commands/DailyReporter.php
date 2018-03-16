<?php
use Illuminate\Console\Command;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;

class DailyReporter extends Command {

    /**
     * The console command name.
     *
     * @var string
     */
    protected $name = 'report:day';

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
        // Get the date argument.
        echo "|||||||||||||||||||||||||||||||||||||||||----------------DAILY REPORT----------------------------||||||||||||||||||||||||||||||||||||||||||\n";
        $reportDate = $this->argument('date');
        if ($reportDate == '') {
            $reportDate = (new DateTime('now'))->modify('-1 day')->format('Y-m-d');
            echo "reporting for yesterday ({$reportDate})\n";
        }else{
            $reportDate = (new DateTime($reportDate))->format('Y-m-d');
            echo "reporting for {$reportDate}\n";
        }

        $specimens = UnhlsSpecimen::with('analyticSpecimenRejections');
        $specimensAll = $specimens->where('time_accepted', 'like', '%' . $reportDate . '%');

        $specimensAccepted = $specimens->where('time_accepted', 'like', '%' . $reportDate . '%')
            ->whereIn('specimen_status_id', [UnhlsSpecimen::ACCEPTED, UnhlsSpecimen::REFERRED])->count();

        $specimensRejected = $specimens->where(function($q) use ($reportDate){
            $q->whereHas('analyticSpecimenRejections', function($q) use ($reportDate){
                $q->where('time_rejected', 'like', '%' . $reportDate . '%');
            });
        })->where('specimen_status_id', UnhlsSpecimen::REJECTED)->count();
        // todo: use the real time of referral
        $specimensReferredIn = $specimens->where('time_accepted', 'like', '%' . $reportDate . '%')
            ->where('specimen_status_id', UnhlsSpecimen::REFERRED_IN)->count();
        // todo: use the real time of referral
        $specimensReferredOut = $specimens->where('time_accepted', 'like', '%' . $reportDate . '%')
            ->where('specimen_status_id', UnhlsSpecimen::REFERRED)->count();

        echo "[{$specimens->count()}] specimens found\n";
        echo "-[{$specimensAccepted}] specimens accepted\n";
        echo "-[{$specimensRejected}] specimens rejected\n";
        echo "-[{$specimensReferredIn}] specimens referred in\n";
        echo "-[{$specimensReferredOut}] specimens referred out\n";

        if (strtotime($reportDate)>=strtotime((new DateTime('now'))->format('Y-m-d'))) {
            echo "{$reportDate} you are tring to generate a report for a date that is not of the past\n";
            exit();
        }

        /*specimen reports*/
        $dailySpecimenCount = new DailySpecimenCount;
        $dailySpecimenCount->date = $reportDate;
        $dailySpecimenCount->all = $specimens->count();
        $dailySpecimenCount->accepted = $specimensAccepted;
        $dailySpecimenCount->rejected = $specimensRejected;
        $dailySpecimenCount->referred_in = $specimensReferredIn;
        $dailySpecimenCount->referred_out = $specimensReferredOut;
        // exit on error
        try {
            $dailySpecimenCount->save();
        } catch (Exception $e) {
            echo "{$reportDate} already reported\n";
            exit();
        }

        echo "Specimen Types\n";
        $specimenTypes = SpecimenType::all();
        foreach ($specimenTypes as $specimenType) {
            $specimens = UnhlsSpecimen::where('specimen_type_id', '=', $specimenType->id);
            $specimens = $specimens->where('time_accepted', 'like', '%' . $reportDate . '%');
            echo "-[{$specimens->count()}] [{$specimenType->name}] found\n";
            if ($specimens->count()>0) {
                $dailySpecimenTypeCount = new DailySpecimenTypeCount;
                $dailySpecimenTypeCount->date = $reportDate;
                $dailySpecimenTypeCount->daily_specimen_count_id = $dailySpecimenCount->id;
                $dailySpecimenTypeCount->specimen_type_id = $specimenType->id;
                $dailySpecimenTypeCount->all = $specimens->count();
                $dailySpecimenTypeCount->accepted = $specimens->whereIn('specimen_status_id', [UnhlsSpecimen::ACCEPTED, UnhlsSpecimen::REFERRED])->count();
                $dailySpecimenTypeCount->rejected = $specimens->where('specimen_status_id', UnhlsSpecimen::REJECTED)->count();
                $dailySpecimenTypeCount->referred_in = $specimens->where('specimen_status_id', UnhlsSpecimen::REFERRED_IN)->count();
                $dailySpecimenTypeCount->referred_out = $specimens->where('specimen_status_id', UnhlsSpecimen::REFERRED)->count();
                $dailySpecimenTypeCount->save();
            }
        }

        echo "Specimen Rejections\n";
        $rejectionReasons = RejectionReason::all();
        foreach ($rejectionReasons as $rejectionReason) {

            $rejection_reason_id = $rejectionReason->id;
            $specimens = UnhlsSpecimen::with('analyticSpecimenRejections');
            $specimens = $specimens->where(function($q) use ($reportDate, $rejection_reason_id){
                $q->whereHas('analyticSpecimenRejections', function($q) use ($reportDate, $rejection_reason_id){
                    $q->where('time_rejected', 'like', '%' . $reportDate . '%')
                        ->where('rejection_reason_id',$rejection_reason_id);
                });
            });

            echo "-[{$specimens->count()}] rejected for [{$rejectionReason->reason}] \n";
            if ($specimens->count()>0) {
                $dailySpecimenRejectionCount = new DailyRejectionReasonCount;
                $dailySpecimenRejectionCount->date = $reportDate;
                $dailySpecimenRejectionCount->daily_specimen_count_id = $dailySpecimenCount->id;
                $dailySpecimenRejectionCount->reason_id = $rejectionReason->id;
                $dailySpecimenRejectionCount->count = $specimens->count();
                $dailySpecimenRejectionCount->save();
            }
        }

        /*test reports*/
        $tests = UnhlsTest::with(
            'testResults', 'visit',
            'visit.patient', 'testType',
            'testType.measures',
            'testType.measures.measureRanges',
            'specimen', 'testStatus',
            'testStatus.testPhase',
            'isolatedOrganisms',
            'isolatedOrganisms.drugSusceptibilities',
            'isolatedOrganisms.drugSusceptibilities.drug');
        // report only completed tests
        $testCompleted = UnhlsTest::COMPLETED;
        $testVerified = UnhlsTest::VERIFIED;
        $tests = $tests->where(function($q) use ($testCompleted, $testVerified){
            $q->whereIn('test_status_id', [$testCompleted, $testVerified]);
        });

        // report only tests from yesterday
        $tests = $tests->where(function($q) use ($reportDate){
            $q->where('time_completed', 'like', '%' . $reportDate . '%');
        });

        echo "Daily Test Count\n";
        $dailyTestCount = new DailyTestCount;
        $dailyTestCount->date = $reportDate;
        $dailyTestCount->all = $tests->count();
        $dailyTestCount->referred_in = $tests->where('test_status_id', UnhlsTest::REFERRED_IN)->count();
        $dailyTestCount->referred_out = $tests->where('test_status_id', UnhlsTest::REFERRED_OUT)->count();
        $dailyTestCount->save();

        $testTypes = TestType::all();

        $organisms = Organism::all();
        $antibiotics = Drug::all();
        $interpretations = DrugSusceptibilityMeasure::all();
        $ageGroups = [
            '0-140' => [
                'range' =>'all',
                'age_lower_limit' =>0,// use 5 =<
                'age_upper_limit' =>1000,
                'age_upper_limit_display' =>'120',
            ],
            '0-4' => [
                'range' =>'child',
                'age_lower_limit' =>0,
                'age_upper_limit' =>4.99,// use <5
                'age_upper_limit_display' =>4,// use <5
            ],
            '5-140' => [
                'range' =>'older',
                'age_lower_limit' =>5,// use 5 =<
                'age_upper_limit' =>1000,
                'age_upper_limit_display' =>'120',
            ],
        ];

        $genders = [0 => 0, 1 => 1, 2 => 2];// 0 is male, 1 is female, 2 is both

        $genderName = [0 => 'male', 1 => 'female', 2 => 'both male and female'];// 0 is male, 1 is female, 2 is both

        echo "Test Types\n";
        foreach ($testTypes as $testType) {

         /*test reports*/
            $tests = UnhlsTest::with(
                'testResults', 'visit',
                'visit.patient', 'testType',
                'testType.measures',
                'testType.measures.measureRanges',
                'specimen', 'testStatus',
                'testStatus.testPhase',
                'isolatedOrganisms',
                'isolatedOrganisms.drugSusceptibilities',
                'isolatedOrganisms.drugSusceptibilities.drug');
            // report only completed tests
            $tests = $tests->where(function($q) use ($testCompleted, $testVerified){
                $q->whereIn('test_status_id', [$testCompleted, $testVerified]);
            });
            // report only tests from yesterday
            $tests = $tests->where(function($q) use ($reportDate){
                $q->where('time_completed', 'like', '%' . $reportDate . '%');
            });

            $test_type_id = $testType->id;
            $tests = $tests->where(function($q) use ($test_type_id){
                $q->where('test_type_id', $test_type_id);
            });

            // Log
            $testCount = $tests->count();
            echo "[{$testCount}] [{$testType->name}]\n";

            // check that test type has tests
            if ($tests->count() == 0) {
                echo $testType->name." skipped\n";
                continue;
            }

            $totalReceptionToStart = 0;
            $totalStartToCompletion = 0;
            $totalReceptionToCompletion = 0;
            $totalStartToVerification = 0;
            foreach ($tests as $test) {
                echo " TAT avg ".$test->id."\n";
                $totalReceptionToStart = $totalReceptionToStart + ($test->specimen->time_accepted - $test->time_started);
                $totalStartToCompletion = $totalStartToCompletion + ($test->time_started - $test->time_completed);
                $totalReceptionToCompletion = $totalReceptionToCompletion + ($test->specimen->time_accepted - $test->time_completed);
                $totalStartToVerification = $totalStartToVerification + ($test->time_started - $test->time_verified);
            }

            foreach ($ageGroups as $ageGroup) {


                // if the test type has a system name mapped
                if ($testType->testNameMapping != '') {

                    // check if it is malaria
                    if ($testType->testNameMapping->system_name == 'malaria_microscopy' || $testType->testNameMapping->system_name == 'malaria_rdts') {

                        // skip if it's all ages
                        if ($ageGroup['range'] == 'all') {
                            continue;
                        }
                    // if not malaria run only for all all ages
                    }else{
                        if ($ageGroup['range'] != 'all') {
                            continue;
                        }
                    }
                // if the test type has no system name mapped
                }else{

                    // run only for all all ages
                    if ($ageGroup['range'] != 'all') {
                        continue;
                    }
                }

                $ageStart = $ageGroup['age_lower_limit'];
                $ageEnd = intval($ageGroup['age_upper_limit']*365.25);

                $dobEnd = new DateTime((new DateTime($reportDate))->format('Y-m-d'));
                $dobEnd = $dobEnd->sub(new DateInterval('P'.$ageStart.'Y'))->format('Y-m-d');

                $dobStart = new DateTime((new DateTime($reportDate))->format('Y-m-d'));
                $dobStart = $dobStart->sub(new DateInterval('P'.$ageEnd.'D'))->format('Y-m-d');

                foreach ($genders as $gender) {
                    /*Grouped Test Type Count*/

                    // note: skip groupings that are not both sexes and because its not required at the moment
                    if ($gender != UnhlsPatient::BOTH) {
                        continue;
                    }

                    $tests = UnhlsTest::with(
                        'visit',
                        'testType',
                        'testResults',
                        'visit.patient',
                        'testType.measures',
                        'testType.measures.measureRanges',
                        'specimen');

                    // report only completed tests from yesterday
                    $tests = $tests->where(function($q) use ($reportDate){
                        $q->where('time_completed', 'like', '%' . $reportDate . '%');
                    });

                    $tests = $tests->where(function($q) use ($test_type_id){
                        $q->where('test_type_id', $test_type_id);
                    });
                    $tests = $tests->where(function($q) use ($dobStart, $dobEnd, $gender){
                        $q->whereHas('visit', function($q) use ($dobStart, $dobEnd, $gender){
                            $q->whereHas('patient', function($q)  use ($dobStart, $dobEnd, $gender){
                                $q->where(function($q) use ($dobStart, $dobEnd, $gender){
                                    // 2 is for both
                                    if ($gender == 2) {
                                        $q->whereBetween('dob', [$dobStart, $dobEnd]);
                                    }else {
                                        $q->whereBetween('dob', [$dobStart, $dobEnd])
                                            ->where('gender', $gender);
                                    }
                                });
                            });
                        });
                    });

                    echo "-[{$tests->count()}] of [{$testType->name}] found for ages [{$ageStart}] to [{$ageGroup['age_upper_limit']}] gender [{$genderName[$gender]}]\n";
                    /*Test Type Count*/
                    if ($tests->count()>0) {
                        $dailyTestTypeCount = new DailyTestTypeCount;
                        $dailyTestTypeCount->date = $reportDate;
                        $dailyTestTypeCount->daily_test_count_id = $dailyTestCount->id;
                        $dailyTestTypeCount->test_type_id = $testType->id;
                        $dailyTestTypeCount->age_upper_limit = $ageGroup['age_upper_limit_display'];
                        $dailyTestTypeCount->age_lower_limit = $ageGroup['age_lower_limit'];
                        $dailyTestTypeCount->gender = $gender;
                        $dailyTestTypeCount->all = $tests->count();
                        $dailyTestTypeCount->referred_in = $tests->where('test_status_id', UnhlsTest::REFERRED_IN)->count();
                        $dailyTestTypeCount->referred_out = $tests->where('test_status_id', UnhlsTest::REFERRED_OUT)->count();
                        $dailyTestTypeCount->save();

                        if ($gender == UnhlsPatient::BOTH && $ageGroup['range'] == 'all' && $testType->tests->count()>0) {
                            $dailyTurnAroundTime = new DailyTurnAroundTime;
                            $dailyTurnAroundTime->date = $reportDate;
                            $dailyTurnAroundTime->daily_test_type_count_id = $dailyTestTypeCount->id;
                            $dailyTurnAroundTime->avg_reception_tostart = $totalReceptionToStart/$testType->tests->count();
                            $dailyTurnAroundTime->avg_start_tocompletion = $totalStartToCompletion/$testType->tests->count();
                            $dailyTurnAroundTime->avg_reception_tocompletion = $totalReceptionToCompletion/$testType->tests->count();
                            $dailyTurnAroundTime->avg_start_tovarification = $totalStartToVerification/$testType->tests->count();
                            $dailyTurnAroundTime->save();
                        }

                        /*Test Type Results Count*/
                        if ($testType->isCulture()) {
                            echo "Culture\n";
                            // report details only for all ages and both sexes
                            if ($ageGroup['range']!= 'all' || $gender != UnhlsPatient::BOTH) {
                                continue;
                            }

                            foreach ($organisms as $organism) {
                                echo $organism->name."\n";
                                $organism_id = $organism->id;

                                $tests = UnhlsTest::with(
                                    'visit',
                                    'visit.patient',
                                    'isolatedOrganisms');
                                // report only completed tests
                                $tests = $tests->where(function($q) use ($testCompleted, $testVerified){
                                    $q->whereIn('test_status_id', [$testCompleted, $testVerified]);
                                });
                                // report only tests from yesterday
                                $tests = $tests->where(function($q) use ($reportDate){
                                    $q->where('time_completed', 'like', '%' . $reportDate . '%');
                                });

                                $tests = $tests->where(function($q) use ($test_type_id){
                                    $q->where('test_type_id', $test_type_id);
                                });

                                $tests = $tests->where(function($q) use ($dobStart, $dobEnd, $gender){
                                    $q->whereHas('visit', function($q) use ($dobStart, $dobEnd, $gender){
                                        $q->whereHas('patient', function($q)  use ($dobStart, $dobEnd, $gender){
                                            $q->where(function($q) use ($dobStart, $dobEnd, $gender){
                                                // 2 is for both
                                                if ($gender == 2) {
                                                    $q->whereBetween('dob', [$dobStart, $dobEnd]);
                                                }else {
                                                    $q->whereBetween('dob', [$dobStart, $dobEnd])
                                                        ->where('gender', $gender);
                                                }
                                            });
                                        });
                                    });
                                });

                                $tests = $tests->where(function($q) use ($organism_id){
                                    $q->whereHas('isolatedOrganisms', function($q) use ($organism_id){
                                        $q->where('organism_id', $organism_id);
                                    });
                                });
                                // isolated_organism_id - (save only if greater than zero)
                                if ($tests->count()>0) {
                                    $dailyOrganismCount = new DailyOrganismCount;
                                    $dailyOrganismCount->date = $reportDate;
                                    $dailyOrganismCount->daily_test_type_count_id = $dailyTestTypeCount->id;
                                    $dailyOrganismCount->organism_id = $organism->id;
                                    if ($organism->name == 'No bacterial growth' || $organism->name == 'No significant growth') {
                                        $dailyOrganismCount->result_interpretation_id = ResultInterpretation::NEGATIVE;
                                    }else{
                                        $dailyOrganismCount->result_interpretation_id = ResultInterpretation::POSITIVE;
                                    }
                                    $dailyOrganismCount->count = $tests->count();
                                    $dailyOrganismCount->save();
                                    foreach ($antibiotics as $antibiotic) {
                                        echo $antibiotic->name."\n";
                                        $antibiotic_id = $antibiotic->id;
                                        foreach ($interpretations as $interpretation) {
                                            echo $interpretation->interpretation."\n";
                                            $interpretation_id = $interpretation->id;

                                            $tests = UnhlsTest::with(
                                                'testResults',
                                                'visit',
                                                'visit.patient',
                                                'specimen',
                                                'isolatedOrganisms',
                                                'isolatedOrganisms.drugSusceptibilities');
                                            // report only completed tests
                                            $tests = $tests->where(function($q){
                                                $q->whereIn('test_status_id', [UnhlsTest::COMPLETED, UnhlsTest::VERIFIED]);
                                            });
                                            // report only tests from yesterday
                                            $tests = $tests->where(function($q) use ($reportDate){
                                                $q->where('time_completed', 'like', '%' . $reportDate . '%');
                                            });

                                            $tests = $tests->where(function($q) use ($test_type_id){
                                                $q->where('test_type_id', $test_type_id);
                                            });

                                            $tests = $tests->where(function($q) use ($dobStart, $dobEnd, $gender){
                                                $q->whereHas('visit', function($q) use ($dobStart, $dobEnd, $gender){
                                                    $q->whereHas('patient', function($q)  use ($dobStart, $dobEnd, $gender){
                                                        $q->where(function($q) use ($dobStart, $dobEnd, $gender){
                                                            // 2 is for both
                                                            if ($gender == UnhlsPatient::BOTH) {
                                                                $q->whereBetween('dob', [$dobStart, $dobEnd]);
                                                            }else {
                                                                $q->whereBetween('dob', [$dobStart, $dobEnd])
                                                                    ->where('gender', $gender);
                                                            }
                                                        });
                                                    });
                                                });
                                            });

                                            $tests = $tests->where(function($q) use ($organism_id){
                                                $q->whereHas('isolatedOrganisms', function($q) use ($organism_id){
                                                    $q->where('organism_id', $organism_id);
                                                });
                                            });
                                            $tests = $tests->where(function($q) use ($antibiotic_id, $interpretation_id){
                                                $q->whereHas('isolatedOrganisms', function($q) use ($antibiotic_id, $interpretation_id){
                                                    $q->whereHas('drugSusceptibilities', function($q) use ($antibiotic_id, $interpretation_id){
                                                        $q->where('drug_id', $antibiotic_id)
                                                            ->where('drug_susceptibility_measure_id', $interpretation_id);
                                                    });
                                                });
                                            });
                                            $interpretationCount = $tests->count();
                                            if ($interpretationCount>0) {
                                                $dailySusceptibilityCount = new DailySusceptibilityCount;
                                                $dailySusceptibilityCount->date = $reportDate;
                                                $dailySusceptibilityCount->daily_organism_count_id = $dailyOrganismCount->id;
                                                $dailySusceptibilityCount->antibiotic_id = $antibiotic_id;
                                                $dailySusceptibilityCount->interpretation_id = $interpretation_id;
                                                $dailySusceptibilityCount->count = $tests->count();
                                                $dailySusceptibilityCount->save();
                                            }
                                        }
                                    }
                                }
                            }
                        }elseif ($testType->isGramStain()) {
                            echo "Gram Stain\n";
                            $gramStainRanges = GramStainRange::all();
                            foreach ($gramStainRanges as $range) {

                            echo "[{$range->name}]\n";
                                $gram_stain_range_id = $range->id;

                                $tests = UnhlsTest::with('testResults', 'visit',
                                    'visit.patient', 'gramStainResults');
                                // report only completed tests
                                $tests = $tests->where(function($q) use ($testCompleted, $testVerified){
                                    $q->whereIn('test_status_id', [$testCompleted, $testVerified]);
                                });
                                // report only tests from yesterday
                                $tests = $tests->where(function($q) use ($reportDate){
                                    $q->where('time_completed', 'like', '%' . $reportDate . '%');
                                });

                                $tests = $tests->where(function($q) use ($test_type_id){
                                    $q->where('test_type_id', $test_type_id);
                                });

                                $tests = $tests->where(function($q) use ($dobStart, $dobEnd, $gender){
                                    $q->whereHas('visit', function($q) use ($dobStart, $dobEnd, $gender){
                                        $q->whereHas('patient', function($q)  use ($dobStart, $dobEnd, $gender){
                                            $q->where(function($q) use ($dobStart, $dobEnd, $gender){
                                                // 2 is for both
                                                if ($gender == 2) {
                                                    $q->whereBetween('dob', [$dobStart, $dobEnd]);
                                                }else {
                                                    $q->whereBetween('dob', [$dobStart, $dobEnd])
                                                        ->where('gender', $gender);
                                                }
                                            });
                                        });
                                    });
                                });

                                $tests = $tests->where(function($q) use ($gram_stain_range_id){
                                    $q->whereHas('gramStainResults', function($q) use ($gram_stain_range_id){
                                        $q->where('gram_stain_range_id', $gram_stain_range_id);
                                    });
                                });
                                $testCount = $tests->count();

                                if ($testCount>0) {
                                    $dailyGramStainResultCount = new DailyGramStainResultCount;
                                    $dailyGramStainResultCount->date = $reportDate;
                                    $dailyGramStainResultCount->daily_test_type_count_id = $dailyTestTypeCount->id;
                                    $dailyGramStainResultCount->gram_stain_range_id = $range->id;
                                    $dailyGramStainResultCount->count = $testCount;
                                    $dailyGramStainResultCount->save();
                                }
                            }
                        }else {
                            if ($testType->isHIV()) {
                                echo "HIV\n";
                                $purposes = ['pmtct' => 'PMTCT', 'hct' => 'HCT', 'smc' => 'SMC', 'qc' => 'Quality Control', 'clinical_diagnosis' => 'Clinical Diagnosis'];
                                foreach ($purposes as $purpose) {

                                    foreach ($testType->measures as $measure) {
                                        $measure_id = $measure->id;
                                        if ($measure->isAlphanumeric()) {
                                            echo "--[{$measure->name}] - (Alphanumeric)\n";
                                            foreach ($measure->measureRanges as $measureRange) {

                                                $tests = UnhlsTest::with(
                                                    'testResults', 'visit',
                                                    'visit.patient', 'testType',
                                                    'testType.measures',
                                                    'testType.measures.measureRanges');
                                                // report only completed tests
                                                $tests = $tests->where(function($q) use ($testCompleted, $testVerified){
                                                    $q->whereIn('test_status_id', [$testCompleted, $testVerified]);
                                                });
                                                // report only tests from yesterday
                                                $tests = $tests->where(function($q) use ($reportDate){
                                                    $q->where('time_completed', 'like', '%' . $reportDate . '%');
                                                });

                                                // report per purpose
                                                $tests = $tests->where(function($q) use ($test_type_id, $purpose){
                                                    $q->where('test_type_id', $test_type_id)
                                                        ->where('purpose', $purpose);
                                                });

                                                $tests = $tests->where(function($q) use ($dobStart, $dobEnd, $gender){
                                                    $q->whereHas('visit', function($q) use ($dobStart, $dobEnd, $gender){
                                                        $q->whereHas('patient', function($q)  use ($dobStart, $dobEnd, $gender){
                                                            $q->where(function($q) use ($dobStart, $dobEnd, $gender){
                                                                // 2 is for both
                                                                if ($gender == 2) {
                                                                    $q->whereBetween('dob', [$dobStart, $dobEnd]);
                                                                }else {
                                                                    $q->whereBetween('dob', [$dobStart, $dobEnd])
                                                                        ->where('gender', $gender);
                                                                }
                                                            });
                                                        });
                                                    });
                                                });

                                                $alphanumericRange = $measureRange->alphanumeric;
                                                $tests = $tests->where(function($q) use ($measure_id, $alphanumericRange){
                                                    $q->whereHas('testResults', function($q) use ($measure_id, $alphanumericRange){
                                                        $q->where('measure_id', $measure_id)->where('result', $alphanumericRange);
                                                    });
                                                });
                                                $testCount = $tests->count();
                                                echo "---[{$testCount}] are [{$measureRange->alphanumeric}]\n";
                                                // if such results exist
                                                if ($testCount>0) {
                                                    $dailyHIVCount = new DailyHIVCount;
                                                    $dailyHIVCount->date = $reportDate;
                                                    $dailyHIVCount->daily_test_type_count_id = $dailyTestTypeCount->id;
                                                    $dailyHIVCount->purpose = $purpose;
                                                    $dailyHIVCount->measure_id = $measure_id;
                                                    $dailyHIVCount->measure_range_id = $measureRange->id;
                                                    $dailyHIVCount->count = $tests->count();
                                                    $dailyHIVCount->save();
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            foreach ($testType->measures as $measure) {
                                $measure_id = $measure->id;
                                if ($measure->isAlphanumeric()) {
                                    echo "--[{$measure->name}] - (Alphanumeric)\n";
                                    foreach ($measure->measureRanges as $measureRange) {

                                        $tests = UnhlsTest::with(
                                            'testResults', 'visit',
                                            'visit.patient', 'testType',
                                            'testType.measures',
                                            'testType.measures.measureRanges');
                                        // report only completed tests
                                        $tests = $tests->where(function($q) use ($testCompleted, $testVerified){
                                            $q->whereIn('test_status_id', [$testCompleted, $testVerified]);
                                        });
                                        // report only tests from yesterday
                                        $tests = $tests->where(function($q) use ($reportDate){
                                            $q->where('time_completed', 'like', '%' . $reportDate . '%');
                                        });

                                        $tests = $tests->where(function($q) use ($test_type_id){
                                            $q->where('test_type_id', $test_type_id);
                                        });

                                        $tests = $tests->where(function($q) use ($dobStart, $dobEnd, $gender){
                                            $q->whereHas('visit', function($q) use ($dobStart, $dobEnd, $gender){
                                                $q->whereHas('patient', function($q)  use ($dobStart, $dobEnd, $gender){
                                                    $q->where(function($q) use ($dobStart, $dobEnd, $gender){
                                                        // 2 is for both
                                                        if ($gender == UnhlsPatient::BOTH) {
                                                            $q->whereBetween('dob', [$dobStart, $dobEnd]);
                                                        }else {
                                                            $q->whereBetween('dob', [$dobStart, $dobEnd])
                                                                ->where('gender', $gender);
                                                        }
                                                    });
                                                });
                                            });
                                        });

                                        $alphanumericRange = $measureRange->alphanumeric;
                                        $tests = $tests->where(function($q) use ($measure_id, $alphanumericRange){
                                            $q->whereHas('testResults', function($q) use ($measure_id, $alphanumericRange){
                                                $q->where('measure_id', $measure_id)->where('result', $alphanumericRange);
                                            });
                                        });
                                        $testCount = $tests->count();
                                        echo "---[{$testCount}] are [{$measureRange->alphanumeric}]\n";
                                        // if such results exist
                                        if ($testCount>0) {
                                            $dailyAlphanumericCount = new DailyAlphanumericCount;
                                            $dailyAlphanumericCount->date = $reportDate;
                                            $dailyAlphanumericCount->daily_test_type_count_id = $dailyTestTypeCount->id;
                                            $dailyAlphanumericCount->measure_id = $measure_id;
                                            $dailyAlphanumericCount->measure_range_id = $measureRange->id;
                                            $dailyAlphanumericCount->count = $tests->count();
                                            $dailyAlphanumericCount->save();
                                        }
                                    }
                                }elseif ($measure->isNumeric()) {
                                    echo "--[{$measure->name}] - (Numeric)\n";

                                    $measureRangeCountsArray = [];
                                    $measureRangeCountsArray[$measure_id]['all'] = 0;
                                    $measureRangeCountsArray[$measure_id]['normal'] = 0;
                                    $measureRangeCountsArray[$measure_id]['low'] = 0;
                                    $measureRangeCountsArray[$measure_id]['high'] =  0;
                                    $measureRangeCountsArray[$measure_id]['hbg_less_8'] =  0;
                                    $measureRangeCountsArray[$measure_id]['hbg_equal_8'] =  0;

                                    $testResults = UnhlsTestResult::with(
                                        'test',
                                        'test.visit',
                                        'test.visit.patient',
                                        'test.testType',
                                        'test.testType.measures',
                                        'test.testType.measures.measureRanges'
                                    )->where(function($q) use ($dobStart, $dobEnd, $gender){
                                        $q->whereHas('test', function($q)  use ($dobStart, $dobEnd, $gender){
                                            $q->whereHas('visit', function($q) use ($dobStart, $dobEnd, $gender){
                                                $q->whereHas('patient', function($q)  use ($dobStart, $dobEnd, $gender){
                                                    $q->where(function($q) use ($dobStart, $dobEnd, $gender){
                                                        if ($gender == UnhlsPatient::BOTH) {
                                                            $q->whereBetween('dob', [$dobStart, $dobEnd]);
                                                        }else {
                                                            $q->whereBetween('dob', [$dobStart, $dobEnd])
                                                                ->where('gender', $gender);
                                                        }
                                                    });
                                                });
                                            });
                                        });
                                    })->where(function($q) use($measure_id, $reportDate){
                                        $q->where('time_entered', 'like', '%' . $reportDate . '%')
                                            ->where('measure_id', $measure_id)
                                            ->whereNotIn('result',['']);
                                    })->get();

                                    // counting results under low, normal, high... one by one
                                    foreach ($testResults as $testResult) {
                                        $patient_dob = $testResult->test->visit->patient->dob;
                                        $patient_gender = $testResult->test->visit->patient->gender;
                                        $birthDate = new DateTime($patient_dob);
                                        $now = new DateTime();
                                        $interval = $birthDate->diff($now);
                                        $seconds = ($interval->days * 24 * 3600) + ($interval->h * 3600) + ($interval->i * 60) + ($interval->s);
                                        $age = $seconds/(365*24*60*60);

                                        // Identifying reference range
                                        $rangeValidity = MeasureRange::where('measure_id', '=', $measure_id)
                                            ->where('age_min', '<=', $age)->where('age_max', '>=', $age)
                                            ->where('gender', '=', $patient_gender);
                                        $measureRange = new stdClass();

                                        if ($rangeValidity->count()==0) {
                                            $measureRange = MeasureRange::where('measure_id', '=', $measure_id)
                                                ->where('age_min', '<=', $age)->where('age_max', '>=', $age)
                                                ->where('gender', '=', UnhlsPatient::BOTH)->first();
                                            if (is_null($measureRange)) {
                                                echo "--age [{$age}] is outside the reference ranges\n";
                                                continue;
                                            }
                                        }else{
                                            $measureRange = $rangeValidity->first();
                                        }

                                        // determine the high, the low and the normal of the results - and count them one by one
                                        /*
                                        if ($testResult->result >= $measureRange->range_lower && $testResult->result <= $measureRange->range_upper) {
                                            $measureRangeCountsArray[$measure_id]['normal']++;

                                        }elseif ($testResult->result > $measureRange->range_upper) {
                                            $measureRangeCountsArray[$measure_id]['high']++;

                                        }elseif ($testResult->result < $measureRange->range_lower) {
                                            $measureRangeCountsArray[$measure_id]['low']++;
                                        }
                                        */

                                        $measureRangeCountsArray[$measure_id]['all']++;

                                        // put condition up tomake sure the mapping guy is funtional before doing funny things
                                        if ($measure->measureNameMapping != '' &&
                                            $measure->measureNameMapping->system_name == 'hgb' &&
                                            $gender == 2 &&
                                            $ageGroup['range'] == 'all') {
                                            // hbg_less_8
                                            if($testResult->result<8){
                                                $measureRangeCountsArray[$measure_id]['hbg_less_8']++;

                                            // hbg_equal_8
                                            }elseif($testResult->result>=8){
                                                $measureRangeCountsArray[$measure_id]['hbg_equal_8']++;

                                            }
                                        }
                                    }

                                    if ($measureRangeCountsArray[$measure_id]['all']>0) {
                                        $dailyNumericRangeCount = new DailyNumericRangeCount;
                                        $dailyNumericRangeCount->date = $reportDate;
                                        $dailyNumericRangeCount->daily_test_type_count_id = $dailyTestTypeCount->id;
                                        $dailyNumericRangeCount->measure_id = $measure->id;
                                        $dailyNumericRangeCount->result = 'all';
                                        $dailyNumericRangeCount->count = $measureRangeCountsArray[$measure_id]['all'];
                                        $dailyNumericRangeCount->save();
                                    }

                                    /*
                                    if ($measureRangeCountsArray[$measure_id]['high']>0) {
                                        echo "---[{$measure->name}] - [{$measureRangeCountsArray[$measure_id]['high']}] are [High] for ages [{$ageGroup['age_lower_limit']}] to [{$ageGroup['age_upper_limit']}] gender [{$genderName[$gender]}]\n";
                                        // not required and taking too much db space
                                        $dailyNumericRangeCount = new DailyNumericRangeCount;
                                        $dailyNumericRangeCount->date = $reportDate;
                                        $dailyNumericRangeCount->daily_test_type_count_id = $dailyTestTypeCount->id;
                                        $dailyNumericRangeCount->measure_id = $measure->id;
                                        $dailyNumericRangeCount->result = 'high';
                                        $dailyNumericRangeCount->count = $measureRangeCountsArray[$measure_id]['high'];
                                        $dailyNumericRangeCount->save();
                                    }
                                    */

                                    /*
                                    if ($measureRangeCountsArray[$measure_id]['normal']>0) {
                                        // not required and taking too much db space
                                        echo "---[{$measure->name}] - [{$measureRangeCountsArray[$measure_id]['normal']}] are [Normal] for ages [{$ageGroup['age_lower_limit']}] to [{$ageGroup['age_upper_limit']}] gender [{$genderName[$gender]}]\n";
                                        $dailyNumericRangeCount = new DailyNumericRangeCount;
                                        $dailyNumericRangeCount->date = $reportDate;
                                        $dailyNumericRangeCount->daily_test_type_count_id = $dailyTestTypeCount->id;
                                        $dailyNumericRangeCount->measure_id = $measure->id;
                                        $dailyNumericRangeCount->result = 'normal';
                                        $dailyNumericRangeCount->count = $measureRangeCountsArray[$measure_id]['normal'];
                                        $dailyNumericRangeCount->save();
                                    }
                                    */


                                    /*
                                    // not required and taking too much db space
                                    if ($measureRangeCountsArray[$measure_id]['low']>0) {
                                        echo "---[{$measure->name}] - [{$measureRangeCountsArray[$measure_id]['low']}] are [Low] for ages [{$ageGroup['age_lower_limit']}] to [{$ageGroup['age_upper_limit']}] gender [{$genderName[$gender]}]\n";
                                        $dailyNumericRangeCount = new DailyNumericRangeCount;
                                        $dailyNumericRangeCount->date = $reportDate;
                                        $dailyNumericRangeCount->daily_test_type_count_id = $dailyTestTypeCount->id;
                                        $dailyNumericRangeCount->measure_id = $measure->id;
                                        $dailyNumericRangeCount->result = 'low';
                                        $dailyNumericRangeCount->count = $measureRangeCountsArray[$measure_id]['low'];
                                        $dailyNumericRangeCount->save();
                                    }
                                    */

                                    if ($measureRangeCountsArray[$measure_id]['hbg_less_8']>0) {
                                        echo "---[{$measure->name}] - [{$measureRangeCountsArray[$measure_id]['hbg_less_8']}] are [hbg_less_8] for ages [{$ageGroup['age_lower_limit']}] to [{$ageGroup['age_upper_limit']}] gender [{$genderName[$gender]}]\n";
                                        $dailyNumericRangeCount = new DailyNumericRangeCount;
                                        $dailyNumericRangeCount->date = $reportDate;
                                        $dailyNumericRangeCount->daily_test_type_count_id = $dailyTestTypeCount->id;
                                        $dailyNumericRangeCount->measure_id = $measure->id;
                                        $dailyNumericRangeCount->result = 'hbg_less_8';
                                        $dailyNumericRangeCount->count = $measureRangeCountsArray[$measure_id]['hbg_less_8'];
                                        $dailyNumericRangeCount->save();
                                    }

                                    if ($measureRangeCountsArray[$measure_id]['hbg_equal_8']>0) {
                                        echo "---[{$measure->name}] - [{$measureRangeCountsArray[$measure_id]['hbg_equal_8']}] are [hbg_equal_8] for ages [{$ageGroup['age_lower_limit']}] to [{$ageGroup['age_upper_limit']}] gender [{$genderName[$gender]}]\n";
                                        $dailyNumericRangeCount = new DailyNumericRangeCount;
                                        $dailyNumericRangeCount->date = $reportDate;
                                        $dailyNumericRangeCount->daily_test_type_count_id = $dailyTestTypeCount->id;
                                        $dailyNumericRangeCount->measure_id = $measure->id;
                                        $dailyNumericRangeCount->result = 'hbg_equal_8';
                                        $dailyNumericRangeCount->count = $measureRangeCountsArray[$measure_id]['hbg_equal_8'];
                                        $dailyNumericRangeCount->save();
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    /**
     * Get the console command arguments.
     *
     * @return array
     */
    protected function getArguments()
    {
        return [
            ['date', InputArgument::OPTIONAL, 'Date for which to report(Default is date yesterday)'],
        ];
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
