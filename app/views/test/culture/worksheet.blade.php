@extends("layout")
@section("content")

    <div>
        <ol class="breadcrumb">
          <li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
          <li>
            <a href="{{ URL::route('test.index') }}">{{ Lang::choice('messages.test',2) }}</a>
          </li>
          <li class="active">Culture</li>
        </ol>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading ">
            <div class="container-fluid">
                <div class="row less-gutter">
                    <span class="glyphicon glyphicon-adjust"></span>Culture and Sensitivity
                </div>
            </div>
        </div>
        <div class="panel-body">

            <div class="row culture-worksheet">
                <h5 class="col-md-12">Culture Worksheet
                    <button class="close add-another-culture-observation"
                        aria-hidden="true"
                        type="button"
                        title="Add Observation">+</button>
                </h5>
                <div class="col-md-6">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>Duration</th>
                          <th>Observation</th>
                          <th><!-- Action --></th>
                        </tr>
                      </thead>
                      <tbody>
                        @foreach($cultureObservations as $cultureObservation)
                            <tr>
                              <td><!-- id --></td>
                              <td>{{$cultureObservation->culture_duration->duration}}</td>
                              <td>{{$cultureObservation->observation}}</td>
                              <td>@action</td>
                            </tr>
                        @endforeach
                      </tbody>
                    </table>
                </div>
                <div class="col-md-6 hidden culture-observation">
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <div class="form-group">
                                {{ Form::label('duration', 'Duration') }}
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                {{ Form::label('observation', 'Observation') }}
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                            <div class="col-md-6">
                            <div class="form-group">
                                    <select class="form-control duration" 
                                        name="duration">
                                            <option value="0"></option>
                                            <option value="{{1}}">24hrs</option>
                                            <option value="{{2}}">48hrs</option>
                                            <option value="{{3}}">72hrs</option>
                                    </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input class="form-control observation" name="observation" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="form-group actions-row">
                        {{ Form::button(
                            '<span class="glyphicon glyphicon-save"></span> '.trans('messages.save'), 
                            ['class' => 'btn btn-primary', 'onclick' => 'submit()']
                        ) }}
                        {{ Form::button(trans('messages.cancel'), ['class' => 'btn btn-default']) }}
                    </div>
                </div>
            </div>
            <div class="row drug-susceptibility">
                <div class="col-md-12">
                    <h5 class="col-md-6">Drug Susceptibility
                        <button class="close add-another-drug-susceptibility"
                            aria-hidden="true"
                            type="button"
                            title="Add Susceptibility Test">+</button>
                    </h5>
                </div>
                <div class="col-md-6">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>Organism</th>
                          <th>Drug</th>
                          <th>Result</th>
                          <th><!-- Action --></th>
                        </tr>
                      </thead>
                      <tbody>
                        @foreach($drugSusceptibilities as $drugSusceptibility)
                            <tr>
                              <td><!-- id --></td>
                              <td>{{$drugSusceptibility->isolated_organism->organism->name}}</td>
                              <td>{{$drugSusceptibility->drug->name}}</td>
                              <td>{{$drugSusceptibility->drug_susceptibility_measure->interpretation}}</td>
                              <td>@action</td>
                            </tr>
                        @endforeach
                      </tbody>
                    </table>
                </div>
                <div class="col-md-6">
                    <div class="organism-isolated hidden">
                        <h5 class="col-md-12">Organism Isolated</h5>
                        <div class="antibiotics">
                            <div class="col-md-12">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {{ Form::label('antibiotic', 'Antibiotic') }}
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {{ Form::label('susceptibility', 'Susceptibility') }}
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <select class="form-control antibiotic" >
                                            <option value="0"></option>
                                            <option value="{{1}}">CHLORAMPHENICOL</option>
                                            <option value="{{2}}">CLINDAMYCIN</option>
                                            <option value="{{3}}">ERYTHROMYCIN</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <select class="form-control susceptibility" >
                                            <option value="0"></option>
                                            <option value="I">Intermediate</option>
                                            <option value="S">Sensitive</option>
                                            <option value="R">Resistant</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group actions-row">
                                {{ Form::button(
                                    '<span class="glyphicon glyphicon-save"></span> '.trans('messages.save'), 
                                    ['class' => 'btn btn-primary', 'onclick' => 'submit()']
                                ) }}
                                {{ Form::button(trans('messages.cancel'), 
                                    ['class' => 'btn btn-default', 'onclick' => 'javascript:history.go(-1)']
                                ) }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
@stop   
