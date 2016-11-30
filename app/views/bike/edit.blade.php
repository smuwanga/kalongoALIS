@extends("layout")
@section("content")
	<div>
		<ol class="breadcrumb">
		  <li><a href="{{{URL::route('user.home')}}}">{{ trans('messages.home') }}</a></li>
		  <li><a href="{{ URL::route('bike.index') }}">Bikes</a></li>
		  <li class="active">Editing Bike</li>
		</ol>
	</div>
	<div class="panel panel-primary">
		<div class="panel-heading ">
			<span class="glyphicon glyphicon-edit"></span>
			Editing Bike

			<a class="btn btn-sm btn-info" href="{{ URL::route('bike.edit', array($previousbike)) }}" >
				<span class="glyphicon glyphicon-backward"></span> Previous
			</a>
				
			<a class="btn btn-sm btn-info" href="{{ URL::route('bike.edit', array($nextbike)) }}" >
				Next <span class="glyphicon glyphicon-forward"></span>
			</a>
		</div>
		<div class="panel-body">
		<!-- if there are creation errors, they will show here -->
			
			@if($errors->all())
				<div class="alert alert-danger">
					{{ HTML::ul($errors->all()) }}
				</div>
			@endif
			
{{ Form::model($bike, array('route' => array('bike.update', $bike->id), 'method' => 'PUT',
				'id' => 'form-edit-bike')) }}
<div class="form-group actions-row" style="text-align:right;">
		{{ Form::button('<span class="glyphicon glyphicon-save"></span> '.'SAVE', 
		['class' => 'btn btn-primary', 'onclick' => 'submit()']) }}
</div>

<div class="panel panel-info">
	<div class="panel-heading"><strong>Bike Information</strong></div>
	<div class="panel-body">				
		<div class="form-group">
			{{ Form::hidden('facility_id', $bike->facility->id) }}
			{{ Form::label('facility_id', 'Facility', array('class' => 'col-sm-2')) }}
			{{ Form::textarea('', $bike->facility->code.' - '.$bike->facility->name.' - '.$bike->facility->district->name, array('size' => '10x2','class' => 'form-control col-sm-4','readonly' => 'readonly')) }}
			
			
	</div>
				
	<div class="form-group">
			{{ Form::label('reg_no', 'Registration No', array('class' => 'col-sm-2')) }}
			{{ Form::text('reg_no', Input::old('reg_no'), array('class' => 'form-control col-sm-4', 
			'placeholder' => 'Number Plate')) }}
			
	</div>
	
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