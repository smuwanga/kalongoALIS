@extends("layout")
@section("content")
    <div>
        <ol class="breadcrumb">
          <li><a href="{{{URL::route('user.home')}}}">{{ trans('messages.home') }}</a></li>
          <li><a href="{{ URL::route('bbincidence.index') }}">BB Incidences</a></li>
          <li class="active">Facility Report</li>
        </ol>
    </div>
<div class="panel panel-primary">
    <div class="panel-heading">
        <span class="glyphicon glyphicon-stats"></span>
        Facility BB Incidence Report
    </div>
    <div class="panel-body">
    <div class="display-details">
        <strong>Facility Summary on Incidents </strong> (still work in progress)<br>
        <table>
        @foreach($bbincidentnatureclasses as $key => $value)


        
        <tr>
            <td>{{$value->class}}</td>
            <td>{{$value->total}}</td>
         </tr>   
        
        @endforeach
        </table>
            

				
    </div>
    </div>
</div>
@stop