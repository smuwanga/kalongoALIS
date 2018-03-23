@extends("layout")
@section("content")
<?php
$res_positive = $res_negative = $res_error = false;
if($result->results=='Positive'){
	$res_positive = true;
}elseif($result->results=='Negative'){
	$res_negative = true;
}elseif($result->results=='Error'){
	$res_error = true;
}
?>
<div>
	<ol class="breadcrumb">
		<li><a href="{{{URL::route('user.home')}}}">{{ trans('messages.home') }}</a></li>
		<li><a href="{{ URL::route('poc.index') }}">EID Patient list</a></li>
		<!-- <li><a href="{{ URL::route('bbincidence.bbfacilityreport') }}">Facility Report</a></li> -->
		<li class="active">Patient Results</li>
	</ol>
</div>
<div class="panel panel-primary">
	<div class="panel-heading ">
		Facility:: {{Auth::user()->facility->name}} || Level:: {{Auth::user()->facility->level->level}} || {{Auth::user()->facility->district->name}}
	</div>
	<div class="panel-body">

		<!-- if there are creation errors, they will show here -->
		@if($errors->all())
		<div class="alert alert-danger">
			{{ HTML::ul($errors->all()) }}
		</div>
		@endif
		{{ Form::open(array('url' => 'poc/update_results/'.$patient->id, 'id' => 'form-create-bbincidence', 'autocomplete' => 'off')) }}
		<input type="hidden" name="result_id" value="{{ $result->id }}">
		<div class="form-group actions-row" style="text-align:right;">
		</div>

			<div class="panel-heading "><strong>Patient Results</strong></div>
			<div class="panel-body">

				<div class="form-group">
					{{ Form::label('infant_name', 'Infant Name:', array('class' =>'col-sm-2 ')) }}
					{{ $patient->infant_name }}

				</div>

				<div class="form-group">
					{{ Form::label('sample_id', 'Sample ID:', array('class' =>'col-sm-2 ')) }}
					{{ $patient->sample_id }}

				</div>


				<div class="form-group">
					{{ Form::label('results', 'Results:', array('class' =>'col-sm-2 required ')) }}
					<div class="radio-inline">{{ Form::radio('results', 'Positive', $res_positive ) }} <span class="input-tag">Positive</span></div>
					<div class="radio-inline">{{ Form::radio("results", 'Negative', $res_negative) }} <span class="input-tag">Negative</span></div>
					<div class="radio-inline">{{ Form::radio("results", 'Error', $res_error) }} <span class="input-tag">Error</span></div>
				</div>

				<div class="form-group">
					{{ Form::label('error_code', 'Error Code:', array('class' =>'col-sm-2 ')) }}
					{{ Form::text('error_code', $result->error_code, array('class' => 'form-control  col-sm-4')) }}
				</div>

				<div class="form-group">
					{{ Form::label('test_date', 'Test Date:', array('class' =>'col-sm-2 ')) }}
					{{ Form::text('test_date', $result->test_date, array('class' => 'form-control standard-datepicker  col-sm-4')) }}
				</div>

				

			<div class="form-group actions-row">
				{{ Form::button('UPDATE RESULTS',
				['class' => 'btn btn-primary', 'onclick' => 'submit()']) }}
			</div>
			{{ Form::close() }}
			<script>
			$(".standard-datepicker-nofuture").datepicker({
				 maxDate: new Date(),
				 dateFormat: "yy-mm-dd"
			});
		</script>

		</div>

		@stop
