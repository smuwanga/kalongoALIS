@extends("layout")
@section("content")
    <div>
        <ol class="breadcrumb">
          <li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
          <li class="active">{{ Lang::choice('messages.test',2) }}</li>
        </ol>
    </div>
    @if (Session::has('message'))
        <div class="alert alert-info">{{ trans(Session::get('message')) }}</div>
    @endif

    <div class='container-fluid'>
        {{ Form::open(array('route' => array('unhls_test.index'))) }}
            <div class='row'>
                <div class='col-md-2'>
                    <div class='col-md-2'>
                        {{ Form::label('date_from', trans('messages.from')) }}
                    </div>
                    <div class='col-md-10'>
                        {{ Form::text('date_from', $dateFrom,
                            array('class' => 'form-control standard-datepicker')) }}
                    </div>
                </div>
                <div class='col-md-2'>
                    <div class='col-md-2'>
                        {{ Form::label('date_to', trans('messages.to')) }}
                    </div>
                    <div class='col-md-10'>
                        {{ Form::text('date_to', $dateTo,
                            array('class' => 'form-control standard-datepicker')) }}
                    </div>
                </div>
                <div class='col-md-2'>
                    <div class='col-md-5'>
                        {{ Form::label('test_status', trans('messages.test-status')) }}
                    </div>
                    <div class='col-md-7'>
                        {{ Form::select('test_status', $testStatus,
                            Input::get('test_status'), array('class' => 'form-control')) }}
                    </div>
                </div>
                <div class='col-md-3'>
                    <div class='col-md-5'>
                        {{ Form::label('test_category', trans('messages.list-test-categories')) }}
                    </div>
                    <div class='col-md-7'>
                        {{ Form::select('test_category', $testCategories,
                            Input::get('test_category'), array('class' => 'form-control','id'=> $selectedTestCategoryId)) }}
                    </div>
                </div>
                
                <div class='col-md-2'>
                        {{ Form::label('search', trans('messages.search'), array('class' => 'sr-only')) }}
                        {{ Form::text('search', Input::get('search'),
                            array('class' => 'form-control', 'placeholder' => 'Search')) }}
                </div>
                <div class='col-md-1'>
                        {{ Form::submit(trans('messages.search'), array('class'=>'btn btn-primary')) }}
                </div>
            </div>
        {{ Form::close() }}
    </div>

    <br>

    <div class="panel panel-primary tests-log">
        <div class="panel-heading ">
            <div class="container-fluid">
                <div class="row less-gutter">
                    <div class="col-md-11">
                        <span class="glyphicon glyphicon-filter"></span>{{trans('messages.list-tests')}}
                        @if(Auth::user()->can('request_test'))
                        <div class="panel-btn">
                            <a class="btn btn-sm btn-info" href="javascript:void(0)"
                                data-toggle="modal" data-target="#new-test-modal-unhls">
                                <span class="glyphicon glyphicon-plus-sign"></span>
                                {{trans('messages.new-test')}}
                            </a>
                        </div>
                        @endif
                    </div>
                    <div class="col-md-1">
                        <a class="btn btn-sm btn-primary pull-right" href="#" onclick="window.history.back();return false;"
                            alt="{{trans('messages.back')}}" title="{{trans('messages.back')}}">
                            <span class="glyphicon glyphicon-backward"></span></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <table id="visits_table" class="row-border hover table table-bordered table-condensed table-striped">

                <thead>
                    <tr>
                        <th>{{trans('messages.date-ordered')}}</th>
                        <th>{{trans('messages.patient-number')}}</th>
                        <th>Lab Number</th>
                        <th class="col-md-2">{{trans('messages.patient-name')}}</th>
                        <th class="col-md-1">{{trans('messages.visit-lab-number')}}</th>
                        <!--location: where test is comping from, e.g. ICU, Emergency, OPD, ... -->
                        <th>Unit </th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($visitSet as $key => $visit)
                    <!-- todo: revise:for now excluding tests without specimens -->
                   
                    <tr>
                        <td>{{ date('d-m-Y H:i', strtotime($visit->created_at));}}</td>  <!--Date Ordered-->
                        <td>{{ empty($visit->external_patient_number)?
                                $visit->patient_number:
                                $visit->external_patient_number
                            }}</td> <!--Patient Number -->

                        <td>{{$visit->ulin}}</td> <!--unhls terminology -->
                        <!-- issue: this is confusing people as they may mistake it as ULIN -->
                        
                        
                        <!--Visit Number -->
                        <td>{{ $visit->name}}</td> <!--Patient Name -->
                        <td>{{ $visit->visit_lab_number}}</td> <!--Visit Lab Number: the number issued each time this patient walks into the lab-->
                        
                        <!--location: where test is comping from, e.g. ICU, Emergency, OPD, ... -->
                        <td>{{ empty($visit->ward)? 'N/A' :$visit->ward}}</td>
                        
                        <!-- ACTION BUTTONS -->
                        <td>
                            <a class="btn btn-sm btn-success"
                                href="{{ URL::route('unhls_test.list_tests_in_visit', $visit->id) }}"
                                id="view-visit-details-{{$visit->id}}-link"
                                title="{{trans('messages.visit-test-details')}}">
                                <span class="glyphicon glyphicon-eye-open"></span>
                                {{trans('messages.visit-test-details')}}
                                
                            </a>
                            
                            <br>
                            @if(Auth::user()->can('edit_test'))
                                <a class="btn btn-sm btn-info"
                                    href="{{ URL::route('unhls_test.viewDetails', $visit->id) }}"
                                    id="view-visit-details-{{$visit->id}}-link"
                                    title="Edit">
                                    <span class="glyphicon glyphicon-edit">
                                        
                                    </span>
                                    Edit Test(s)
                                    
                                </a>
                            @endIf
                            
                        </td>

                        
                    </tr>
                    
                @endforeach
                </tbody>
            </table>
        

        </div>
    </div>

    <!-- MODALS -->
    <div class="modal fade" id="new-test-modal-unhls">
      <div class="modal-dialog">
        <div class="modal-content">
        {{ Form::open(array('route' => 'create_test')) }}
          <input type="hidden" id="patient_id" name="patient_id" value="0" />
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
                <span aria-hidden="true">&times;</span>
                <span class="sr-only">{{trans('messages.close')}}</span>
            </button>
            <h4 class="modal-title">{{trans('messages.create-new-test')}}</h4>
          </div>
          <div class="modal-body">
            <h4>{{ trans('messages.first-select-patient') }}</h4>
            <div class="row">
              <div class="col-lg-12">
                <div class="input-group">
                  <input type="text" class="form-control search-text"
                    placeholder="{{ trans('messages.search-patient-placeholder') }}">
                  <span class="input-group-btn">
                    <button class="btn btn-default search-patient" type="button">
                        {{ trans('messages.patient-search-button') }}</button>
                  </span>
                </div><!-- /input-group -->
                <div class="patient-search-result form-group">
                    <table class="table table-condensed table-striped table-bordered table-hover hide">
                      <thead>
                        <th> </th>
                        <th>{{ trans('messages.patient-id') }}</th>
                        <th>{{ Lang::choice('messages.name',2) }}</th>
                      </thead>
                      <tbody>
                      </tbody>
                    </table>
                </div>
              </div><!-- /.col-lg-12 -->
            </div><!-- /.row -->          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">
                {{trans('messages.close')}}</button>
            <button type="button" class="btn btn-primary next" onclick="submit();" disabled>
                {{trans('messages.next')}}</button>
          </div>
        {{ Form::close() }}
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <div class="modal fade" id="accept-specimen-modal">
      <div class="modal-dialog">
        <div class="modal-content">
        {{ Form::open(array('route' => 'unhls_test.acceptSpecimen')) }}
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
                <span aria-hidden="true">&times;</span>
                <span class="sr-only">{{trans('messages.close')}}</span>
            </button>
            <h4 class="modal-title">
                <span class="glyphicon glyphicon-ok-circle"></span>
                {{trans('messages.accept-specimen-title')}}</h4>
          </div>
          <div class="modal-body">
          </div>
          <div class="modal-footer">
            {{ Form::button("<span class='glyphicon glyphicon-save'></span> ".trans('messages.submit'),
                array('class' => 'btn btn-primary', 'data-dismiss' => 'modal', 'onclick' => 'submit()')) }}
            <button type="button" class="btn btn-default" data-dismiss="modal">
                {{trans('messages.cancel')}}</button>
          </div>
        {{ Form::close() }}
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal /#accept-specimen-modal-->

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
                        {{trans('messages.specimen-not-received-label')}}</span>
                </div>
            </div>
        </div>
    </div> <!-- /. pending-test-not-received-specimen -->

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
            data-url="{{ URL::route('test.start') }}" title="{{trans('messages.start-test-title')}}">
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
