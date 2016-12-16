@extends("layout")
@section("content")
<div>
	<ol class="breadcrumb">
	  <li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
	  <li class="active">Events</li>
	</ol>
</div>
<!--
<div class='container-fluid'>

</div>-->


@if (Session::has('message'))
	<div class="alert alert-info">{{ trans(Session::get('message')) }}</div>
@endif

<div class="panel panel-primary">
	<div class="panel-heading ">
		<span class="glyphicon glyphicon-dashboard"></span>
		List of Events  ({{ count($events); }})
		
		<div class="panel-btn">
			<a class="btn btn-sm btn-info" href="{{ URL::route('event.create') }}">
				<span class="glyphicon glyphicon-plus-sign"></span>
				New Event
			</a>
		</div>
		
	</div>
	
	<div class="panel-body">
		<table class="table table-striped table-hover table-condensed search-table">
			<thead>
				<tr>
					<th>#</th>
					<th>Serial No</th>
					<th>Event Name</th>
					<th>Department</th>
					<th>Type</th>
					<th>Objectives</th>
					<th>Start Date</th>
					<th>End Date</th>

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
					<td>{{ $event->name }}</td>
					<td>{{ $event->department }}</td>
					<td>{{ $event->type }}</td>
					<td title ="@foreach ($event->objective as $objective)
              		{{$objective->objective}}
           			@endforeach"> <a href='#'>Point here</a> </td>
					<td>{{ $event->start_date }}</td>
					<td>{{ $event->end_date }}</td>

					<td>
						<?php
						if($event->report_path=='') {echo "Pending";}
						else{
						?>
						<a href="{{ 'file:'.'\\'.public_path().'\attachments'.'\\'.$event->report_path }}">
							Uploaded</a>
						<?php }?>	
					</td>
					
					<td>
						 <div class="dropdown">
  							<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Select Action
  							<span class="caret"></span></button>
  							<ul class="dropdown-menu">
    							<li><a href="{{ URL::route('event.show', array($event->id)) }}">
    								{{trans('messages.view')}}</a></li>
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
</div>
@stop