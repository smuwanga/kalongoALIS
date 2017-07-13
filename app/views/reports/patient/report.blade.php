<style type="text/css">
	 table {
	 	padding: 2px;
	 }
</style>
<br>
<br>
<b>{{trans('messages.patient-report').': '.date('d-m-Y')}}</b>
<br>
<table style="border-bottom: 1px solid #cecfd5;">
	<tr>
		<td colspan="1"><strong>{{ trans('messages.patient-id')}}</strong></td>
		<td colspan="1">{{ $patient->patient_number}}</td>
		<td colspan="1"><strong>{{ trans('messages.patient-name')}}</strong></td>
		@if(Entrust::can('view_names'))
			<td colspan="2">{{ $patient->name }}</td>
		@else
			<td colspan="1">N/A</td>
		@endif
		<td colspan="1"><strong>{{ trans('messages.gender')}} & {{ trans('messages.age')}}</strong></td>
		<td colspan="1">{{ $patient->getGender(false) }} | {{ $patient->getAge()}}</td>
	</tr>
</table>
<br>
<br>
<table style="border-bottom: 1px solid #cecfd5;">
		<tr>
			<th colspan="6">Lab Reception</th>
		</tr>
</table>
<table style="border-bottom: 1px solid #cecfd5;">
		<tr>
			<td colspan="2"><b>Specimen Type</b></td>
			<td colspan="2"><b>Received By</b></td>
			<td colspan="2"><b>Date Received</b></td>
			<td colspan="2"><b>{{ trans('messages.specimen-status')}}</b></td>
			<td colspan="3"><b>{{ Lang::choice('messages.test-category', 2)}}</b></td>
			<td colspan="2"><b>Tests Requested</b></td>
		</tr>
</table>
<table style="border-bottom: 1px solid #cecfd5;">
		@forelse($tests as $test)
				<tr>
					<td colspan="2">{{ $test->specimen->specimenType->name }}</td>
					@if($test->specimen->specimen_status_id == UnhlsSpecimen::NOT_COLLECTED)
						<td colspan="2"></td>
						<td colspan="2"></td>
						<td colspan="2">{{trans('messages.specimen-not-collected')}}</td>
					@elseif($test->specimen->specimen_status_id == UnhlsSpecimen::ACCEPTED)
						<td colspan="2">{{$test->specimen->acceptedBy->name}}</td>
						<td colspan="2">{{substr($test->specimen->time_accepted, 0, -8)}}</td>
						<td colspan="2">{{trans('messages.specimen-accepted')}}</td>
					@elseif($test->test_status_id == UnhlsTest::REJECTED)
						<td colspan="2">{{$test->specimen->rejectedBy->name}}</td>
						<td colspan="2">{{substr($test->specimen->time_rejected, 0, -8)}}</td>
						<td colspan="2">{{trans('messages.specimen-rejected')}}</td>
					@endif
					<td colspan="3">{{ $test->testType->testCategory->name }}</td>
					<td colspan="2">{{ $test->testType->name }}</td>
				</tr>
		@empty
			<tr>
				<td colspan="6">{{trans("messages.no-records-found")}}</td>
			</tr>
		@endforelse
</table>

<br>
<br>
<table  style="border-bottom: 1px solid #cecfd5;">
	<tr>
		<th colspan="6">{{trans('messages.test-results')}}</th>
	</tr>
</table>
<table  style="border-bottom: 1px solid #cecfd5;">
	<tr>
		<td colspan="1"><b>{{Lang::choice('messages.test-type', 1)}}</b></td>
		<td colspan="3"><b>{{trans('messages.test-results-values')}}</b></td>
		<td colspan="1"><b>Date Entered</b></td>
		<td colspan="1"><b>{{trans('messages.tested-by')}}</b></td>
		<td colspan="1"><b>{{trans('messages.verified-by')}}</b></td>
	</tr>
</table>
@forelse($tests as $test)
	@if(!$test->testType->isCulture() && ($test->isCompleted() || $test->isVerified()))
	<table  style="border-bottom: 1px solid #cecfd5;">
		<tr>
			<td colspan="1">{{ $test->testType->name }}</td>
			<td colspan="3">
				@foreach($test->testResults as $result)
						@if($test->testType->measures->count() > 1)
							{{ Measure::find($result->measure_id)->name }}:
						@endif
						{{ $result->result }}
						{{ Measure::getRange($test->visit->patient, $result->measure_id) }}
						{{ Measure::find($result->measure_id)->unit }}
					<br>
				@endforeach
				@if($test->testType->name == 'HIV')
					<b>Interpretaion:</b>{{$test->interpreteHIVResults()}}
				@else
					<b>Comments:</b> {{ $test->interpretation == '' ? 'N/A' : $test->interpretation }}
				@endif
			</td>
			<td colspan="1">{{ substr($test->time_completed, 0, -8) }}</td>
			<td colspan="1">{{ $test->isCompleted()?$test->testedBy->name:'Pending'}}</td>
			<td colspan="1">{{ $test->isVerified()?$test->verifiedBy->name:'Pending'}}</td>
		</tr>
	</table>
	@elseif($test->testType->isCulture())
        <!-- Culture and Sensitivity analysis -->
        @if(count($test->isolated_organisms)>0)<!-- if there are any isolated organisms -->
        <table style="border-bottom: 1px solid #cecfd5;">
            <tr>
              <td colspan="3"></td>
            </tr>
            <tr>
              <td colspan="3">Antimicrobial Susceptibility Testing(AST)</td>
            </tr>
            <tr>
                <th><b>Organism(s)</b></th>
                <th><b>Antibiotic(s)</b></th>
                <th><b>Result(s)</b></th>
            </tr>
        </table>
        @foreach($test->isolated_organisms as $isolated_organism)
        <table style="border-bottom: 1px solid #cecfd5;">
          <tr>
            <td rowspan="{{$isolated_organism->drug_susceptibilities->count()}}" class="organism">{{$isolated_organism->organism->name}}</td>
              <?php $i = 1; ?>
            @if($isolated_organism->drug_susceptibilities->count() == 0)
              </tr>
            @else
              @foreach($isolated_organism->drug_susceptibilities as $drug_susceptibility)
                @if ($i > 1)
                <tr>
                @endif
                <?php $i++; ?>
                <td class="antibiotic">{{$drug_susceptibility->drug->name}}</td>
                <td class="result">{{$drug_susceptibility->drug_susceptibility_measure->symbol}}</td>
              </tr>
              @endforeach
            @endif
        </table>
        @endforeach

        @foreach($test->isolated_organisms as $isolated_organism)
        <table style="border-bottom: 1px solid #cecfd5;">
          <tr>
            <td rowspan="{{$isolated_organism->drug_susceptibilities->count()}}" class="organism">{{$isolated_organism->organism->name}}</td>
              <?php $i = 1; ?>
            @if($isolated_organism->drug_susceptibilities->count() == 0)
              </tr>
            @else
              @foreach($isolated_organism->drug_susceptibilities as $drug_susceptibility)
                <td class="antibiotic">{{$drug_susceptibility->drug->name}}</td>
                <td class="result">{{$drug_susceptibility->drug_susceptibility_measure->symbol}}</td>
              </tr>
              @endforeach
            @endif
        </table>
        @endforeach

        <table style="border-bottom: 1px solid #cecfd5;">
            <tr>
              <td>Comment(s)</td>
              <td colspan="2">
              {{$test->interpretation}}
              </td>
            </tr>
        </table>

        </hr>
        <table style="border-bottom: 1px solid #cecfd5;">
            <tr>
              <td><b>Analysis Performed by:</b></td>
              <td>{{ $test->isCompleted()?$test->testedBy->name:'Pending' }}</td>
              <td><b>Verified by:</b></td>
              <td>{{ $test->isVerified()?$test->verifiedBy->name:'Pending' }}</td>
            </tr>
        </table>

        <table style="border-bottom: 1px solid #cecfd5;">
            <tr>
               <td colspan="2">Result Guide</td>
               <td colspan="4" style="text-align:left;">S-Sensitive | R-Resistant | I-Intermediate</td>
            </tr>
        </table>
        @else<!-- if there are no isolated organisms -->
            @if($test->culture_observation)<!-- if there are comments -->
            <table>
                  <tr>
                    <td>{{ $test->culture_observation->observation }}</td>
                  </tr>
            </table>
            @endif<!--./ if there are comments -->
        @endif<!--./ if there are no isolated organisms -->
	@endif
@empty
<table  style="border-bottom: 1px solid #cecfd5;">
	<tr>
		<td colspan="6">{{trans("messages.no-records-found")}}</td>
	</tr>
</table>
@endforelse

<br>
<table>
	<tr><td colspan="2"></td></tr>
	<tr>
		<td>
			<strong>{{ Lang::choice('messages.name', 1).":" }}</strong>
			{{ trans('messages.signature-holder') }}
		</td>
		<td>
			<strong>{{ Lang::choice('messages.name', 1).":" }}</strong>
			{{ trans('messages.signature-holder') }}
		</td>
	</tr>
	<tr>
		<td><u><strong>Requesting Clinician</strong></u></td>
		<td><u><strong>{{ trans('messages.lab-manager') }}</strong></u></td>
	</tr>
</table>
