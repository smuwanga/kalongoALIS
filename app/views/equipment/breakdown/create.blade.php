@extends("layout")
@section("content")
<div>
	<ol class="breadcrumb">
        <li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
        <li><a href="{{{URL::route('equipmentsupplier.index')}}}">{{trans('messages.equipment-breakdown-list')}}</a></li>
        <li class="active">{{ Lang::choice('messages.equipment-breakdown',2) }}</li>
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
		<span class="ion-gear-a"></span>
		{{ Lang::choice('messages.equipment-breakdown',2) }}
	</div>
	<div class="panel-body">

	
      {{ Form::open(array('url' => 'equipmentbreakdown/store', 'autocomplete' => 'off', 'class' => 'form-horizontal', 'data-toggle' => 'validator')) }}

                            <fieldset> 


                               
                                <div class="form-group">
                                {{  Form::label('equipment_id', 'Equipment', array('class'=>'control-label')) }}
                                  <div class="col-md-4">
                                        {{ Form::select('equipment_id', array(null => 'Select')+UNHLSEquipmentInventory::lists('name','id'), Input::old('equipment_id'), array('class' => 'form-control', 'id' => 'equipment_id', 'required'=>'required')) }}  
                                      
                                        @if ($errors->has('equipment_id'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('equipment_id') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>  

                                <div class="form-group">
                                {{  Form::label('breakdown_type', 'Type of breakdown', array('class'=>'control-label')) }}
                                  <div class="col-md-4">
                                        {{ Form::select('breakdown_type', array(null => 'Select')+ $breakdown_type, Input::old('supplier'), array('class' => 'form-control', 'id' => 'service_contract_id','required'=>'required')) }}  
                                      
                                        @if ($errors->has('breakdown_type'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('breakdown_type') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>  

                                <div class="form-group">
                                {{ Form::label('description_problem', 'Description of problem', ['class' => 'col-lg-2 control-label']) }}
                                  <div class="col-lg-7">
                                        {{ Form::textarea('description_problem',null,['class' => 'form-control','placeholder' => 'Description of problem', 'rows'=>'5','required' => 'required']) }}

                                        @if ($errors->has('description_problem'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('description_problem') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>


                                <div class="form-group">
                                {{ Form::label('action_taken', 'Actions taken', ['class' => 'col-lg-2 control-label']) }}
                                  <div class="col-lg-7">
                                        {{ Form::textarea('action_taken',null,['class' => 'form-control','placeholder' => 'Actions taken', 'rows'=>'5','required' => 'required']) }}

                                        @if ($errors->has('action_taken'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('action_taken') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>


                                <div class="form-group">
                                {{ Form::label('request_hsd', 'Request of HSD', ['class' => 'col-lg-2 control-label']) }}
                                  <div class="col-lg-7">
                                        {{ Form::textarea('request_hsd',null,['class' => 'form-control','placeholder' => 'Request of HSD', 'rows'=>'5','required' => 'required']) }}

                                        @if ($errors->has('request_hsd'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('request_hsd') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>        


                                <div class="form-group">
                                {{ Form::label('breakdown_date', 'Breakdown date', ['class' => 'col-md-2 control-label']) }}
                                  <div class="col-md-4">
                                        {{ Form::text('breakdown_date', Input::old('breakdown_date'),array('class' => 'form-control standard-datepicker','required'=>'required')) }}

                                        @if ($errors->has('breakdown_date'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('breakdown_date') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>

                                <div class="form-group">
                                {{ Form::label('reported_by', 'Reported by', ['class' => 'col-lg-2 control-label']) }}
                                  <div class="col-lg-7">
                                        {{ Form::text('reported_by',null,['class' => 'form-control','placeholder' => 'Reported by', 'required' => 'true']) }}

                                        @if ($errors->has('reported_by'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('reported_by') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>


                                <div class="form-group">
                                {{  Form::label('priority', 'Priority', array('class'=>'control-label')) }}
                                  <div class="col-md-4">
                                        {{ Form::select('priority', [''=>'Select','1'=>'High','2'=>'Moderate','3'=>'Low'], Input::old('priority'), array('class' => 'form-control', 'id' => 'priority', 'required'=>'required')) }}  
                                      
                                        @if ($errors->has('priority'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('priority') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>  



                                <div class="form-group">
                                {{  Form::label('in_charge', 'In - charge', array('class'=>'control-label')) }}
                                  <div class="col-md-4">
                                        {{ Form::select('in_charge', array('' => 'Select in charge') + UNHLSStaff::select(DB::raw('concat (firstName," ",lastName) as full_name,id'))->lists('full_name', 'id'), Input::old('in_charge'), array('class' => 'form-control', 'id' => 'in_charge', 'required'=>'required')) }}  
                                      
                                        @if ($errors->has('in_charge'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('in_charge') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>                                                       


                                <div class="form-group">
                                {{  Form::label('report_date', 'Date reported', array('class'=>'control-label col-lg-2')) }}
                                  <div class="col-lg-7">
                                        {{ Form::text('report_date', Input::old('report_date'), array('class' => 'form-control standard-datepicker', 'id' => 'report_date','required'=>'required')) }} 

                                      
                                        @if ($errors->has('report_date'))
                                            <span class="text-danger">
                                                <strong>{{ $errors->first('report_date') }}</strong>
                                            </span>
                                        @endif

                                  </div>
                                </div>                                                          

                                    <div class="form-group">
                                      <div class="col-lg-7 col-lg-offset-2">
                                        <a href="{{url('/equipmentbreakdown')}}" class="btn btn-default">Cancel</a>
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
<script>
$(".standard-datepicker").datepicker({
    maxDate: 0
});
</script>
@stop