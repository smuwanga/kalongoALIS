@extends("layout")
@section("content")
<div>
  <ol class="breadcrumb">
  <li><a href="{{{URL::route('user.home')}}}">{{ trans('messages.home') }}</a></li>
  <li><a href="{{ URL::route('event.index') }}">Events</a></li>
  <li class="active">Event Details</li>
  </ol>
</div>

<div class="panel panel-primary">
  <div class="panel-heading">
    <span class="glyphicon glyphicon-list"></span>Event Details
            
  <div class="panel-btn">
    <a class="btn btn-sm btn-info" href="{{ URL::route('event.show', array($previousevent)) }}" >
      <span class="glyphicon glyphicon-backward"></span> Previous
    </a>
        
    <a class="btn btn-sm btn-info" href="{{ URL::route('event.show', array($nextevent)) }}" >
      Next <span class="glyphicon glyphicon-forward"></span>
    </a>

    <a class="btn btn-sm btn-info" href="javascript:printSpecial('EVENT')">
      <span class="glyphicon glyphicon-print"></span> PRINT
    </a>
                
  </div>
  </div>
        
  <div class="panel-body">
  <div class="display-details">

  <div id="printReady">
            
    <div class="panel panel-info">
    <div class="panel-body">
                
        <div class="row view-striped">
          <div class="col-sm-1"><strong>ID #</strong></div>
          <div class="col-sm-2" style="color:red;"><strong>{{ $event->serial_no }}</strong></div>
          
          <div class="col-sm-2"><strong>Event</strong></div>
          <div class="col-sm-7">{{ $event->name }}</div>
        </div>
        
        <div class="row">
          <div class="col-sm-2"><strong>Department</strong></div>
          <div class="col-sm-4">{{ $event->department }}</div>
          
          <div class="col-sm-2"><strong>Type</strong></div>
          <div class="col-sm-4">{{ $event->type }}</div>
        </div>
    
    </div>
    </div>
        
        
    <div class="panel panel-info">
    <div class="panel-body">

    </div>
    </div>

  </div>
  </div>
  </div>
</div>
@stop