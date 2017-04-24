@extends("layout")
@section("content")
    <div>
        <ol class="breadcrumb">
          <li><a href="{{{URL::route('user.home')}}}">{{ trans('messages.home') }}</a></li>
          <li><a href="{{ URL::route('bbincidence.index') }}">BB Incidents</a></li>
          <li class="active">BB Incident Details</li>
        </ol>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <span class="glyphicon glyphicon-user"></span>
            BB Incident Details
            <div class="panel-btn">
        <a class="btn btn-sm btn-info" href="{{ URL::route('bbincidence.show', array($previousbbincidence)) }}" >
              <span class="glyphicon glyphicon-backward"></span> Previous
        </a>
        
        <a class="btn btn-sm btn-info" href="{{ URL::route('bbincidence.show', array($nextbbincidence)) }}" >
              Next <span class="glyphicon glyphicon-forward"></span>
        </a>

        <a class="btn btn-sm btn-info" href="javascript:printSpecial('BIOSAFETY AND BIOSECURITY INCIDENT REPORT')">
              <span class="glyphicon glyphicon-print"></span> PRINT
        </a>
                
            </div>
        </div>
        <div class="panel-body">
            <div class="display-details">

            <div id="printReady">
            <div class="panel panel-info">
      <!--<div class="panel-heading"><strong>Bio-safety and Bio-security Incident/Occurrence Details (<i>to be completed by the person affected or his/her supervisor</i>)</strong></div>
      --><div class="panel-body">
                
        <div class="row view-striped">
          <div class="col-sm-2"><strong>ID #</strong></div>
          <div class="col-sm-4" style="color:red;"><strong>{{ $bbincidence->serial_no }}</strong></div>
          
          <div class="col-sm-2"><strong>Facility</strong></div>
          <div class="col-sm-4">{{ $bbincidence->facility->code }} - {{ $bbincidence->facility->name }}</div>
        </div>
        
        <div class="row">
          <div class="col-sm-2"><strong>Occurrence Time</strong></div>
          <div class="col-sm-4">{{ date('d M Y', strtotime($bbincidence->occurrence_date)) }} {{ $bbincidence->occurrence_time }}</div>
          
          <div class="col-sm-2"><strong>Description</strong></div>
          <div class="col-sm-4">{{ $bbincidence->description }}</div>
        </div>
        
        <div class="row view-striped">
          <div class="col-sm-2"><strong>Location</strong></div>
          <div class="col-sm-4">{{ $bbincidence->lab_section }}</div>
          
          <div class="col-sm-2"><strong>First Aid / Immediate Actions</strong></div>
          <div class="col-sm-4">{{ $bbincidence->firstaid }}</div>
        </div>

        <div class="row">
          <div class="col-sm-2"><strong>Nature of Incident/Occurrence</strong></div>
          <div class="col-sm-4">
            @foreach ($bbincidence->bbnature as $nature)
              {{$nature->name}} ({{$nature->priority}}/{{$nature->class}})<br>
            @endforeach
          </div>
      
          <div class="col-sm-2"><strong>Completion Status</strong></div>
          <div class="col-sm-4">{{ $bbincidence->status }}</div>
        </div>

        <div class="row">
          <div class="col-sm-12" style="text-align:left;"><b>**Record created by {{ $bbincidence->user->name }} at {{ $bbincidence->created_at }}</b></div>
        </div>

      </div>
      </div>
        
        
      <div class="panel panel-info"> <!-- Victim Details -->
      <!--<div class="panel-heading"><strong>Victim Details (<i>to be completed by the person affected or his/her supervisor</i>)</strong></div>
      --><div class="panel-body"> 
        
        <div class="row view-striped">
          <div class="col-sm-2"><strong>Victim ID</strong></div>
          <div class="col-sm-4">{{ $bbincidence->personnel_id }}</div>
          
          <div class="col-sm-2"><strong>Gender</strong></div>
          <div class="col-sm-4">{{ $bbincidence->personnel_gender }}</div>
        </div>

        <div class="row">
          <div class="col-sm-2"><strong>Name</strong></div>
          <div class="col-sm-4">{{ $bbincidence->personnel_surname }} {{ $bbincidence->personnel_othername }}</div>
          
          <div class="col-sm-2"><strong>DOB / Age</strong></div>
          <div class="col-sm-4">{{ $bbincidence->personnel_dob }} / {{ $bbincidence->personnel_age }}</div>
        </div>

        <div class="row view-striped">
          <div class="col-sm-2"><strong>Category</strong></div>
          <div class="col-sm-4">{{ $bbincidence->personnel_category }}</div>
          
          <div class="col-sm-2"><strong>Telephone</strong></div>
          <div class="col-sm-4">{{ $bbincidence->personnel_telephone }}</div>
        </div>

        <div class="row">
          <div class="col-sm-2"><strong>Email</strong></div>
          <div class="col-sm-4">{{ $bbincidence->personnel_email }}</div>
          
          <div class="col-sm-2"><strong>NOK Email (Next of Kin)</strong></div>
          <div class="col-sm-4">{{ $bbincidence->nok_email }}</div>
        </div>

        <div class="row view-striped">
          <div class="col-sm-2"><strong>NOK Name</strong></div>
          <div class="col-sm-4">{{ $bbincidence->nok_name }}</div>
          
          <div class="col-sm-2"><strong>NOK Telephone</strong></div>
          <div class="col-sm-4">{{ $bbincidence->nok_telephone }}</div>
        </div>

      </div>
      </div>

      <div class="panel panel-info"> <!-- Extra details about the Incident -->
      <!--<div class="panel-heading"><strong>Extra details about the Incident (<i>to be completed by the person affected or his/her supervisor</i>)</strong></div>
      --><div class="panel-body">

        <div class="row">
          <div class="col-sm-2"><strong>Activity being performed</strong></div>
          <div class="col-sm-4">{{ $bbincidence->task }}</div>
          
          <div class="col-sm-2"><strong>VHF Patient ULIN</strong></div>
          <div class="col-sm-4">{{ $bbincidence->ulin }}</div>
        </div>

        <div class="row view-striped">
          <div class="col-sm-2"><strong>Equipment Code</strong></div>
          <div class="col-sm-4">{{ $bbincidence->equip_code }}</div>
          
          <div class="col-sm-2"><strong>Equipment Name</strong></div>
          <div class="col-sm-4">{{ $bbincidence->equip_name }}</div>
        </div>

        <div class="row">
          <div class="col-sm-2"><strong>Reporting Officer</strong></div>
          <div class="col-sm-4">{{ $bbincidence->officer_fname }} {{ $bbincidence->officer_lname }}</div>
          
          <div class="col-sm-2"><strong>Designation</strong></div>
          <div class="col-sm-4">{{ $bbincidence->officer_cadre }}</div>
        </div>

        <div class="row view-striped">
          <div class="col-sm-2"><strong>Telephone</strong></div>
          <div class="col-sm-4">{{ $bbincidence->officer_telephone }}</div> 
        </div>
      
      </div>
      </div>

      <div class="panel panel-info"> <!-- Clinical Intervention -->
      <!--<div class="panel-heading col-sm-12"><strong>Clinical Intervention if applicable (<i>to be filled by the clinician</i>)</strong></div>
      --><div class="panel-body">

        <div class="row">
          <div class="col-sm-2"><strong>Extent/Magnitude of injury</strong></div>
          <div class="col-sm-4">{{ $bbincidence->extent }}</div>
          
          <div class="col-sm-2"><strong>Clinical Intervention</strong></div>
          <div class="col-sm-4">{{ $bbincidence->intervention }}</div>
        </div>

        <div class="row view-striped">
          <div class="col-sm-2"><strong>Date/Time of Intervention</strong></div>
          <div class="col-sm-4">{{ $bbincidence->intervention_date }} {{ $bbincidence->intervention_time }}</div>
          
          <div class="col-sm-2"><strong>Intervention Followup</strong></div>
          <div class="col-sm-4">{{ $bbincidence->intervention_followup }}</div>
        </div>

        <div class="row">
          <div class="col-sm-2"><strong>Medical Officer</strong></div>
          <div class="col-sm-4">{{ $bbincidence->mo_fname }} {{ $bbincidence->mo_lname }}</div>
          
          <div class="col-sm-2"><strong>Telephone</strong></div>
          <div class="col-sm-4">{{ $bbincidence->mo_telephone }}</div>
        </div>

        <div class="row view-striped">
          <div class="col-sm-2"><strong>Designation</strong></div>
          <div class="col-sm-4">{{ $bbincidence->mo_designation }}</div>
          
          <div class="col-sm-2"><strong></strong></div>
          <div class="col-sm-4"></div>
        </div>

      </div>
      </div>

      
      <div class="panel panel-info"> <!-- Incident Analysis -->
      <!--<div class="panel-heading"><strong>Incident Analysis (<i>to be completed by facility bio-safety officer</i>)</strong></div>
      --><div class="panel-body"> 

        <div class="row">
          <div class="col-sm-2"><strong>Cause of Incident</strong></div>
          <div class="col-sm-4">
            @foreach ($bbincidence->bbcause as $cause)
              {{$cause->causename}}<br>
            @endforeach
          </div>
          
          <div class="col-sm-2"><strong>Corrective Action</strong></div>
          <div class="col-sm-4">
            @foreach ($bbincidence->bbaction as $action)
              {{$action->actionname}}<br>
            @endforeach
          </div>
        </div>

        <div class="row view-striped">
          <div class="col-sm-2"><strong>Referral Status</strong></div>
          <div class="col-sm-4">{{ $bbincidence->referral_status }}</div>
          
          <div class="col-sm-2"><strong>Analysis Date/Time</strong></div>
          <div class="col-sm-4">{{ $bbincidence->analysis_date }} {{ $bbincidence->analysis_time }}</div>
        </div>

        <div class="row">
          <div class="col-sm-2"><strong>Bio-Safety Officer</strong></div>
          <div class="col-sm-4">{{ $bbincidence->bo_fname }} {{ $bbincidence->bo_lname }}</div>
          
          <div class="col-sm-2"><strong>Telephone</strong></div>
          <div class="col-sm-4">{{ $bbincidence->bo_telephone }}</div>
        </div>

        <div class="row view-striped">
          <div class="col-sm-2"><strong>Designation</strong></div>
          <div class="col-sm-4">{{ $bbincidence->bo_designation }}</div>
          
          <div class="col-sm-2"><strong></strong></div>
          <div class="col-sm-4"></div>
        </div>

      </div>
      </div>


      <div class="panel panel-info"> <!-- Major Incident Response -->
      <!--<div class="panel-heading"><strong>Major Incident Response (<i>to be filled by National Bio Risk Management Office</i>)</strong></div>
      --><div class="panel-body">

        <div class="row">
          <div class="col-sm-2"><strong>Investigation Findings</strong></div>
          <div class="col-sm-4">{{ $bbincidence->findings }}</div>
          
          <div class="col-sm-2"><strong>Improvement Plan</strong></div>
          <div class="col-sm-4">{{ $bbincidence->improvement_plan }}</div>
        </div>

        <div class="row view-striped">
          <div class="col-sm-2"><strong>Response Date/Time</strong></div>
          <div class="col-sm-4">{{ $bbincidence->response_date }} {{ $bbincidence->response_time }}</div>
          
          <div class="col-sm-2"><strong>BRM representative</strong></div>
          <div class="col-sm-4">{{ $bbincidence->brm_fname }} {{ $bbincidence->brm_lname }}</div>
        </div>

        <div class="row">
          <div class="col-sm-2"><strong>Designation</strong></div>
          <div class="col-sm-4">{{ $bbincidence->brm_designation }}</div>
          
          <div class="col-sm-2"><strong>Telephone</strong></div>
          <div class="col-sm-4">{{ $bbincidence->brm_telephone }}</div>
        </div>

      </div>
      </div>

      </div>

        
            </div>
        </div>
    </div>
@stop