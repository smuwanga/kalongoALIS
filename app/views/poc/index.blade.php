@extends("layout")
@section("content")
<div>
	<ol class="breadcrumb">
	  <li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
	  <li class="active">{{ Lang::choice('messages.patient',2) }}</li>
	</ol>
</div>

<div class='container-fluid'>
	<div class='row'>
		<div class='col-md-12'>
			{{ Form::open(array('route' => array('poc.index'), 'class'=>'form-inline','role'=>'form', 'method'=>'GET')) }}
				<div class="form-group">

				    {{ Form::label('search', "search", array('class' => 'sr-only')) }}
		            {{ Form::text('search', Input::get('search'), array('class' => 'form-control test-search')) }}
				</div>
				<div class="form-group">
					{{ Form::button("<span class='glyphicon glyphicon-search'></span> ".trans('messages.search'),
				        array('class' => 'btn btn-primary', 'type' => 'submit')) }}
				</div>
			{{ Form::close() }}
		</div>
	</div>
</div>

	<br>

@if (Session::has('message'))
	<div class="alert alert-info">{{ trans(Session::get('message')) }}</div>
@endif

<div class="panel panel-default">
	<div class="panel-heading ">
		<span class="glyphicon glyphicon-user"></span>
	POC / EID Patient List
		<div class="panel-btn">
			<a class="btn btn-sm btn-info" href="{{ URL::route('poc.create') }}">
				<span class="glyphicon glyphicon-plus-sign"></span>
				{{trans('messages.new-patient')}}
			</a>
		</div>
	</div>
	<div class="panel-body">
		<table class="table table-striped table-bordered table-hover table-condensed search-table">
			<thead>
				<tr>
					<th>Sample ID</th>
					<th>Infant Name</th>
					<th>Gender</th>
					<th>Age In Months</th>
					<th>Caretaker Mobile No.</th>
					<th>Mother & HIV status</th>
					<th>PCR Status</th>
					<th>Mother's PMTCTARVs</th>
					<th>Entry Point</th>

					<th>{{trans('messages.actions')}}</th>
				</tr>
			</thead>

			<tbody>

			@foreach($patients as $key => $patient)
				<tr  @if(Session::has('activepatient'))
						{{(Session::get('activepatient') == $patient->id)?"class='info'":""}}
					@endif

				<tr>

					<td>{{ $patient->sample_id }}</td>
					<td>{{ $patient->infant_name }}</td>
					<td>{{ $patient->gender }}</td>
					<td>{{ $patient->age}}</td>
					<td>{{ $patient->caretaker_number}}</td>
					<td>{{ $patient->mother_name}} <br>HIV Status: {{ $patient->mother_hiv_status}}</td>
					<td>{{ $patient->pcr_level}}</td>

					<td><i>Antenatal:: </i> {{$patient->pmtct_antenatal}} <i>Delivery:: </i>{{$patient->pmtct_delivery}} <i>Postnatal:: </i>{{$patient->pmtct_postnatal}}</td>


					<td>{{ $patient->entry_point}}</td>
					<td>
						@if(Auth::user()->can('request_test'))
						<a class="btn btn-sm btn-warning"

							<span class="glyphicon glyphicon-edit"></span>
							Enter Results
						</a>
						@endif
						<!-- show the patient (uses the show method found at GET /patient/{id} -->
						<a class="btn btn-sm btn-success" href="{{ URL::route('poc.show', array($patient->id)) }}" >
							<span class="glyphicon glyphicon-eye-open"></span>
							{{trans('messages.view')}}
						</a>

						<!-- edit this patient (uses the edit method found at GET /patient/{id}/edit -->
						<a class="btn btn-sm btn-info" href="{{ URL::route('poc.edit', array($patient->id)) }}" >
							<span class="glyphicon glyphicon-edit"></span>
							{{trans('messages.edit')}}
						</a>
					</td>
				</tr>
			@endforeach
			</tbody>
		</table>

	</div>
</div>
@stop
