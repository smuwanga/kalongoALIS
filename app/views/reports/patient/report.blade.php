<html>
<head>
{{ HTML::style('css/bootstrap.min.css') }}
{{ HTML::style('css/bootstrap-theme.min.css') }}
<style type="text/css">
	#report_content table, #report_content th, #report_content td {
	   /*border: 1px solid black;*/
	   font-size:12px;
	}
	#report_content p{
		font-size:12px;
	 }
	 table {
	 	padding: 2px;
	 }
</style>
</head>
<body>
		<strong>
			<p> 
				{{trans('messages.patient-report').': '.date('d-m-Y')}}
			</p>
		</strong>	
		<table width="100%" class="table table-bordered">
			<thead>
				<tr>
					<th><strong>{{ trans('messages.patient-name')}}</strong></th>
					@if(Entrust::can('view_names'))
						<td>{{ $patient->name }}</td>
					@else
						<td>N/A</td>
					@endif
					<th><strong>{{ trans('messages.gender')}}</strong></th>
					<td>{{ $patient->getGender(false) }}</td>
				</tr>
				<tr>
					<th><strong>{{ trans('messages.patient-id')}}</strong></th>
					<td>{{ $patient->patient_number}}</td>
					<th><strong>{{ trans('messages.age')}}</strong></th>
					<td>{{ $patient->getAge()}}</td>
				</tr>
			</thead>
		</table>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th colspan="7"><strong>Lab Reception</strong></th>
				</tr>
				<tr>
					<th>Specimen Type</th>
					<th>{{ Lang::choice('messages.test', 2)}}</th>
					<th>{{ trans('messages.date-ordered') }}</th>
					<th>{{ Lang::choice('messages.test-category', 2)}}</th>
					<th>{{ trans('messages.specimen-status')}}</th>
					<th>{{ trans('messages.collected-by')."/".trans('messages.rejected-by')}}</th>
					<th>{{ trans('messages.date-checked')}}</th>
				</tr>
				@forelse($tests as $test)
						<tr>
							<td>{{ $test->specimen->specimenType->name }}</td>
							<td>{{ $test->testType->name }}</td>
							<td>{{ $test->isExternal()?$test->external()->request_date:$test->time_created }}</td>
							<td>{{ $test->testType->testCategory->name }}</td>
							@if($test->specimen->specimen_status_id == UnhlsSpecimen::NOT_COLLECTED)
								<td>{{trans('messages.specimen-not-collected')}}</td>
								<td></td>
								<td></td>
							@elseif($test->specimen->specimen_status_id == UnhlsSpecimen::ACCEPTED)
								<td>{{trans('messages.specimen-accepted')}}</td>
								<td>{{$test->specimen->acceptedBy->name}}</td>
								<td>{{$test->specimen->time_accepted}}</td>
							@elseif($test->test_status_id == UnhlsTest::REJECTED)
								<td>{{trans('messages.specimen-rejected')}}</td>
								<td>{{$test->specimen->rejectedBy->name}}</td>
								<td>{{$test->specimen->time_rejected}}</td>
							@endif
						</tr>
				@empty
					<tr>
						<td colspan="7">{{trans("messages.no-records-found")}}</td>
					</tr>
				@endforelse

			</thead>
		</table>

		<table class="table table-bordered">
			<thead>
				<tr>
					<th colspan="8"><strong>{{trans('messages.test-results')}}</strong></th>
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
				@forelse($tests as $test)
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
							<td>
								@if($test->testType->name == 'HIV')
									{{$test->interpreteHIVResults()}}
								@else
									{{ $test->interpretation == '' ? 'N/A' : $test->interpretation }}
								@endif
							</td>
							<td>{{ $test->testedBy->name}}</td>
							<td>{{ $test->testResults->count() ? $test->testResults->last()->time_entered : '' }}</td>
							<td>{{ $test->time_completed }}</td>
							<td>{{ $test->verifiedBy->name or trans('messages.verification-pending')}}</td>
							<td>{{ $test->time_verified }}</td>
					</tr>
				@empty
					<tr>
						<td colspan="8">{{trans("messages.no-records-found")}}</td>
					</tr>
				@endforelse
			</thead>
		</table>

		<hr>
		<table class="table table-bordered"  width="100%" style="font-size:12px;">
			<thead>
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
					<td>
						<strong>Organization</strong>
						{{ trans('messages.signature-holder') }}
					</td>
					<td>
						<strong>Organization</strong>
						{{ trans('messages.signature-holder') }}
					</td>
				</tr>
				<tr>
					<td><u><strong>Requesting Clinician</strong></u></td>
					<td><u><strong>{{ trans('messages.lab-manager') }}</strong></u></td>
				</tr>
			</thead>
		</table>

		
</body>
</html>