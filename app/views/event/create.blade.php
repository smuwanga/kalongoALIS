@extends("layout")
@section("content")
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
			{{ Form::text('type', Input::old('type'), array('class' => 'form-control col-sm-4')) }}	
		</div>

		<div class="form-group">
			{{ Form::label('start_date', 'Start Date', array('class' => 'col-sm-2')) }}
			{{ Form::text('start_date', Input::old('start_date'), array('class' => 'form-control standard-datepicker col-sm-4')) }}

			{{ Form::label('end_date', 'End Date', array('class' => 'col-sm-2')) }}
			{{ Form::text('end_date', Input::old('end_date'), array('class' => 'form-control standard-datepicker col-sm-4')) }}	
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