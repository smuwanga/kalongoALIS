@extends("layout")
@section("content")
<script>
$('#location').on('change', function() {
var el = $('#field-location');
if (this.value === 'Field Activity') { el.show();} 
else { el.hide();}
});
</script>
	<div>
		<ol class="breadcrumb">
		  <li><a href="{{{URL::route('user.home')}}}">{{ trans('messages.home') }}</a></li>
		  <li><a href="{{ URL::route('event.index') }}">Events</a></li>
		  <li class="active">New Event</li>
		</ol>
	</div>
	<div class="panel panel-primary">
		<div class="panel-heading ">
			<span class="glyphicon glyphicon-user"></span>
			New Event 
		</div>
		<div class="panel-body">
		<!-- if there are creation errors, they will show here -->
			
			@if($errors->all())
				<div class="alert alert-danger">
					{{ HTML::ul($errors->all()) }}
				</div>
			@endif
			
{{ Form::open(array('url' => 'event', 'id' => 'form-create-event','files'=>true, 'autocomplete' => 'off')) }}

<div class="form-group actions-row" style="text-align:right;">
		{{ Form::button('<span class="glyphicon glyphicon-save"></span> '.'SAVE', 
		['class' => 'btn btn-primary', 'onclick' => 'submit()']) }}
</div>

<div class="panel panel-info">
	<div class="panel-heading"><strong>Event Information</strong></div>
	<div class="panel-body">				
		
		<div class="form-group">
			{{ Form::hidden('user_id', Auth::user()->id) }}
			{{ Form::label('name', 'Event Name', array('class' => 'col-sm-2')) }}
			{{ Form::textarea('name', Input::old('name'), array('size' => '10x1','class' => 'form-control col-sm-10')) }}
			
		</div>

		<div class="form-group">
			{{ Form::label('department', 'Department', array('class' => 'col-sm-2')) }}
			{{ Form::text('department', Input::old('department'), array('class' => 'form-control col-sm-4')) }}

			{{ Form::label('type', 'Type', array('class' => 'col-sm-2')) }}
			<input list="type" name="type" class="form-control col-sm-4" placeholder="Double click for options or write">
					<datalist id="type">
						<option value="CPHL Staff">
						<option value="Health Managers">
						<option value="Meeting of Lab Services Coordinators">
						<option value="Multi sectoral">
						<option value="National stakeholders meeting">
					</datalist>
		</div>

		<div class="form-group">
			{{ Form::label('start_date', 'Start Date', array('class' => 'col-sm-2')) }}
			{{ Form::text('start_date', Input::old('start_date'), array('class' => 'form-control standard-datepicker col-sm-4')) }}

			{{ Form::label('end_date', 'End Date', array('class' => 'col-sm-2')) }}
			{{ Form::text('end_date', Input::old('end_date'), array('class' => 'form-control standard-datepicker col-sm-4')) }}	
		</div>

		<div class="form-group">
			{{ Form::label('location', 'Location', array('class' => 'col-sm-2')) }}
			{{ Form::select('location', [
					'' => '',
					'CPHL' => 'CPHL',
					'Field Activity' => 'Field Activity'], 
					Input::old('location'), array('id' => 'location', 'class' => 'form-control col-sm-4')) }}
			
			{{ Form::label('premise', 'Hotel/Premise', array('class' => 'col-sm-2')) }}
			{{ Form::text('premise', Input::old('premise'), array('class' => 'form-control col-sm-4')) }}
		</div>

		<div class="form-group" style="" id="field-location">
			{{ Form::label('region', 'Health Region', array('class' => 'col-sm-2')) }}
			{{ Form::text('region', Input::old('region'), array('class' => 'form-control col-sm-4')) }}

			{{ Form::label('district', 'District', array('class' => 'col-sm-2')) }}
			{{ Form::select('district', $districts, array('class' => 'form-control col-sm-4')) }}	
			
			
		</div>

		<div class="form-group">
			{{ Form::label('sponsor', 'Sponsor', array('class' => 'col-sm-2')) }}
			{{ Form::text('sponsor', Input::old('sponsor'), array('class' => 'form-control col-sm-4')) }}

			{{ Form::label('organiser', 'Organiser', array('class' => 'col-sm-2')) }}
			{{ Form::text('organiser', Input::old('organiser'), array('class' => 'form-control col-sm-4')) }}	
		</div>

		<div class="form-group">
			{{ Form::label('audience', 'Target Audience', array('class' => 'col-sm-2')) }}
			{{ Form::textarea('audience', Input::old('audience'), array('size' => '10x1','class' => 'form-control col-sm-10')) }}
			
			{{ Form::label('participants_no', 'No of Participants', array('class' => 'col-sm-2')) }}
			{{ Form::input('number','participants_no', Input::old('participants_no'), array('class' => 'form-control col-sm-4')) }}	
		</div>

		<div class="form-group">
			{{ Form::label('report_path', 'Upload Report', array('class' => 'col-sm-2')) }}
			{{ Form::file('report_path', Input::old('report_path'), array('class' => 'form-control col-sm-4')) }}

			<!--{{ Form::label('end_date', 'End Date', array('class' => 'col-sm-2')) }}
			{{ Form::text('end_date', Input::old('end_date'), array('class' => 'form-control standard-datepicker col-sm-4')) }}	
		--></div>
	
	</div>
</div>
				
<div class="form-group actions-row" style="text-align:right;">
		{{ Form::button('<span class="glyphicon glyphicon-save"></span> '.'SAVE', 
		['class' => 'btn btn-primary', 'onclick' => 'submit()']) }}
</div>
								
				
{{ Form::close() }}

</div>
</div>
@stop	