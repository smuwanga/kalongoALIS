@extends("layout")
@section("content")
<div>
	<ol class="breadcrumb">
	  <li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
	 
	  <li class="active">{{ Lang::choice('messages.equipment-maintenance',2) }}</li>
	</ol>
</div>
@if (Session::has('message'))
	<div class="alert alert-info">{{ trans(Session::get('message')) }}</div>
@endif
<div class="panel panel-primary">
	<div class="panel-heading ">
		<span class="glyphicon glyphicon-user"></span>
		{{trans('messages.equipment-maintenance')}}
		<div class="panel-btn">

			<a href="{{ URL::route("equipmentmaintenance.create")}}" class="btn btn-sm btn-info">
                                <span class="glyphicon glyphicon-plus-sign"></span>
                                {{trans('messages.add')}}
                            </a>
			
		</div>
	</div>


	<div class="panel-body">
	<div class="table-responsive">
  	<table class="table table-striped search-table small-font">
			<thead>
				<tr>
					<th>Date</th>
					<th>Type</th>
					<th>Name</th>
					<th>Frequency</th>
					<th>Last Service</th>
					<th>Next Service</th>
					<th>Serviced by</th>
					<th>Maintained by</th>
					<th>Contact</th>
					<th>Supplier</th>
					<th>Comment</th>																			
				</tr>
			</thead>			
			<tbody>
			
				<tr>
					<td> $equipment->name }}</td>
					<td> $equipment->phone }}</td>
					<td> $equipment->email }}</td>
					<td> $equipment->address }}</td>
					<td> $equipment->name }}</td>
					<td> $equipment->phone }}</td>
					<td> $equipment->email }}</td>
					<td> $equipment->address }}</td>
					<td> $equipment->name }}</td>
					<td> $equipment->phone }}</td>
					<td> $equipment->email }}</td>							
				</tr>
	
			</tbody>
  </table>
</div>

		<?php Session::put('SOURCE_URL', URL::full());?>
	</div>
	
</div>


@stop