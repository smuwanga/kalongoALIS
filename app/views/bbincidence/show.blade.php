<<<<<<< HEAD
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
=======
<!DOCTYPE html>
<html lang="en">
<head>
{{ HTML::style('css/bootstrap.min.css') }}
{{ HTML::style('css/bootstrap-theme.min.css') }}
<style type="text/css">
  #report_content table, #report_content th, #report_content td {
     /*border: 1px solid black;*/
     font-size:12px;
  }
  #report_content p{
    font-size:12px;
   }
</style>
</head>
    <body>

    <table width="100%" style="font-size:12px;">
        <thead>
            <tr>
                <td>{{ HTML::image(Config::get('kblis.organization-logo'),  Config::get('kblis.country') . trans('messages.court-of-arms'), array('width' => '90px')) }}</td>
                <td colspan="3" style="text-align:center;">
                    <strong><p> {{ strtoupper(Config::get('constants.FACILITY_NAME')) }}<br>
                    {{ strtoupper(Config::get('kblis.address-info')) }}</p>
                    <p>Biosaftey and Biosecurity Incidence Report<br>
                </td>
                <td>
                    {{ HTML::image(Config::get('kblis.organization-logo'),  Config::get('kblis.country') . trans('messages.court-of-arms'), array('width' => '90px')) }}
                </td>
            </tr>
        </thead>
    </table>


        <table class="table table-bordered">
          <tbody>
        <tr>
          <th>ID #</th>
          <td>{{ $bbincidence->serial_no }}</td>

          <th>Facility</th>
          <td>{{ $bbincidence->facility->code }} - {{ $bbincidence->facility->name }}</td>
        </tr>

        <tr>
          <th>Occurrence Date & Time</th>
          <td>{{ date('d M Y', strtotime($bbincidence->occurrence_date)) }} {{ $bbincidence->occurrence_time }}</td>

          <th>Description</th>
          <td>{{ $bbincidence->description }}</td>
        </tr>

        <tr>
          <th>Location</th>
          <td>{{ $bbincidence->lab_section }}</td>

          <th>First Aid / Immediate Actions</th>
          <td>{{ $bbincidence->firstaid }}</td>
        </tr>
>>>>>>> 670ba5a977bffc38a444b37a6d2c764bed9eea56

        <tr>
          <th>Nature of Incident/Occurrence</th>
          <td>
            @foreach ($bbincidence->bbnature as $nature)
              {{$nature->name}} ({{$nature->priority}}/{{$nature->class}})<br>
            @endforeach
<<<<<<< HEAD
          </div>

          <div class="col-sm-2"><strong>Completion Status</strong></div>
          <div class="col-sm-4">{{ $bbincidence->status }}</div>
        </div>
=======
          </td>

          <th>Completion Status</th>
          <td>{{ $bbincidence->status }}</td>
        </tr>
>>>>>>> 670ba5a977bffc38a444b37a6d2c764bed9eea56

          </tbody>
        </table>

<<<<<<< HEAD
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

          <div class="col-sm-2"><strong>Next Of Kin Email</strong></div>
          <div class="col-sm-4">{{ $bbincidence->nok_email }}</div>
        </div>

        <div class="row view-striped">
          <div class="col-sm-2"><strong>Next Of Kin Name</strong></div>
          <div class="col-sm-4">{{ $bbincidence->nok_name }}</div>

          <div class="col-sm-2"><strong>Next Of Kin Telephone</strong></div>
          <div class="col-sm-4">{{ $bbincidence->nok_telephone }}</div>
        </div>
=======
        <table class="table table-bordered">
          <tbody>

        <tr>
          <th>Victim ID</th>
          <td>{{ $bbincidence->personnel_id }}</td>

          <th>Gender</th>
          <td>{{ $bbincidence->personnel_gender }}</td>
        </tr>

        <tr>
          <th>Name</th>
          <td>{{ $bbincidence->personnel_surname }} {{ $bbincidence->personnel_othername }}</td>

          <th>DOB / Age</th>
          <td>{{ $bbincidence->personnel_dob }} / {{ $bbincidence->personnel_age }}</td>
        </tr>

        <tr>
          <th>Category</th>
          <td>{{ $bbincidence->personnel_category }}</td>

          <th>Telephone</th>
          <td>{{ $bbincidence->personnel_telephone }}</td>
        </tr>

        <tr>
          <th>Email</th>
          <td>{{ $bbincidence->personnel_email }}</td>

          <th>Next Of Kin Email</th>
          <td>{{ $bbincidence->nok_email }}</td>
        </tr>

        <tr>
          <th>Next Of Kin Name</th>
          <td>{{ $bbincidence->nok_name }}</td>

          <th>Next Of Kin Telephone</th>
          <td>{{ $bbincidence->nok_telephone }}</td>
        </tr>
          </tbody>
        </table>
>>>>>>> 670ba5a977bffc38a444b37a6d2c764bed9eea56



<<<<<<< HEAD
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
=======
        <table class="table table-bordered">
          <tbody>
        <tr>
          <th>Activity being performed</th>
          <td>{{ $bbincidence->task }}</td>

          <th>VHF Patient ULIN</th>
          <td>{{ $bbincidence->ulin }}</td>
        </tr>

        <tr>
          <th>Equipment Code</th>
          <td>{{ $bbincidence->equip_code }}</td>

          <th>Equipment Name</th>
          <td>{{ $bbincidence->equip_name }}</td>
        </tr>

        <tr>
          <th>Reporting Officer</th>
          <td>{{ $bbincidence->officer_fname }} {{ $bbincidence->officer_lname }}</td>

          <th>Designation</th>
          <td>{{ $bbincidence->officer_cadre }}</td>
        </tr>

        <tr>
          <th>Telephone</th>
          <td>{{ $bbincidence->officer_telephone }}</td>
          <td></td>
          <td></td>
        </tr>
          </tbody>
        </table>

>>>>>>> 670ba5a977bffc38a444b37a6d2c764bed9eea56


<<<<<<< HEAD
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
=======
        <table class="table table-bordered">
          <tbody>
        <tr>
          <th>Extent/Magnitude of injury</th>
          <td>{{ $bbincidence->extent }}</td>

          <th>Clinical Intervention</th>
          <td>{{ $bbincidence->intervention }}</td>
        </tr>

        <tr>
          <th>Date/Time of Intervention</th>
          <td>{{ $bbincidence->intervention_date }} {{ $bbincidence->intervention_time }}</td>

          <th>Intervention Followup</th>
          <td>{{ $bbincidence->intervention_followup }}</td>
        </tr>

        <tr>
          <th>Medical Officer</th>
          <td>{{ $bbincidence->mo_fname }} {{ $bbincidence->mo_lname }}</td>

          <th>Telephone</th>
          <td>{{ $bbincidence->mo_telephone }}</td>
        </tr>

        <tr>
          <th>Designation</th>
          <td>{{ $bbincidence->mo_designation }}</td>

          <th></th>
          <td></td>
        </tr>
          </tbody>
        </table>


<br>
<br>
<br>
<br>
<br>
<br>
<br>

        <table class="table table-bordered">
          <tbody>
        <tr>
          <th>Cause of Incident</th>
          <td>
            @foreach ($bbincidence->bbcause as $cause)
              {{$cause->causename}}<br>
            @endforeach
          </td>

          <th>Corrective Action</th>
          <td>
>>>>>>> 670ba5a977bffc38a444b37a6d2c764bed9eea56
            @foreach ($bbincidence->bbaction as $action)
              {{$action->actionname}}<br>
            @endforeach
        </tr>

<<<<<<< HEAD
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
=======
        <tr>
          <th>Referral Status</th>
          <td>{{ $bbincidence->referral_status }}</td>

          <th>Analysis Date/Time</th>
          <td>{{ $bbincidence->analysis_date }} {{ $bbincidence->analysis_time }}</td>
        </tr>

        <tr>
          <th>Bio-Safety Officer</th>
          <td>{{ $bbincidence->bo_fname }} {{ $bbincidence->bo_lname }}</td>

          <th>Telephone</th>
          <td>{{ $bbincidence->bo_telephone }}</td>
        </tr>

        <tr>
          <th>Designation</th>
          <td>{{ $bbincidence->bo_designation }}</td>

          <th></th>
          <td></td>
        </tr>
          </tbody>
        </table>
>>>>>>> 670ba5a977bffc38a444b37a6d2c764bed9eea56




<<<<<<< HEAD
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
=======
        <table class="table table-bordered">
          <tbody>
        <tr>
          <th>Investigation Findings</th>
          <td>{{ $bbincidence->findings }}</td>

          <th>Improvement Plan</th>
          <td>{{ $bbincidence->improvement_plan }}</td>
        </tr>

        <tr>
          <th>Response Date/Time</th>
          <td>{{ $bbincidence->response_date }} {{ $bbincidence->response_time }}</td>

          <th>BRM representative</th>
          <td>{{ $bbincidence->brm_fname }} {{ $bbincidence->brm_lname }}</td>
        </tr>

        <tr>
          <th>Designation</th>
          <td>{{ $bbincidence->brm_designation }}</td>

          <th>Telephone</th>
          <td>{{ $bbincidence->brm_telephone }}</td>
        </tr>
        <tr>
          <th colspan="4">**Record created by {{ $bbincidence->user->name }} at {{ $bbincidence->created_at }}</th>
        </tr>
          </tbody>
        </table>
>>>>>>> 670ba5a977bffc38a444b37a6d2c764bed9eea56



<<<<<<< HEAD

            </div>
        </div>
    </div>
@stop
=======


    </body>
</html>
>>>>>>> 670ba5a977bffc38a444b37a6d2c764bed9eea56
