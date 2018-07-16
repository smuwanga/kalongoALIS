@extends("layout")
@section("content")
<div>
	<ol class="breadcrumb">
	  <li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
	 
	  <li class="active">{{ Lang::choice('messages.equipment-breakdown',2) }}</li>
	</ol>
</div>
@if (Session::has('message'))
	<div class="alert alert-info">{{ trans(Session::get('message')) }}</div>
@endif
<div class="panel panel-primary">
	<div class="panel-heading ">
		<span class="ion-gear-a"></span>
		{{trans('messages.equipment-breakdown')}}
		<div class="panel-btn">

			<a href="{{ URL::route("equipmentbreakdown.create")}}" class="btn btn-sm btn-info">
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
					<th class="col-sm-1">Date</th>
					<th class="col-sm-1">Name</th>
					<th class="col-sm-2">Description</th>
					<th class="col-sm-2">Actions taken</th>
					<th class="col-sm-1">HSD request</th>
					<th class="col-sm-1">In charge</th>
					<th class="col-sm-1">Rank of importance</th>					
					<th class="col-sm-1">Report date</th>											
					<th class="col-sm-1">Restore date</th>											
					<th class="col-sm-1">Restored by</th>

				</tr>
			</thead>			
			<tbody>
			
			@foreach($items as $item)
				<tr>
				<td  class="col-sm-1">  {{ date('d M Y', strtotime($item->created_at)) }}</td>
				<td  class="col-sm-1">  {{$item->equipment->name }}</td>
				<td  class="col-sm-2">  {{$item->description }}</td>
				<td  class="col-sm-2">  {{$item->action_taken }}</td>
				<td class="col-sm-1">  {{$item->hsd_request }}</td>
				<td class="col-sm-1">  {{$item->staff($item->in_charge_id) }}</td>
				<td class="col-sm-1">  {{ ($item->priority==1?'High':($item->priority==2?'Moderate':'Low')) }}</td>
				<td class="col-sm-1">   {{ $item->report_date!=null?(date('d M Y', strtotime($item->report_date))):'' }}</td>
				<td class="col-sm-1">   {{ $item->restore_date!=null?(date('d M Y', strtotime($item->restore_date))):'' }}</td>
				<td class="col-sm-1">  {{$item->restored_by!=null?($item->staff($item->restored_by)) :"" }}</td>
				<td>
				@if($item->restore_date==null)  	
					<a class="btn btn-sm btn-info" href="{{ URL::route('equipmentbreakdown.restore', array($item->id)) }}" >
							<span class="glyphicon glyphicon-edit"></span>
							
					</a>
				@endif
                </td>
			@endforeach
						
				</tr>
	
			</tbody>
  </table>
</div>

		<?php Session::put('SOURCE_URL', URL::full());?>
	</div>
	
</div>


@stop