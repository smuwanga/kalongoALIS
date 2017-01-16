@extends("layout")
@section("content")
<div>
	<ol class="breadcrumb">
	  <li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
	  <li><a href="{{ URL::route('event.index') }}">Events</a></li>
	  <li class="active">Events Filter</li>
	</ol>
</div>

@if (Session::has('message'))
	<div class="alert alert-info">{{ trans(Session::get('message')) }}</div>
@endif

<div class="panel panel-primary">
	
	<div class='container-fluid'>
	<div class='row'>
		<div class='row col-sm-12'>
		{{ Form::open(array('route' => array('event.eventfilter'), 'class'=>'form-inline',
				'role'=>'form', 'method'=>'GET')) }}			
			<div class="form-group">
			{{ Form::label('datefrom', 'Date From', array('class' => 'col-sm-2')) }}
			{{ Form::text('datefrom', Input::get('datefrom'), 
			array('class' => 'form-control standard-datepicker col-sm-4', 
			'required' => 'required')) }}

			{{ Form::label('dateto', 'Date To', array('class' => 'col-sm-2')) }}
			{{ Form::text('dateto', Input::get('dateto'), 
			array('class' => 'form-control standard-datepicker col-sm-4', 
			'required' => 'required')) }}	
			</div>

			<div class="form-group">
			{{ Form::label('name', 'Keyword in event', array('class' => 'col-sm-2')) }}
			{{ Form::text('name', Input::get('name'), array('placeholder' => 'Only one keyword', 'class' => 'form-control col-sm-4')) }}

			{{ Form::label('', '', array('class' => 'col-sm-2')) }}
			{{ Form::button("<span class='glyphicon glyphicon-search'></span> ".trans('messages.filter'), 
				        array('class' => 'btn btn-primary', 'type' => 'submit')) }}

			&nbsp;&nbsp;&nbsp;&nbsp;<a href="{{ URL::route('event.index') }}">Clear</a>
			</div>
		{{ Form::close() }}
		</div>
	</div>
	</div>

	<hr>

<?php if($events){ ?>
	<div class="panel-heading ">
		<span class="glyphicon glyphicon-dashboard"></span>
		Filtered Events  ({{ count($events); }})
	</div>
	
	<div class="panel-body">
		<table class="table table-striped table-hover table-condensed search-table">
			<thead>
				<tr>
					<th>#</th>
					<th>Serial No</th>
					<th>Start Date</th>
					<th>End Date</th>
					<th>Event Name</th>
					<th>Department</th>
					<th>Type</th>
					<th>Objectives</th>

					<th>Report</th>
					
					<th>Actions</th>
					
				</tr>
			</thead>
			<tbody>
			@foreach($events as $key => $event)
				<tr  @if(Session::has('activeevent'))
						{{(Session::get('activeevent') == $event->id)?"class='info'":""}}
					@endif
				>
					<td>{{ $event->id }}</td>
					<td>{{ $event->serial_no }}</td>
					<td>{{ date('d M Y', strtotime($event->start_date)) }}</td>
					<td>{{ date('d M Y', strtotime($event->end_date)) }}</td>
					<td>{{ $event->name }}</td>
					<td>{{ $event->department }}</td>
					<td>{{ $event->type }}</td>
					<td title ="@foreach ($event->objective as $objective)
              		{{$objective->objective}}
           			@endforeach"> <a href='#'>Point here</a> </td>
					

					<td>
					@if ($event->report_filename)
          			<a href="{{ URL::to( 'attachments/' . $event->report_filename) }}"
            			target="_blank">Download</a>
          			@else Pending
          			@endif	
					</td>
					
					<td>
						 <div class="dropdown">
  							<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Select Action
  							<span class="caret"></span></button>
  							<ul class="dropdown-menu">
    							<li><a href="{{ URL::route('event.show', array($event->id)) }}">
    								View Details</a></li>
    							<li><a href="{{ URL::route('event.edit', array($event->id)) }}">
    								Update Event Information</a></li>
    							<li><a href="{{ URL::route('event.editobjectives', array($event->id)) }}">
    								Update Event Objectives</a></li>
    							<li><a href="{{ URL::route('event.editlessons', array($event->id)) }}">
    								Update Event Lessons</a></li>
    							<li><a href="{{ URL::route('event.editrecommendations', array($event->id)) }}">
    								Update Event Recommendations</a></li>
    							<li><a href="{{ URL::route('event.editactions', array($event->id)) }}">
    								Update Event Actions</a></li>
    						</ul>
						</div>

					</td>
				</tr>
			@endforeach
			</tbody>
		</table>
	</div>
<?php } ?>
</div>
@stop