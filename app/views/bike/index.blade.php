@extends("layout")
@section("content")
<div>
	<ol class="breadcrumb">
	  <li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
	  <li class="active">Bikes</li>
	</ol>
</div>

<div class='container-fluid'>

</div>

<br>

@if (Session::has('message'))
	<div class="alert alert-info">{{ trans(Session::get('message')) }}</div>
@endif

<div class="panel panel-primary">
	<div class="panel-heading ">
		<span class="glyphicon glyphicon-dashboard"></span>
		List of Bikes  ({{ count($bikes); }})
		
		<div class="panel-btn">
			<a class="btn btn-sm btn-info" href="{{ URL::route('bike.create') }}">
				<span class="glyphicon glyphicon-plus-sign"></span>
				New Bike
			</a>
		</div>
		
	</div>
	
	<div class="panel-body">
		<table class="table table-striped table-hover table-condensed search-table">
			<thead>
				<tr>
					<th>#</th>
					<th>Reg No</th>
					
					<th>Actions</th>
					
				</tr>
			</thead>
			<tbody>
			@foreach($bikes as $key => $bike)
				<tr  @if(Session::has('activebike'))
						{{(Session::get('activebike') == $bike->id)?"class='info'":""}}
					@endif
				>
					<td>{{ $bike->id }}</td>
					<td>{{ $bike->reg_no }}</td>
					
					<td>
						 <div class="dropdown">
  							<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Select Action
  							<span class="caret"></span></button>
  							<ul class="dropdown-menu">
    							<li><a href="{{ URL::route('bike.show', array($bike->id)) }}">{{trans('messages.view')}}</a></li>
    							<li><a href="{{ URL::route('bike.edit', array($bike->id)) }}">Update Incident Information</a></li>
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