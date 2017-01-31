@extends("layout")
@section("content")

	<div>
		<ol class="breadcrumb">
		  <li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
		  <li>
		  	<a href="{{ URL::route('unhls_test.index') }}">{{ Lang::choice('messages.test',2) }}</a>
		  </li>
		  <li class="active">{{trans('messages.new-test')}}</li>
		</ol>
	</div>
	<div class="panel panel-primary">
		<div class="panel-heading ">
            <div class="container-fluid">
                <div class="row less-gutter">
                    <div class="col-md-11">
						<span class="glyphicon glyphicon-adjust"></span>{{trans('messages.new-test')}}
                    </div>
                    <div class="col-md-1">
                        <a class="btn btn-sm btn-primary pull-right" href="#" onclick="window.history.back();return false;"
                            alt="{{trans('messages.back')}}" title="{{trans('messages.back')}}">
                            <span class="glyphicon glyphicon-backward"></span></a>
                    </div>
                </div>
            </div>
		</div>
		<div class="panel-body">
		<!-- if there are creation errors, they will show here -->
			@if($errors->all())
				<div class="alert alert-danger">
					{{ HTML::ul($errors->all()) }}
				</div>
			@endif

			{{ Form::open(array('route' => 'unhls_test.saveNewTest', 'id' => 'form-new-test')) }}
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-info">
								<div class="panel-heading">
									<h3 class="panel-title">{{trans("messages.patient-details")}}</h3>
								</div>
								<div class="panel-body inline-display-details">
									<span><strong>{{trans("messages.patient-number")}}</strong> {{ $patient->patient_number }}</span>
									<span><strong>{{ trans('messages.nin') }}</strong> {{ $patient->nin }}</span>
									<span><strong>{{ Lang::choice('messages.name',1) }}</strong> {{ $patient->name }}</span>
									<span><strong>{{trans("messages.age")}}</strong> {{ $patient->getAge() }}</span>
									<span><strong>{{trans("messages.gender")}}</strong>
										{{ $patient->gender==0?trans("messages.male"):trans("messages.female") }}</span>
								</div>
							</div>
							<div class="form-group">
								{{ Form::label('sample_origin','Ward/Clinic/Health Unit') }}
								{{ Form::text('sample_origin', Input::old('sample_origin'), array('class' => 'form-control')) }}
								{{ Form::label('bed_no','Bed No:', array('text-align' => 'right')) }}
								{{ Form::text('bed_no', Input::old('sample_origin'), array('class' => 'form-control')) }}
							</div>	
							<div class="form-group">
								{{ Form::label('clinical_notes','Clinical Notes') }}
								{{ Form::textarea('clinical_notes', Input::old('clinical_notes'), array('class' => 'form-control')) }}
							</div>	
							<div class="form-group">
								{{ Form::label('p_therapy','Previous Therapy') }}
								{{ Form::text('p_therapy', Input::old('p_therapy'), array('class' => 'form-control')) }}
								{{ Form::label('c_therapy','Current Therapy', array('text-align' => 'right')) }}
								{{ Form::text('c_therapy', Input::old('c_therapy'), array('class' => 'form-control')) }}
							</div>							
							<div class="form-group">
								{{ Form::hidden('patient_id', $patient->id) }}
								{{ Form::label('visit_type', trans("messages.visit-type")) }}
								{{ Form::select('visit_type', [' ' => '--- Select visit type ---','0' => trans("messages.out-patient"),'1' => trans("messages.in-patient")], null,
									 array('class' => 'form-control')) }}
							</div>
							<div class="form-group">
								{{ Form::label('physician', 'Test Requested By') }}
								{{Form::text('physician', Input::old('physician'), array('class' => 'form-control'))}}
								{{ Form::label('cadre', 'Cadre') }}
								{{Form::text('cadre', Input::old('cadre'), array('class' => 'form-control'))}}
								{{ Form::label('p_contact', 'Phone Contact') }}
								{{Form::text('p_contact', Input::old('p_contact'), array('class' => 'form-control'))}}
								{{ Form::label('email', 'E-mail') }}
								{{Form::email('email', Input::old('email'), array('class' => 'form-control'))}}
							</div>
							<div class="form-group">
								{{ Form::label('sample_date', 'Date of Sample Collection') }}
								{{Form::text('sample_date', Input::old('sample_date'), array('class' => 'form-control standard-datepicker'))}}
								{{ Form::label('sample_time', 'Time of Sample Collection') }}
								{{Form::text('sample_time', Input::old('sample_time'), array('class' => 'form-control'))}}
							</div>
							<div class="form-group">
								{{ Form::label('sample_obtainer', 'Sample Collected by') }}
								{{Form::text('sample_obtainer', Input::old('sample_obtainer'), array('class' => 'form-control'))}}
								{{ Form::label('cadre_obtainer', 'Cadre') }}
								{{Form::text('cadre_obtainer', Input::old('cadre_obtainer'), array('class' => 'form-control'))}}
							</div>
							<div class="form-group">
								{{ Form::label('sample_date', 'Date sample recieved in Lab') }}
								{{Form::text('sample_date', Input::old('sample_date'), array('class' => 'form-control standard-datepicker'))}}
								{{ Form::label('sample_time', 'Time Sample Recieved in Lab') }}
								{{Form::text('sample_time', Input::old('sample_time'), array('class' => 'form-control'))}}
							</div>
							<div class="form-group">
								{{ Form::label('sample_reciever', 'Sample Recieved by') }}
								{{Form::text('sample_reciever', Input::old('sample_reciever'), array('class' => 'form-control'))}}
								{{ Form::label('cadre_obtainer', 'Cadre') }}
								{{Form::text('cadre_obtainer', Input::old('cadre_obtainer'), array('class' => 'form-control'))}}
							</div>
							<div class="form-group">
								{{ Form::label('tests', trans("messages.select-tests")) }}
								<div class="form-pane">

									<table class="table table-striped table-hover table-condensed search-table">
									<thead>
										<tr>
											<th>{{ Lang::choice('messages.test',2) }}</th>
											<th>{{ trans('messages.actions') }}</th>
														
										</tr>
									</thead>
									<tbody>
									@foreach($testtypes as $key => $value)
										<tr>
											<td>{{ $value->name }}</td>
											<td><label  class="editor-active">
												<input type="checkbox" name="testtypes[]" value="{{ $value->id}}" />
												</label>
											</td>
										</tr>
									@endforeach
									</tbody>
						            </table>
				
								<div class="form-group actions-row">
								{{ Form::button("<span class='glyphicon glyphicon-save'></span> ".trans('messages.save-test'), 
									array('class' => 'btn btn-primary', 'onclick' => 'submit()', 'alt' => 'save_new_test')) }}
								</div>
						</div>
					</div>
				</div>

			{{ Form::close() }}
		</div>
	</div>
@stop	