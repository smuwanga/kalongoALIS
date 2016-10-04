@extends("layout")
@section("content")
<div>
	<ol class="breadcrumb">
        <li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
        <li><a href="{{{URL::route('stockcard.index')}}}">{{trans('messages.stock-list')}}</a></li>
        <li class="active">{{ Lang::choice('messages.stock-card',2) }}</li>
        <span class="label label-info pull-right"> {{ $card_action }} </span>
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

<div class="row">
<div class="col-md-12">
<div class="table-responsive">
  <table class="table table-striped">
            <thead>
                <tr>                
                    <th>District</th>
                    <th>Facility</th>
                    <th>Financial Year</th>
                    <th>Item</th>                 
                    <th>Unit of Issue</th>          
                    <th>Max Stock</th>    
                    <th>Min Stock</th>                                     
                </tr>
            </thead>
            <tbody>
            <tr>
                <td>{{ \Config::get('constants.DISTRICT_NAME') }}</td>
                <td>{{ \Config::get('constants.FACILITY_NAME') }}</td>
                <td>{{ \Config::get('constants.FIN_YEAR_NAME') }}</td>
                <td>{{ $item->name }} ({{ $item->description }})</td>
                <td>{{ $item->metric->description }}</td>
                <td>{{ $item->max_level }}</td>
                <td>{{ $item->min_level }}</td>
            </tr>
                
            </tbody>
  </table>
</div>
</div>
</div>



<div class="panel panel-primary">
	<div class="panel-heading ">
		<span class="glyphicon glyphicon-user"></span>
		{{ Lang::choice('messages.stock-card',2) }}
	</div>
	<div class="panel-body">

	
      {{ Form::open(array('url' => 'stockcard/store', 'data-toggle' => 'validator')) }}

        <div class="col-md-12">            
            <div class="form-group">
                {{ Form::label('to_from', $source_destination_label, array('class'=>'control-label')) }}
                {{ Form::select('to_from', array(null => '')+ $source_destination_list,
                        Input::old('to_from'), array('class' => 'form-control', 'id' => 'to_from_id')) }}             
            </div>

            <div class="form-group">
                <label for="voucher_no" class="control-label">Voucher number</label>
                {{ Form::text('voucher_no', Input::old('voucher_no'), array('class' => 'form-control','required'=>'required')) }}
            </div>

            <div class="form-group" id="quantity_in_div">
                <label for="quantity_in" class="control-label">Quantity in</label>
                {{ Form::text('quantity_in', Input::old('quantity_in'), array('class' => 'form-control', 'id'=>'quantity_in')) }}
            </div>

            <div class="form-group" id="quantity_out_div">
                <label for="quantity_out" class="control-label">Quantity out</label>
                {{ Form::text('quantity_out', Input::old('quantity_out'), array('class' => 'form-control','id'=>'quantity_out')) }}
            </div>
            <div class="form-group" id="losses_adjustments_div">
                <label for="losses_adjustments" class="control-label">Losses / Adjustments</label>
                {{ Form::text('losses_adjustments', Input::old('losses_adjustments'), array('class' => 'form-control','id'=>'losses_adjustments')) }}
            </div>

            <div class="form-group">
                {{ Form::label('balance_on_hand', 'Balance on Hand') }}                
                {{ Form::text('balance_on_hand', $balance_on_hand, array('class' => 'form-control text-right','readonly'=>'readonly')) }} 
            </div>
            
            <div class="form-group">
                <label for="batch_no" class="control-label">Batch number</label>
                {{ Form::text('batch_no', Input::old('batch_no'), array('class' => 'form-control','required'=>'required')) }}
            </div>

            <div class="form-group">
                <label for="expiry_date" class="control-label">Expiry date</label>
                {{ Form::text('expiry_date', Input::old('expiry_date'),array('class' => 'form-control standard-datepicker','required'=>'required')) }}
            </div>

            <div class="form-group" id="remarks_div">
                <label for="remarks" class="control-label">Remarks</label>
                {{ Form::textarea('remarks', Input::old('remarks'), array('class' => 'form-control', 'cols' => '4', 'rows'=>'2','id'=>'remarks')) }}
            </div>

            <div class="form-group">
                <label for="initials" class="control-label">Initials</label>
                {{ Form::text('initials', Input::old('initials'), array('class' => 'form-control','required'=>'required')) }}
            </div>  


            <div class="form-group">
                {{ Form::label('action', 'Action',array('class'=>'hidden')) }}
                {{ Form::hidden('action', Session::get('action'),Input::old('action'), array('class' => 'form-control')) }}
            </div>   

            <div class="form-group">
                {{ Form::label('redirect', 'Redirect',array('class'=>'hidden')) }}
                {{ Form::hidden('redirect', 1 ,Input::old('redirect'), array('class' => 'form-control')) }}
            </div>  

            <div class="form-group actions-row">
                    {{ Form::button("<span class='glyphicon glyphicon-save'></span> ".trans('messages.save'), 
                        array('class' => 'btn btn-primary', 'type' => 'submit()')) }}
            </div>
        </div>
        
        {{ Form::close() }}

		<?php  
		Session::put('SOURCE_URL', URL::full());?>
	</div>
	
</div>
@stop