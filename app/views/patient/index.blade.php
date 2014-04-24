@extends("layout")
@section("content")
	<div>
		<ol class="breadcrumb">
		  <li><a href="#">Home</a></li>
		  <li class="active">Patient</li>
		</ol>
	</div>
	@if (Session::has('message'))
		<div class="alert alert-info">{{ Session::get('message') }}</div>
	@endif
	<div class="panel panel-primary patient-create">
		<div class="panel-heading ">
			<span class="glyphicon glyphicon-user"></span>
			List Patients
		</div>
		<div class="panel-body">
			<table class="table table-striped table-hover table-condensed">
				<thead>
					<tr>
						<th>Patient Number</th>
						<th>Name</th>
						<th>Email</th>
						<th>Gender</th>
						<th>Date of Birth</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				@foreach($patients as $key => $value)
					<tr>
						<td>{{ $value->patient_number }}</td>
						<td>{{ $value->name }}</td>
						<td>{{ $value->email }}</td>
						<td>{{ ($value->gender==0?"Male":"Female") }}</td>
						<td>{{ $value->dob }}</td>

						<td>

							<!-- show the patient (uses the show method found at GET /patient/{id} -->
							<a class="btn btn-sm btn-success" href="{{ URL::to('patient/' . $value->id) }}">
								<span class="glyphicon glyphicon-user"></span>
								Show
							</a>

							<!-- edit this patient (uses the edit method found at GET /patient/{id}/edit -->
							<a class="btn btn-sm btn-info" href="{{ URL::to('patient/' . $value->id . '/edit') }}">
								<span class="glyphicon glyphicon-edit"></span>
								Edit
							</a>
							<!-- delete this patient (uses the delete method found at GET /patient/{id}/delete -->
							<a class="btn btn-sm btn-danger" href="{{ URL::to('patient/' . $value->id . '/delete') }}">
								<span class="glyphicon glyphicon-remove"></span>
								Delete
							</a>

						</td>
					</tr>
				@endforeach
				</tbody>
			</table>
		</div>
	</div>
@stop