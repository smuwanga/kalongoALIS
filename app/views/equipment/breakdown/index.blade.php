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
		<span class="glyphicon glyphicon-user"></span>
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
					<th class="col-sm-2">HSD request</th>
					<th class="col-sm-1">In charge</th>
					<th class="col-sm-1">Rank of importance</th>					
					<th class="col-sm-1">Sub district receipt date</th>											
					<th class="col-sm-1">Sub district action date</th>

				</tr>
			</thead>			
			<tbody>
			
				<tr>
				<td>  </td>
				<td>  </td>
				<td>  </td>
				<td>  </td>
				<td>  </td>
				<td>  </td>
				<td>  </td>
				<td>  </td>
				<td>  </td>
						
				</tr>
	
			</tbody>
  </table>
</div>

		<?php Session::put('SOURCE_URL', URL::full());?>
	</div>
	
</div>


@stop