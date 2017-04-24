@extends("layout")
@section("content")
    <div>
        <ol class="breadcrumb">
          <li><a href="{{{URL::route('user.home')}}}">{{ trans('messages.home') }}</a></li>
          <li><a href="{{ URL::route('bbincidence.index') }}">BB Incidents</a></li>
          <li class="active">Facility Report</li>
        </ol>
    </div>
    <div class=''>
            {{ Form::open(array('route' => array('bbincidence.bbfacilityreport'), 'class'=>'form-inline',
                'role'=>'form', 'method'=>'GET')) }}
                <div class="form-group">
                    {{ Form::label('datefrom', "Date From") }}
                    {{ Form::text('datefrom', Input::get('datefrom'), array('class' => 'form-control test-search standard-datepicker', 'required' => 'required')) }}
                </div>
                <div class="form-group">                
                    {{ Form::label('dateto', "Date To") }}
                    {{ Form::text('dateto', Input::get('dateto'), array('class' => 'form-control test-search standard-datepicker', 'required' => 'required')) }}
                </div>
                <div class="form-group">
                    {{ Form::button("<span class='glyphicon glyphicon-search'></span> ".trans('messages.filter'), 
                        array('class' => 'btn btn-primary', 'type' => 'submit')) }}
                </div>
            {{ Form::close() }}
    </div>
    <br>
<div class="panel panel-primary">
    <div class="panel-heading">
        <span class="glyphicon glyphicon-stats"></span>
        Facility BB Incident Report 
        @if(isset($_GET['datefrom']) and isset($_GET['datefrom'])) 
        (Filtered) - {{$_GET['datefrom']}} to {{$_GET['dateto']}} 
        @else (Not Filtered) @endif
        <a class="btn btn-sm btn-info" href="javascript:printSpecial('Facility BB Incident Report')">
                            <span class="glyphicon glyphicon-print"></span> PRINT
        </a>
    </div>
    
    <div class="panel-body row"> <div id="printReady">
    
    <div class="display-details col-sm-6">
        <b>Facility Summary on Incidents</b><br>
        <table border='1'>
        @foreach($bbincidentnatureclasses as $key => $value)       
        <tr>
            <td>{{$value->class}}</td>
            <td><table border='1'>
               <?php $bbincidentnaturecount = Bbincidence::countbbincidentcategories($value->class); ?>
                @foreach($bbincidentnaturecount as $k => $v)
                <tr><td>{{$v->name}}</td><td>{{$v->total}}</td></tr>
                
                @endforeach
            </table></td>
         </tr>   
        
        @endforeach
        </table>           			
    </div>

    <div class="display-details col-sm-6">
        
        <div>
        <b>Summary on Facility Incident Management</b><br>
        <table border='1'>
        <tr><td colspan='2'><strong>Referral Status</strong></td></tr>
       @foreach($countbbincidentreferralstatus as $key => $value)       
        <tr><td>@if($value->referral_status=='') -- @else {{$value->referral_status}} @endif </td><td>{{$value->total}}</td></tr>   
        @endforeach
        <tr><td colspan='2'><strong>Completion Status</strong></td></tr>
        <?php $countbbincidentcompletionstatus = Bbincidence::countbbincidentcompletionstatus(); ?>
        @foreach($countbbincidentcompletionstatus as $key => $value)       
        <tr><td>{{$value->status}}</td><td>{{$value->total}}</td></tr>   
        @endforeach
        </table>
        </div>

        <br>

        <div>
        <b>Summary on Incident prevalence among Personnel and Other Facility Clients</b><br>
        <table border='1'>      
            <?php $bbincidentprevalencecount = Bbincidence::countbbincidentprevalence(); ?>
            @foreach($bbincidentprevalencecount as $k => $v)
            <tr><td>@if($v->personnel_category=='') -- @else {{$v->personnel_category}} @endif</td><td>{{$v->total}}</td></tr>              
            @endforeach
        </table>
        </div>

        <br>

        <div>
        <b>Summary on specific causes of Incidents</b><br>
        <table border='1'>      
            <?php $bbincidentcausecount = Bbincidence::countbbincidentcauses(); ?>
            @foreach($bbincidentcausecount as $k => $v)
            <tr><td>{{$v->causename}}</td><td>{{$v->total}}</td></tr>              
            @endforeach
        </table>
        </div>

        <br>

        <div>
        <b>Summary on Corrective Actions Taken to Manage Incident (depending on cause of incident)</b><br>
        <table border='1'>      
            <?php $bbincidentactioncount = Bbincidence::countbbincidentactions(); ?>
            @foreach($bbincidentactioncount as $k => $v)
            <tr><td>{{$v->actionname}}</td><td>{{$v->total}}</td></tr>              
            @endforeach
        </table>
        </div>



    </div></div>
    
    </div>

</div>
@stop