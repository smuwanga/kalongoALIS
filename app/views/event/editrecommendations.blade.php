@extends("layout")
@section("content")
	<div>
		<ol class="breadcrumb">
		  <li><a href="{{{URL::route('user.home')}}}">{{ trans('messages.home') }}</a></li>
		  <li><a href="{{ URL::route('event.index') }}">Events</a></li>
		</ol>
	</div>

	@if (Session::has('message'))
	<div class="alert alert-info">{{ trans(Session::get('message')) }}</div>
	@endif

	<div class="panel panel-primary">
		<div class="panel-heading ">
			<span class="glyphicon glyphicon-user"></span>
			Updating Event Information - Recommendations
		</div>
		<div class="panel-body">
		<!-- if there are creation errors, they will show here -->
			
			@if($errors->all())
				<div class="alert alert-danger">
					{{ HTML::ul($errors->all()) }}
				</div>
			@endif
			
{{ Form::model($event, array('files'=>true,'route' => array('event.updaterecommendations', $event->id), 'method' => 'PUT',
				'id' => 'form-edit-eventrecommendations')) }}

			<div class="panel panel-info">
			<div class="panel-body">
                
				<div class="row view-striped">
					<div class=""><strong>{{ $event->name }}: From {{ $event->start_date }} to {{ $event->end_date }}</strong></div>
				</div>

				<div class="row view-striped">
					<strong>Recommendations</strong><br>
					<ul>
					@foreach ($event->recommendation as $recommendation)
              		<li>{{$recommendation->recommendation}}</li>
           			@endforeach
           			</ul>
				</div>

			</div>
			</div>

			<div class="form-group row">
			{{ Form::hidden('event_id', $event->id) }}
			{{ Form::label('recommendation', 'Add Recommendation', array('class' => 'col-sm-2')) }}
			{{ Form::textarea('recommendation', '', array('size' => '10x1','class' => 'form-control col-sm-10')) }}
			</div>

			<div class="form-group actions-row" style="text-align:centre;">
				{{ Form::button('<span class="glyphicon glyphicon-save"></span> '.'SAVE', 
				['class' => 'btn btn-primary', 'onclick' => 'submit()']) }}
			</div>
			
{{ Form::close() }}

@stop	