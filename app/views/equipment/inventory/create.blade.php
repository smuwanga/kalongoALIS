@extends("layout")
@section("content")
<div>
	<ol class="breadcrumb">
        <li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
        <li><a href="{{{URL::route('equipmentsupplier.index')}}}">{{trans('messages.equipment-list')}}</a></li>
        <li class="active">{{ Lang::choice('messages.equipment',2) }}</li>
	</ol>

</div>
@if (Session::has('message'))
	<div class="alert alert-info">{{ trans(Session::get('message')) }}</div>
@endif
@if($errors->all())
                <div class="alert alert-danger">
                    {{ HTML::ul($errors->all()) }}
                </div>
@endif


<div class="panel panel-primary">
	<div class="panel-heading ">
		<span class="glyphicon glyphicon-plus"></span>
		{{ Lang::choice('messages.equipment',2) }}
	</div>
	<div class="panel-body">

	
      {{ Form::open(array('url' => 'equipmentsupplier/store', 'autocomplete' => 'off', 'class' => 'form-horizontal', 'data-toggle' => 'validator')) }}

                            <fieldset> 


                                <div class="form-group">
                                {{ Form::label('supplier_name', 'Name', ['class' => 'col-md-2 control-label']) }}
                                  <div class="col-md-3">
                                        {{ Form::text('supplier_name',null,['class' => 'form-control','placeholder' => 'Name', 'required' => 'true']) }}

                                        @if ($errors->has('supplier_name'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('supplier_name') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>

                                <div class="form-group">
                                {{ Form::label('model', 'Model', ['class' => 'col-md-2 control-label']) }}
                                  <div class="col-md-3">
                                        {{ Form::text('model',null,['class' => 'form-control','placeholder' => 'Model', 'required' => 'true']) }}

                                        @if ($errors->has('model'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('model') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>

                                <div class="form-group">
                                {{ Form::label('serial_number', 'Serial number', ['class' => 'col-md-2 control-label']) }}
                                  <div class="col-md-4">
                                        {{ Form::text('serial_number',null,['class' => 'form-control','placeholder' => 'Serial number', 'required' => 'true']) }}

                                        @if ($errors->has('serial_number'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('serial_number') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>

                                <div class="form-group">
                                {{  Form::label('service_contract', 'Location', array('class'=>'control-label')) }}
                                  <div class="col-md-4">
                                        {{ Form::select('service_contract', array(null => '')+ array('0' => 'Chemistry', '1' => 'Microbiology'), Input::old('service_contract'), array('class' => 'form-control', 'id' => 'service_contract_id')) }}  
                                      
                                        @if ($errors->has('life_time'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('life_time') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>  

                                <div class="form-group">
                                {{  Form::label('service_contract', 'Procurement type', array('class'=>'control-label')) }}
                                  <div class="col-md-4">
                                        {{ Form::select('service_contract', array(null => '')+ array('0' => 'Placement', '1' => 'Procured'), Input::old('service_contract'), array('class' => 'form-control', 'id' => 'service_contract_id')) }}  
                                      
                                        @if ($errors->has('life_time'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('life_time') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>  

                                <div class="form-group">
                                {{ Form::label('purchase_date', 'Purchase date', ['class' => 'col-md-2 control-label']) }}
                                  <div class="col-md-4">
                                        {{ Form::text('purchase_date', Input::old('purchase_date'),array('class' => 'form-control standard-datepicker','required'=>'required')) }}

                                        @if ($errors->has('purchase_date'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('purchase_date') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>


                                <div class="form-group">
                                {{ Form::label('delivery_date', 'Delivery date', ['class' => 'col-md-2 control-label']) }}
                                  <div class="col-md-4">
                                        {{ Form::text('delivery_date', Input::old('purchase_date'),array('class' => 'form-control standard-datepicker','required'=>'required')) }}

                                        @if ($errors->has('delivery_date'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('delivery_date') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>


                                <div class="form-group">
                                {{ Form::label('verification_date', 'Verification date', ['class' => 'col-md-2 control-label']) }}
                                  <div class="col-md-4">
                                        {{ Form::text('verification_date', Input::old('verification_date'),array('class' => 'form-control standard-datepicker','required'=>'required')) }}

                                        @if ($errors->has('verification_date'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('verification_date') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>


                                <div class="form-group">
                                {{ Form::label('installation_date', 'Installation date', ['class' => 'col-md-2 control-label']) }}
                                  <div class="col-md-4">
                                        {{ Form::text('installation_date', Input::old('installation_date'),array('class' => 'form-control standard-datepicker','required'=>'required')) }}

                                        @if ($errors->has('installation_date'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('installation_date') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>

                                <div class="form-group">
                                {{  Form::label('service_contract', 'Spare parts', array('class'=>'control-label')) }}
                                  <div class="col-md-4">
                                        {{ Form::select('service_contract', array(null => '')+ array('0' => 'Yes', '1' => 'No'), Input::old('service_contract'), array('class' => 'form-control', 'id' => 'service_contract_id')) }}  
                                      
                                        @if ($errors->has('life_time'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('life_time') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>                                  

                                <div class="form-group">
                                {{  Form::label('service_frequency', 'Warranty period', array('class'=>'control-label')) }}
                                  <div class="col-md-4">
                                        {{ Form::select('service_frequency', array(null => '')+ array('0' => '1 year', '1' => '2 years', '2' => '3 years', '4' => '4 years', '5' => '5 years'), Input::old('service_frequency'), array('class' => 'form-control', 'id' => 'service_frequency_id')) }}  
                                      
                                        @if ($errors->has('service_frequency'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('service_frequency') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div> 

                                <div class="form-group">
                                {{ Form::label('life_time', 'Lifetime', ['class' => 'col-md-2 control-label']) }}
                                  <div class="col-md-3">
                                        <div class="input-group">
                                            {{ Form::number('life_time',null,['class' => 'form-control','placeholder' => 'Lifetime', 'required' => 'true']) }}
                                              <span class="input-group-addon">Years</span>
                                        </div>


                                        @if ($errors->has('life_time'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('life_time') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>  

                                <div class="form-group">
                                {{  Form::label('service_frequency', 'Service frequency', array('class'=>'control-label')) }}
                                  <div class="col-md-4">
                                        {{ Form::select('service_frequency', array(null => '')+ array('0' => '3 months', '1' => '6 months', '2' => '9 months', '4' => '12 months'), Input::old('service_frequency'), array('class' => 'form-control', 'id' => 'service_frequency_id')) }}  
                                      
                                        @if ($errors->has('service_frequency'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('service_frequency') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div> 

                                <div class="form-group">
                                {{  Form::label('service_contract', 'Service Contract', array('class'=>'control-label')) }}
                                  <div class="col-md-4">
                                        {{ Form::select('service_contract', array(null => '')+ array('0' => 'Yes', '1' => 'No'), Input::old('service_contract'), array('class' => 'form-control', 'id' => 'service_contract_id')) }}  
                                      
                                        @if ($errors->has('life_time'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('life_time') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>  
                                                            

                                    <div class="form-group">
                                      <div class="col-lg-10 col-lg-offset-2">
                                        <a href="{{url('/equipmentsupplier')}}" class="btn btn-default">Cancel</a>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                      </div>
                                    </div>
                                </div>                                

                            </fieldset>
        
        {{ Form::close() }}

		<?php  
		Session::put('SOURCE_URL', URL::full());?>
	</div>
	
</div>
@stop