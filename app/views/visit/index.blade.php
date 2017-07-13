@extends("layout")
@section("content")
    <div>
        <ol class="breadcrumb">
          <li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
          <li class="active">Lab Requests</li>
        </ol>
    </div>
    @if (Session::has('message'))
        <div class="alert alert-info">{{ trans(Session::get('message')) }}</div>
    @endif

    <div class="panel panel-primary tests-log">
        <div class="panel-heading ">
            <div class="container-fluid">
                <div class="row less-gutter">
                    <span class="glyphicon glyphicon-filter"></span>Lab Requests
                </div>
            </div>
        </div>
        <div class="panel-body">
            <table class="table table-striped table-hover table-condensed">
                <thead>
                    <tr>
                        <th>{{trans('messages.visit-number')}}</th>
                        <th>{{trans('messages.patient-number')}}</th>
                        <th>{{'ULIN'}}</th>
                        <th>{{trans('messages.patient-name')}}</th>
                        <th>{{trans('messages.visit-type')}}</th>
                        <th>{{trans('messages.test-request-status')}}</th>
                        <th>Request Status</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($visits as $key => $visit)
                    <tr>
                        <td>
                            {{ empty($visit->visit_number)?
                                $visit->id:
                                $visit->visit_number
                            }}</td><!--Visit Number -->
                        <td>{{ empty($visit->patient->external_patient_number)?
                                $visit->patient->patient_number:
                                $visit->patient->external_patient_number
                            }}</td> <!--Patient Number -->
                        <td>{{$visit->patient->ulin}}</td> <!--unhls terminology -->
                        <td>{{ $visit->patient->name.' ('.($visit->patient->getGender(true)).',
                            '.$visit->patient->getAge('Y'). ')'}}</td> <!--Patient Name -->
                        <td>{{ $visit->visit_type }}</td> <!--Visit Type -->
                        <td>

                        @if(Auth::user()->can('request_test'))
                        <a class="btn btn-sm btn-info" href="javascript:void(0)"
                            data-toggle="modal" data-target="#new-test-modal-unhls">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                            Add Test
                        </a>
                        @endif
                        
                        <!-- show the testtype (uses the show method found at GET /labrequest/{id} -->
                        <a class="btn btn-sm btn-success" href="{{ URL::to("labrequest/" . $visit->id) }}">
                            <span class="glyphicon glyphicon-eye-open"></span>
                            {{trans('messages.view')}}
                        </a>

                        <!-- edit this testtype (uses the edit method found at GET /labrequest/{id}/edit -->
                        <a class="btn btn-sm btn-info" href="{{ URL::to("labrequest/" . $visit->id . "/edit") }}" >
                            <span class="glyphicon glyphicon-edit"></span>
                            {{trans('messages.edit')}}
                        </a>
                        <!-- delete this testtype (uses the delete method found at GET /labrequest/{id}/delete -->
                        <button class="btn btn-sm btn-danger delete-item-link"
                            data-toggle="modal" data-target=".confirm-delete-modal" 
                            data-id='{{ URL::to("labrequest/" . $visit->id . "/delete") }}'>
                            <span class="glyphicon glyphicon-trash"></span>
                            {{trans('messages.delete')}}
                        </button>



                        </td><!-- ACTION BUTTONS -->

                        <td class='test-status'>
                            <!-- Test Statuses -->
                            <div class="container-fluid">
                            
                                <div class="row">

                                    <div class="col-md-12">
                                    </div>
                                </div>
    
                                <div class="row">
                                    <div class="col-md-12">
                                        <!-- Specimen statuses -->
                                        </div>
                                    </div>
                                </div>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
            
            {{ $visits->links() }}
        {{ Session::put('SOURCE_URL', URL::full()) }}
        {{ Session::put('TESTS_FILTER_INPUT', Input::except('_token')); }}
        
        </div>
    </div>

    <!-- OTHER UI COMPONENTS -->
    <div class="hidden pending-test-not-collected-specimen">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <span class='label label-info'>
                        {{trans('messages.pending')}}</span>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <span class='label label-default'>
                        {{trans('messages.specimen-not-collected-label')}}</span>                
                </div>
            </div>
        </div>
    </div> <!-- /. pending-test-not-collected-specimen -->

    <div class="hidden pending-test-accepted-specimen">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <span class='label label-info'>
                        {{trans('messages.pending')}}</span>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <span class='label label-success'>
                        {{trans('messages.specimen-accepted-label')}}</span>
                </div>
            </div>
        </div>
    </div> <!-- /. pending-test-accepted-specimen -->

    <div class="hidden started-test-accepted-specimen">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <span class='label label-warning'>
                        {{trans('messages.started')}}</span>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <span class='label label-success'>
                        {{trans('messages.specimen-accepted-label')}}</span>
                </div>
            </div>
        </div>
    </div> <!-- /. started-test-accepted-specimen -->

    <div class=" hidden collect-specimen-button">
        <a class="btn btn-sm btn-info collect-specimen" href="javascript:void(0)"
            title="{{trans('messages.collect-specimen-title')}}"
            data-url="{{ URL::route('unhls_test.collectSpecimen')}}">
            <span class="glyphicon glyphicon-ambulance"></span>
            {{trans('messages.collect-specimen')}}
        </a>
    </div><!-- /. colllect-specimen button -->

    <div class="hidden accept-button">
        <a class="btn btn-sm btn-info accept-specimen" href="javascript:void(0)"
            title="{{trans('messages.accept-specimen-title')}}"
            data-url="{{ URL::route('unhls_test.acceptSpecimen') }}">
            <span class="glyphicon glyphicon-thumbs-up"></span>
            {{trans('messages.accept-specimen')}}
        </a>
    </div> <!-- /. accept-button -->

    <div class="hidden reject-start-buttons">
        <a class="btn btn-sm btn-danger reject-specimen" href="#" title="{{trans('messages.reject-title')}}">
            <span class="glyphicon glyphicon-thumbs-down"></span>
            {{trans('messages.reject')}}</a>
        <a class="btn btn-sm btn-warning start-test" href="javascript:void(0)"
            data-url="{{ URL::route('unhls_test.start') }}" title="{{trans('messages.start-test-title')}}">
            <span class="glyphicon glyphicon-play"></span>
            {{trans('messages.start-test')}}</a>
    </div> <!-- /. reject-start-buttons -->

    <div class="hidden enter-result-buttons">
        <a class="btn btn-sm btn-info enter-result">
            <span class="glyphicon glyphicon-pencil"></span>
            {{trans('messages.enter-results')}}</a>
    </div> <!-- /. enter-result-buttons -->

    <div class="hidden start-refer-button">
        <a class="btn btn-sm btn-info refer-button" href="#">
            <span class="glyphicon glyphicon-edit"></span>
            {{trans('messages.refer-sample')}}
        </a>
    </div> <!-- /. referral-button -->
    <!-- Barcode begins -->
    
    <div id="count" style='display:none;'>0</div>
    <div id ="barcodeList" style="display:none;"></div>

    <!-- jQuery barcode script -->
    <script type="text/javascript" src="{{ asset('js/barcode.js') }} "></script>
@stop