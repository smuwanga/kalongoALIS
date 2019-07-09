@extends("layout")
@section("content")


<div>
	<ol class="breadcrumb">
	  <li><a href="{{{URL::route('user.home')}}}">{{ trans('messages.home') }}</a></li>
	  <li class="active"><a href="{{ URL::route('reports.patient.index') }}">{{ Lang::choice('messages.report', 2) }}</a></li>
	  <li class="active">{{ trans('messages.turnaround-time') }}</li>
	</ol>
</div>
<div class="container-fluid">
	{{ Form::open(array('route' => array('reports.aggregate.tat'), 'id' => 'turnaround', 'class' => 'form-inline')) }}
	  	
		<table class='table table-borderless'>
			
		   <body>
		   	 <tr>
		    	<td width='16%' >
		    		
						
					
					<span>
						{{ Form::text('start', isset($input['start'])?$input['start']:date('Y-m-01'), 
					        array('class' => 'form-control standard-datepicker')) }}
				    </span>
		    	</td>
		    	<td width='16%' >
		    		
					<span>
					    {{ Form::text('end', isset($input['end'])?$input['end']:date('Y-m-d'), 
					        array('class' => 'form-control standard-datepicker')) }}
			        </span>
		    	</td>
		    	<td width='20%'>
		    		
					<span>
						{{ Form::select('section_id', array(''=>trans('messages.select-lab-section'))+$labSections, 
							    		Request::old('testCategory') ? Request::old('testCategory') : $testCategory, 
											array('class' => 'form-control', 'id' => 'section_id')) }}
				    </span>
		    	</td>
		    	<td width='20%'>
		    		
					<span>
					    {{ Form::select('test_type', array('' => trans('messages.select-test-type'))+$testTypes, 
							    		Request::old('testType') ? Request::old('testType') : $testType, 
											array('class' => 'form-control', 'id' => 'test_type')) }}
			        </span>
		    	</td>
		    	<td width='18%'>
		    		
					<span>
					    {{ Form::select('period', array('' => trans('messages.select-interval'), 'M'=>trans('messages.monthly'), 'W'=>trans('messages.weekly'), 'D'=>trans('messages.daily')),
					    	Request::old('interval') ? Request::old('interval') : $interval,  
							array('class' => 'form-control', 'id'=>'period')) }}
			        </span>
		    	</td>
		    	<td width='10%'>
			    {{ Form::button("<span class='glyphicon glyphicon-filter'></span> ".trans('messages.view'), 
			        array('class' => 'btn btn-info', 'id' => 'filter', 'type' => 'submit')) }}
		    
		    	</td>
		    </tr>
		   </body>
		</table>
	{{ Form::close() }}
</div>
<div class="panel panel-primary">
	<div class="panel-heading ">
		<span class="glyphicon glyphicon-user"></span>
		{{ trans('messages.turnaround-time') }}
	</div>
	<div class="panel-body">
		<!-- if there are filter errors, they will show here -->
		@if ($error)
			<div class="alert alert-info">{{ $error }}</div>
		@else
		<div id="trendsDiv">
			<?php $continue = 1; ?>
			@if(count($resultset)==0)
				<?php $continue = 0; ?>
				<table class="table-responsive">
					<tr>
						<td>{{ trans("messages.no-records-found") }}</td>
					</tr>
				</table>
			@endif
		</div>
		@endif
	</div>
</div>

@stop