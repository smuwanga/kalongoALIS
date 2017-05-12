<html>
<head>
{{ HTML::style('css/bootstrap.min.css') }}
{{ HTML::style('css/bootstrap-theme.min.css') }}
<style type="text/css">
	#content table, #content th, #content td {
	   border: 1px solid black;
	   font-size:12px;
	}
	#content p{
		font-size:12px;
	 }
</style>
</head>
<body>
		@if($error!='')
		<!-- if there are search errors, they will show here -->
			<div class="alert alert-info">{{ $error }}</div>
		@else

		<div id="report_content">
		@include("reportHeader")
		<strong>
			<p>
				{{trans('messages.patient-report').' - '.date('d-m-Y')}}
			</p>
		</strong>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th>{{ trans('messages.patient-name')}}</th>
					@if(Entrust::can('view_names'))
						<td>{{ $patient->name }}</td>
					@else
						<td>N/A</td>
					@endif
					<th>{{ trans('messages.gender')}}</th>
					<td>{{ $patient->getGender(false) }}</td>
				</tr>
				<tr>
					<th>{{ trans('messages.patient-id')}}</th>
					<td>{{ $patient->patient_number}}</td>
					<th>{{ trans('messages.age')}}</th>
					<td>{{ $patient->getAge()}}</td>
				</tr>
			</tbody>
		</table>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th colspan="7">{{trans('messages.specimen')}}</th>
				</tr>
				<tr>
					<th>{{ Lang::choice('messages.specimen-type', 1)}}</th>
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

			</tbody>
		</table>
		<table class="table table-bordered">
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
<!-- 					<th>{{trans('messages.verified-by')}}</th>
					<th>{{trans('messages.date-verified')}}</th>
 -->				</tr>
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
							<td>{{ $test->interpretation == '' ? 'N/A' : $test->interpretation }}</td>
							<td>{{ $test->testedBy->name}}</td>
							<td>{{ $test->testResults->count() ? $test->testResults->last()->time_entered : '' }}</td>
							<td>{{ $test->time_completed }}</td>
<!-- 							<td>{{ $test->verifiedBy->name or trans('messages.verification-pending')}}</td>
							<td>{{ $test->time_verified }}</td>
 -->						</tr>
				@empty
					<tr>
						<td colspan="8">{{trans("messages.no-records-found")}}</td>
					</tr>
				@endforelse
			</tbody>
		</table></div>
		@endif

</div>
</body>
</html>