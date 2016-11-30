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
      
      <div class="row  view-striped">
        <div class="col-sm-1"><strong>Department</strong></div>
        <div class="col-sm-3">{{ $event->department }}</div>
        
        <div class="col-sm-1"><strong>Type</strong></div>
        <div class="col-sm-3">{{ $event->type }}</div>

        <div class="col-sm-1"><strong>Duration</strong></div>
        <div class="col-sm-3">{{ date('d M Y', strtotime($event->start_date)) }} 
          to {{ date('d M Y', strtotime($event->end_date)) }}</div>
      </div>

      <div class="row view-striped">
        <div class="col-sm-2"><strong>Location</strong></div>
        <div class="col-sm-4" style="">{{ $event->location }}</div>
        
        <div class="col-sm-2"><strong>Premise</strong></div>
        <div class="col-sm-4">{{ $event->premise }}</div>
      </div>

      <div class="row view-striped">
        <div class="col-sm-2"><strong>Health Region</strong></div>
        <div class="col-sm-4" style="">{{ $event->region }}</div>
        
        <div class="col-sm-2"><strong>District</strong></div>
        <div class="col-sm-4">
          @if ($event->district)
          {{ $event->district->name }}
          @endif
        </div>
      </div>

      <div class="row view-striped">
        <div class="col-sm-2"><strong>Sponsor</strong></div>
        <div class="col-sm-4" style="">{{ $event->sponsor }}</div>
        
        <div class="col-sm-2"><strong>Organiser</strong></div>
        <div class="col-sm-4">{{ $event->organiser }}</div>
      </div>

      <div class="row view-striped">
        <div class="col-sm-2"><strong>Target Audience</strong></div>
        <div class="col-sm-4" style="">{{ $event->audience }}</div>
        
        <div class="col-sm-2"><strong>Participants</strong></div>
        <div class="col-sm-4">{{ $event->participants_no }}</div>
      </div>

      <div class="row view-striped">
        <div class="col-sm-6"><strong>Objectives</strong><br>
          <ul>
          @foreach ($event->objective as $objective)
          <li>{{$objective->objective}}</li>
          @endforeach
          </ul>

        </div>

        <div class="col-sm-6"><strong>Lessons Learned</strong><br>
          <ul>
          @foreach ($event->lesson as $lesson)
          <li>{{$lesson->lesson}}</li>
          @endforeach
          </ul>

        </div>
      </div>

      <div class="row view-striped">
        <div class="col-sm-6"><strong>Recommendations</strong><br>
          <ul>
          @foreach ($event->recommendation as $recommendation)
          <li>{{$recommendation->recommendation}}</li>
          @endforeach
          </ul>

        </div>

        <div class="col-sm-6"><strong>Action Points</strong><br>
          <ul>
          @foreach ($event->action as $action)
          <li>{{$action->action}}</li>
          @endforeach
          </ul>

        </div>
      </div>

      <div class="row view-striped">
        <div class="col-sm-2"><strong>Event Report</strong></div>
        <div class="col-sm-4" style="">
          @if ($event->report_filename)
          <a href="{{ URL::to( 'attachments/' . $event->report_filename) }}"
            target="_blank">{{ $event->report_filename }}</a>
          @else
          Pending
          @endif
        </div>
        
        <div class="col-sm-2"><strong></strong></div>
        <div class="col-sm-4"></div>
      </div>
    
    </div>
    </div>

  </div>
  </div>
  </div>
</div>
@stop