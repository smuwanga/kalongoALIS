<!DOCTYPE html>
<html>
  <head>
    <style type="text/css">
       
    table {
      border-spacing: 0;
      width: 100%;
    }
    th,
    td {
      padding: 10px 15px;
      text-align: left;
    }
    .report-body tr td {
      border-top: 1px solid #cecfd5;
    }
    .ast-head tr th {
      border-bottom: 1px solid #cecfd5;
    }
    .ast-body tr td.organism,
    .ast-body tr:last-child td {
      border-bottom: 1px solid #cecfd5;
    }
    tfoot tr th, tfoot tr td{
      border-top: 1px solid #cecfd5;
    }
    tfoot tr:first-child th, tfoot tr:first-child td{
      border-top: 0;
    }

    caption{
      text-align: left;
    }
    </style>
  </head>
  <body>
  <div id="wrap">
      <div class="container-fluid">
          <div class="row">
        @include("reportHeader")
		<table class="report_body">
			<tbody>
				<tr>
					<th>{{ trans('messages.patient-name')}}</th>
					<td>{{ $visit->patient->name }}</td>
					<th>{{ trans('messages.gender')}}</th>
					<td>{{ $visit->patient->getGender(false) }}</td>
				</tr>
				<tr>
					<th>{{ trans('messages.patient-id')}}</th>
					<td>{{ $visit->patient->patient_number}}</td>
					<th>{{ trans('messages.age')}}</th>
					<td>{{ $visit->patient->getAge()}}</td>
				</tr>
				<tr>
					<th>{{ trans('messages.patient-lab-number')}}</th>
					<td>{{ $visit->patient->external_patient_number }}</td>
					<th>{{ trans('messages.requesting-facility-department')}}</th>
					<td>{{ Config::get('kblis.organization') }}</td>
				</tr>
			</tbody>
		</table>
		<table class="report_body">
			<tbody>
				<tr>
					<th colspan="5">{{trans('messages.specimen')}}</th>
				</tr>
				<tr>
					<th>{{ Lang::choice('messages.specimen-type', 1)}}</th>
					<th>{{ Lang::choice('messages.test', 2)}}</th>
					<th>{{ trans('messages.specimen-status')}}</th>
					<th>{{ trans('messages.collected-by')."/".trans('messages.rejected-by')}}</th>
					<th>Date</th>
				</tr>
				@forelse($visit->tests as $test)
						<tr>
							<td>{{ $test->specimen->specimenType->name }}</td>
							<td>{{ $test->testType->name }}</td>
							@if($test->specimen->specimen_status_id == Specimen::NOT_COLLECTED)
								<td>{{trans('messages.specimen-not-collected')}}</td>
								<td></td>
								<td></td>
							@elseif($test->specimen->specimen_status_id == Specimen::ACCEPTED)
								<td>{{trans('messages.specimen-accepted')}}</td>
								<td>{{$test->specimen->acceptedBy->name}}</td>
								<td>{{$test->specimen->time_accepted}}</td>
							@elseif($test->specimen->specimen_status_id == Specimen::REJECTED)
								<td>{{trans('messages.specimen-rejected')}}</td>
								<td>{{$test->specimen->rejectedBy->name}}</td>
								<td>{{$test->specimen->time_rejected}}</td>
							@endif
						</tr>
				@empty
					<tr>
						<td colspan="5">{{trans("messages.no-records-found")}}</td>
					</tr>
				@endforelse

			</tbody>
		</table>
		<table class="report_body">
			<tbody>
				<tr>
					<th colspan="8">{{trans('messages.test-results')}}</th>
				</tr>
				<tr>
					<th>{{Lang::choice('messages.test-type', 1)}}</th>
					<th>{{trans('messages.test-results-values')}}</th>
					<th>{{trans('messages.test-remarks')}}</th>
					<th>{{trans('messages.tested-by')}}</th>
					<th>{{trans('messages.results-entry-date')}}</th>
					<th>{{trans('messages.date-tested')}}</th>
					<th>{{trans('messages.verified-by')}}</th>
					<th>{{trans('messages.date-verified')}}</th>
				</tr>
				@forelse($visit->tests as $test)
						<tr>
							<td>{{ $test->testType->name }}</td>
							<td>
								@foreach($test->testResults as $result)
									<p>
										{{ Measure::find($result->measure_id)->name }}: {{ $result->result }}
										{{ Measure::getRange($test->visit->patient, $result->measure_id) }}
										{{ Measure::find($result->measure_id)->unit }}
									</p>
								@endforeach</td>
							<td>{{ $test->interpretation == '' ? 'N/A' : $test->interpretation }}</td>
							<td>{{ $test->testedBy->name or trans('messages.pending')}}</td>
							<td>{{ $test->testResults->last()->time_entered }}</td>
							<td>{{ $test->time_completed }}</td>
							<td>{{ $test->verifiedBy->name or trans('messages.verification-pending')}}</td>
							<td>{{ $test->time_verified }}</td>
						</tr>
				@empty
					<tr>
						<td colspan="8">{{trans("messages.no-records-found")}}</td>
					</tr>
				@endforelse
			</tbody>
		</table>
        <table>
          <caption>Laboratory Findings</caption>
          <tbody class="report-body">
            <tr>
               <td>Appearance</td>
               <td colspan="2">Formed</td>
            </tr>
            <tr>
               <td>Wet Preparation</td>
               <td colspan="2">etc</td>
            </tr>
            <tr>
               <td>Biochemistry</td>
               <td colspan="2">Glucose unit(no), Protein unit(no), pH unit(no)</td>
            </tr>
            <tr>
               <td>Cell Count</td>
               <td colspan="2">Total WBC: cells/ul(no), Total RBC: cells/ul(no)</td>
            </tr>
            <tr>
               <td>Leishman</td>
               <td colspan="2">Differential Count: Polymorps(no), lymphocytes(no)</td>
            </tr>
            <tr>
               <td>Microscopy on organism morphology</td>
               <td  colspan="2">gram reaction(gram positive, gram negative, bacilli, cocci, diplococci), ZN(positive,negative), India Ink</td>
            </tr>
            <tr>
               <td>Serology</td>
               <td colspan="2">Crag, HBV, HCV, TPHA/RPR</td>
            </tr>
            <tr>
               <td>Culture Findings</td>
               <td  colspan="2">NBG or NSG</td>
            </tr>
            <tr>
               <td rowspan="3">Culture Findings</td>
               <td><strong>Microorganism(s)</strong></td>
               <td><strong>Corresponding Serotype(s)</strong></td>
            </tr>
            <tr>
               <td>Microorganism1</td>
               <td>Corresponding Serotype1</td>
            </tr>
            <tr>
               <td>Microorganism2</td>
               <td>Corresponding Serotype2</td>
            </tr>
          </tbody>
        </table>
        </br>
        <!-- Culture and Sensitivity analysis -->
        <table>
          <caption>Antimicrobial Susceptibility Testing(AST)</caption>
          <thead class="ast-head">
            <tr>
                <th scope="col">Organism(s)</th>
                <th scope="col">Antibiotic(s)</th>
                <th scope="col">Result(s)</th>
                <th scope="col">Comment(s)</th>
            </tr>
          </thead>
          @foreach($visit->tests as $test)
			@if($test->testType->microbiologyTestType->worksheet_required)   
	          @foreach($test->culture->isolated_organisms as $isolated_organism)
	          <tbody class="ast-body">
	            <tr>
	              <td rowspan="{{$isolated_organism->drug_susceptibilities->count()}}"
	                class="organism">{{$isolated_organism->organism->name}}</td>
	                <?php $i = 1; ?>
	              @foreach($isolated_organism->drug_susceptibilities as $drug_susceptibility)
	              @if ($i != 1)
	            <tr>
	              @endif <?php $i++; ?>
	              <td>{{$drug_susceptibility->drug->name}}</td>
	              <td>{{$drug_susceptibility->drug_susceptibility_measure->symbol}}</td>
	              <td>-</td>
	            </tr>
	            @endforeach
	          </tbody>
	          @endforeach
			@endif
          @endforeach
        </table>
        <table>
          <tbody class="report-body">
            <tr>
               <th>Comment</th>
               <td>ESBL Positive</td>
            </tr>
            <tr>
               <td>Result Guide</td>
               <td>S-Sensitive | R-Resistant | I-Intermediate</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </body>
</html>


