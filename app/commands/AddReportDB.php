<?php
use Illuminate\Console\Command;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;
class AddReportDB extends Command {
    /**
     * The console command name.
     *
     * @var string
     */
    protected $name = 'update:reportdb';
    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Addition of scheduled daily report db population.';
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
        // testing seeding
        $testNameMappings = [
            ['standard_name' => 'CBC',
                'system_name' => 'cbc',
                // 'test_type_id' => 22,// 'CBC'
                'measureNameMappings' => [
                    [
                    'standard_name' => 'WBC Total',
                    // 'measure_id' => 67,// 'WBC'
                    'system_name' => 'wbc_total',],
                    [
                    'standard_name' => 'WBC Differential',
                    // 'measure_id' => 67,// 'WBC'
                    'system_name' => 'wbc_differential',],
                    [
                    'standard_name' => 'RBC',
                    // 'measure_id' => 68,// 'RBC'
                    'system_name' => 'rbc',],
                    [
                    'standard_name' => 'hgb',
                    // 'measure_id' => 69,// 'HGB'
                    'system_name' => 'hgb',],
                ]
            ],['standard_name' => 'Hb',
                'system_name' => 'hb',
                // 'test_type_id' => 4,// 'HB'
                'measureNameMappings' => [
                    ['standard_name' => 'Hb',
                    // 'measure_id' => 27,// 'HB'
                    'system_name' => 'hb',],
                ]
            ],['standard_name' => 'ESR',
                'system_name' => 'esr',
                'measureNameMappings' => [
                    ['standard_name' => 'ESR',
                    'system_name' => 'esr',],
                ]
            ],['standard_name' => 'Bleeding time',
                'system_name' => 'bleeding_time',
                'measureNameMappings' => [
                    ['standard_name' => 'Bleeding time',
                    'system_name' => 'bleeding_time',],
                ]
            ],['standard_name' => 'Prothrombin Time',
                'system_name' => 'prothrombin_time',
                'measureNameMappings' => [
                    ['standard_name' => 'Prothrombin Time',
                    'system_name' => 'prothrombin_time',],
                ]
            ],['standard_name' => 'Clotting Time',
                'system_name' => 'clotting_time',
                'measureNameMappings' => [
                    ['standard_name' => 'Clotting Time',
                    'system_name' => 'clotting_time',],
                ]
            ],['standard_name' => 'ABO Grouping',
                'system_name' => 'abo_grouping',
                // 'test_type_id' => 24,// 'Blood Grouping'
                'measureNameMappings' => [
                    ['standard_name' => 'ABO Grouping',
                    'system_name' => 'abo_grouping',],
                ]
            ],['standard_name' => 'Combs',
                'system_name' => 'combs',
                'measureNameMappings' => [
                    ['standard_name' => 'Combs',
                    'system_name' => 'combs',],
                ]
            ],['standard_name' => 'Cross Matching',
                'system_name' => 'cross_matching',
                // 'test_type_id' => 25,// 'Cross matching'
                'measureNameMappings' => [
                    ['standard_name' => 'Cross Matching',
                    'system_name' => 'cross_matching',],
                ]
            ],['standard_name' => 'Malaria Microscopy',
                'system_name' => 'malaria_microscopy',
                // 'test_type_id' => 1,// 'BS for mps'
                'measureNameMappings' => [
                    ['standard_name' => 'Malaria Microscopy',
                    'system_name' => 'malaria_microscopy',],
                ]
            ],['standard_name' => 'Malaria RDTs',
                'system_name' => 'malaria_rdts',
                // 'test_type_id' => 34,// 'Malaria RDT'
                'measureNameMappings' => [
                    ['standard_name' => 'Malaria RDTs',
                    'system_name' => 'malaria_rdts',],
                ]
            ],['standard_name' => 'Stool Microscopy',
                'system_name' => 'stool_microscopy',
                'measureNameMappings' => [
                    ['standard_name' => 'Stool Microscopy',
                    'system_name' => 'stool_microscopy',],
                ]
            ],['standard_name' => 'VDRL/RPR',
                'system_name' => 'vdrl_rpr',
                // 'test_type_id' => 27,// 'RPR'
                'measureNameMappings' => [
                    ['standard_name' => 'VDRL/RPR',
                    'system_name' => 'vdrl_rpr',],
                ]
            ],['standard_name' => 'TPHA',
                'system_name' => 'tpha',
                // 'test_type_id' => 36,// 'TPHA'
                'measureNameMappings' => [
                    ['standard_name' => 'TPHA',
                    'system_name' => 'tpha',],
                ]
            ],['standard_name' => 'Shigella Dysentery',
                'system_name' => 'shigella_dysentery',
                'measureNameMappings' => [
                    ['standard_name' => 'Shigella Dysentery',
                    'system_name' => 'shigella_dysentery',],
                ]
            ],['standard_name' => 'Hepatitis B',
                'system_name' => 'hepatitis_b',
                'measureNameMappings' => [
                    ['standard_name' => 'Hepatitis B',
                    'system_name' => 'hepatitis_b',],
                ]
            ],['standard_name' => 'Brucella',
                'system_name' => 'brucella',
                // 'test_type_id' => 14,// 'Brucella Agglutination Test'
                'measureNameMappings' => [
                    ['standard_name' => 'Brucella',
                    'system_name' => 'brucella',],
                ]
            ],['standard_name' => 'Pregnancy Test',
                'system_name' => 'pregnancy_test',
                // 'test_type_id' => 13,// 'Pregnancy Test'
                'measureNameMappings' => [
                    ['standard_name' => 'Pregnancy Test',
                    'system_name' => 'pregnancy_test',],
                ]
            ],['standard_name' => 'Rheumatoid Factor',
                'system_name' => 'rheumatoid_factor',
                'measureNameMappings' => [
                    ['standard_name' => 'Rheumatoid Factor',
                    'system_name' => 'rheumatoid_factor',],
                ]
            ],['standard_name' => 'CD4 tests',
                'system_name' => 'cd4_tests',
                // 'test_type_id' => 28,// 'CD4 count'
                'measureNameMappings' => [
                    ['standard_name' => 'CD4 tests',
                    'system_name' => 'cd4_tests',],
                ]
            ],['standard_name' => 'Viral Load Tests',
                'system_name' => 'viral_load_tests',
                'measureNameMappings' => [
                    ['standard_name' => 'Viral Load Tests',
                    'system_name' => 'viral_load_tests',],
                ]
            ],['standard_name' => 'ZN for AFBs',
                'system_name' => 'zn_for_afbs',
                // 'test_type_id' => 19,// 'ZN stain'
                'measureNameMappings' => [
                    ['standard_name' => 'ZN for AFBs',
                    'system_name' => 'zn_for_afbs',],
                ]
            ],['standard_name' => 'Culture & Sensitivity',
                'system_name' => 'culture_sensitivity',
                // 'test_type_id' => 16,// 'Culture and Sensitivity'
                'measureNameMappings' => [
                    ['standard_name' => 'Culture & Sensitivity',
                    'system_name' => 'culture_sensitivity',],
                ]
            ],['standard_name' => 'Gram Stain',
                'system_name' => 'gram_stain',
                // 'test_type_id' => 18,// 'Gram stain'
                'measureNameMappings' => [
                    ['standard_name' => 'Gram Stain',
                    'system_name' => 'gram_stain',],
                ]
            ],['standard_name' => 'India Ink',
                'system_name' => 'india_ink',
                'measureNameMappings' => [
                    ['standard_name' => 'India Ink',
                    'system_name' => 'india_ink',],
                ]
            ],['standard_name' => 'Wet Preps',
                'system_name' => 'wet_preps',
                'measureNameMappings' => [
                    ['standard_name' => 'Wet Preps',
                    'system_name' => 'wet_preps',],
                ]
            ],['standard_name' => 'Urine Microscopy',
                'system_name' => 'urine_microscopy',
                'measureNameMappings' => [
                    ['standard_name' => 'Urine Microscopy',
                    'system_name' => 'urine_microscopy',],
                ]
            ],['standard_name' => 'Renal Profile',
                'system_name' => 'renal_profile',
                // 'test_type_id' => 37,// 'RFTs'
                'measureNameMappings' => [
                    ['standard_name' => 'Urea',
                    // 'measure_id' => 121,// 'Urea'
                    'system_name' => 'urea',],
                    ['standard_name' => 'Calcium',
                    // 'measure_id' => 4,// 'calcium'
                    'system_name' => 'calcium',],
                    ['standard_name' => 'Potassium',
                    // 'measure_id' => 18,// 'Potassium'
                    // 'measure_id' => 124,// 'K+'
                    'system_name' => 'potassium',],
                    ['standard_name' => 'Sodium',
                    // 'measure_id' => 19,// 'Sodium'
                    // 'measure_id' => 123,// 'Na+'
                    'system_name' => 'sodium',],
                    ['standard_name' => 'Creatinine',
                    // 'measure_id' => 21,// 'Creatinine'
                    'system_name' => 'creatinine',],
                ]
            ],['standard_name' => 'Liver Profile',
                'system_name' => 'liver_profile',
                // 'test_type_id' => 26,// 'LFTs'
                'measureNameMappings' => [
                    ['standard_name' => 'ALT',
                    // 'measure_id' => 113,// 'ALT'
                    'system_name' => 'alt',],
                    ['standard_name' => 'AST',
                    // 'measure_id' => 112,// 'AST'
                    'system_name' => 'ast',],
                    ['standard_name' => 'Albumin',
                    // 'measure_id' => 114,// 'ALB'
                    'system_name' => 'albumin',],
                    ['standard_name' => 'Total Protein',
                    // 'measure_id' => 115,// 'T. Proteins'
                    'system_name' => 'total_protein',],
                ]
            ],['standard_name' => 'Lipid/Cardiac Profile',
                'system_name' => 'lipid_cardiac_profile',
                'measureNameMappings' => [
                    ['standard_name' => 'Triglycerides',
                    'system_name' => 'triglycerides',],
                    ['standard_name' => 'Cholesterol',
                    'system_name' => 'cholesterol',],
                    ['standard_name' => 'CK',
                    'system_name' => 'ck',],
                    ['standard_name' => 'LDH',
                    'system_name' => 'ldh',],
                    ['standard_name' => 'HDL',
                    'system_name' => 'hdl',],
                ]
            ],['standard_name' => 'Alkaline Phosphates',
                'system_name' => 'alkaline_phosphates',
                'measureNameMappings' => [
                    ['standard_name' => 'Alkaline Phosphates',
                    'system_name' => 'alkaline_phosphates',],
                ]
            ],['standard_name' => 'Amylase',
                'system_name' => 'amylase',
                'measureNameMappings' => [
                    ['standard_name' => 'Amylase',
                    'system_name' => 'amylase',],
                ]
            ],['standard_name' => 'Glucose',
                'system_name' => 'glucose',
                // 'test_type_id' => 23,// 'RBS/Serum Glucose'
                'measureNameMappings' => [
                    ['standard_name' => 'Glucose',
                    // 'measure_id' => 39,// 'Glucose'
                    'system_name' => 'glucose',],
                ]
            ],['standard_name' => 'Uric Acid',
                'system_name' => 'uric_acid',
                'measureNameMappings' => [
                    ['standard_name' => 'Uric Acid',
                    'system_name' => 'uric_acid',],
                ]
            ],['standard_name' => 'Lactate',
                'system_name' => 'lactate',
                'measureNameMappings' => [
                    ['standard_name' => 'Lactate',
                    'system_name' => 'lactate',]
                ]
            ],['standard_name' => 'HIV',
                'system_name' => 'hiv',
                'measureNameMappings' => [
                    ['standard_name' => 'Determine',
                    'system_name' => 'determine',],
                    ['standard_name' => 'Stat-pak',
                    'system_name' => 'stat_pak',],
                    ['standard_name' => 'Unigold',
                    'system_name' => 'unigold',]
                ]
            ],
        ];
        foreach ($testNameMappings as $key => $testNameMapping)
        {
            $testNameMapping = TestNameMapping::create([
                'standard_name' => $testNameMapping['standard_name'],
                'test_type_id' => (isset($testNameMapping['test_type_id']))?$testNameMapping['test_type_id']:NULL,
                'system_name' => $testNameMapping['system_name']]);
            $test_name_mapping_id = $testNameMapping->id;
                echo "test name {$testNameMapping['standard_name']} - {$testNameMapping['system_name']}\n";
            foreach ($testNameMappings[$key]['measureNameMappings'] as $measureNameMapping) {
                MeasureNameMapping::create([
                    'test_name_mapping_id' => $test_name_mapping_id,
                'measure_id' => (isset($measureNameMapping['measure_id']))?$measureNameMapping['measure_id']:NULL,
                    'standard_name' => $measureNameMapping['standard_name'],
                    'system_name' => $measureNameMapping['system_name']]);
                    echo "--measure name {$measureNameMapping['standard_name']} - {$measureNameMapping['system_name']}\n";
            }
        }

        ResultInterpretation::create(['name' => 'High']);
        ResultInterpretation::create(['name' => 'Normal']);
        ResultInterpretation::create(['name' => 'Low']);
        ResultInterpretation::create(['name' => 'HGB<8']);
        ResultInterpretation::create(['name' => 'HBG≥8']);
        ResultInterpretation::create(['name' => 'Positive']);
        ResultInterpretation::create(['name' => 'Negative']);

        GramStainRange::create(["name" => "No organism seen"]);
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
