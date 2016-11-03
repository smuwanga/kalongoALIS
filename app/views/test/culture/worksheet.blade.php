@extends("layout")
@section("content")

    <div>
        <ol class="breadcrumb">
          <li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
          <li>
            <a href="{{ URL::route('test.index') }}">{{ Lang::choice('messages.test',2) }}</a>
          </li>
          <li class="active">Culture and Sensitivity</li>
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
<!-- culture observation -->
            <div class="row culture-worksheet">
                <h5 class="col-md-12">Culture Worksheet
                    <a class="btn btn-sm btn-success add-culture-observation"
                        href="javascript:void(0)"
                        data-url="{{ URL::route('cultureobservation.store') }}"
                        data-culture-id="{{ $culture->id }}"
                        title="Add Observation">
                        <span class="glyphicon glyphicon-plus"></span>
                        Add Observation
                    </a>
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
                      <tbody class="culture-observation-tbody">
                        @foreach($culture->culture_observations as $culture_observation)
                            <tr class="culture-observation-tr-{{$culture_observation->id}}">
                              <td><!-- id --></td>
                              <td class="duration-entry">
                                {{$culture_observation->culture_duration->duration}}</td>
                              <td class="observation-entry">{{$culture_observation->observation}}</td>
                              <td>
                                <a class="btn btn-sm btn-info edit-culture-observation"
                                    data-url="{{ URL::route('cultureobservation.update',
                                        [$culture_observation->id]) }}"
                                    data-id="{{ $culture_observation->id }}"
                                    data-duration-id="{{ $culture_observation->culture_duration->id }}"
                                    data-observation="{{ $culture_observation->observation }}"
                                    title="Edit">
                                    <span class="glyphicon glyphicon-edit"></span>
                                    Edit
                                </a>
                                <a class="btn btn-sm btn-danger delete-culture-observation"
                                    data-url="{{ URL::route('cultureobservation.destroy',
                                        [$culture_observation->id]) }}"
                                    data-id="{{ $culture_observation->id }}"
                                    title="Delete">
                                    <span class="glyphicon glyphicon-trash"></span>
                                    Delete
                                </a>
                              </td>
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
                                    <select class="form-control duration" name="duration">
                                        @foreach($cultureDurations as $key => $cultureDuration)
                                            <option value="{{$key}}">{{$cultureDuration}}</option>
                                        @endforeach
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
                            ['class' => 'btn btn-primary save-culture-observation']
                        ) }}
                        {{ Form::button(trans('messages.cancel'),
                            ['class' => 'btn btn-default cancel-culture-observation-edition']) }}
                    </div>
                </div>
            </div> 
<!-- isolated organism -->
            <div class="row isolated-organism">
                <h5 class="col-md-12">Organisms Isolated
                    <a class="btn btn-sm btn-success add-isolated-organism"
                        href="javascript:void(0)"
                        data-culture-id="{{ $culture->id }}"
                        data-url="{{ URL::route('isolatedorganism.store') }}"
                        data-drug-susceptibility-store-url="{{ URL::route('drugsusceptibility.store') }}"
                        title="Add Organism">
                        <span class="glyphicon glyphicon-plus"></span>
                        Add Organism
                    </a>
                </h5>
                <div class="col-md-6">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>Organisms</th>
                          <th><!-- Action --></th>
                        </tr>
                      </thead>
                      <tbody class="isolated-organism-tbody">
                        @foreach($culture->isolated_organisms as $isolated_organism)
                            <tr class="isolated-organism-tr-{{$isolated_organism->id}}">
                              <td><!-- id --></td>
                              <td class="isolated-organism-entry">{{$isolated_organism->organism->name}}</td>
                              <td>
                                <a class="btn btn-sm btn-success add-drug-susceptibility"
                                    data-url="{{ URL::route('drugsusceptibility.store') }}"
                                    data-isolated-organism-id="{{ $isolated_organism->id }}"
                                    data-isolated-organism-name="{{ $isolated_organism->organism->name }}"
                                    title="Add Susceptibility Test">
                                    <span class="glyphicon glyphicon-plus"></span>
                                    Add Results
                                </a>
                                <a class="btn btn-sm btn-danger delete-isolated-organism"
                                    data-url="{{ URL::route('isolatedorganism.destroy',
                                        [$isolated_organism->id]) }}"
                                    data-id="{{ $isolated_organism->id }}"
                                    title="Delete Organism">
                                    <span class="glyphicon glyphicon-trash"></span>
                                    Delete Organism
                                </a>
                              </td>
                            </tr>
                        @endforeach
                      </tbody>
                    </table>
                </div>
                <div class="col-md-6 hidden isolated-organism-addition">
                    <div class="col-md-12">
                       <div class="form-group">
                           {{ Form::label('isolated-organism', 'Organism Isolated') }}
                       </div>
                    </div>
                    <div class="col-md-12">
                       <div class="form-group">
                               <select class="form-control isolated-organism-input" name="isolated-organism">
                                   @foreach($organisms as $key => $organism)
                                       <option value="{{$key}}">{{$organism}}</option>
                                   @endforeach
                               </select>
                       </div>
                    </div>
                    <div class="form-group actions-row">
                        {{ Form::button(
                            '<span class="glyphicon glyphicon-save"></span> '.trans('messages.save'), 
                            ['class' => 'btn btn-primary save-isolated-organism']
                        ) }}
                        {{ Form::button(trans('messages.cancel'),
                            ['class' => 'btn btn-default cancel-isolated-organism-addition']) }}
                    </div>
                </div>
            </div> 
<!-- drug susceptibility -->
            <div class="row drug-susceptibility">
                <h5 class="col-md-12">Drug Susceptibility</h5>
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
                      <tbody class="drug-susceptibility-tbody">
                        @foreach($culture->isolated_organisms as $isolated_organism)
                            @foreach($isolated_organism->drug_susceptibilities as $drug_susceptibility)
                            <tr class="drug-susceptibility-tr-{{$drug_susceptibility->id}}">
                              <td><!-- id --></td>
                              <td class="isolated-organism-entry">
                                {{$isolated_organism->organism->name}}</td>
                              <td class="drug-entry">
                                {{$drug_susceptibility->drug->name}}</td>
                              <td class="result-entry">
                                {{$drug_susceptibility->drug_susceptibility_measure->interpretation}}</td>
                              <td>
                                <a class="btn btn-sm btn-info edit-drug-susceptibility"
                                    data-url="{{ URL::route('drugsusceptibility.update',
                                        [$drug_susceptibility->id]) }}"
                                    data-id="{{ $drug_susceptibility->id }}"
                                    data-drug-id="{{ $drug_susceptibility->drug_id }}"
                                    data-isolated-organism-id="{{ $drug_susceptibility->isolated_organism_id }}"
                                    data-drug-susceptibility-measure-id="{{ $drug_susceptibility->drug_susceptibility_measure_id }}"
                                    title="Edit">
                                    <span class="glyphicon glyphicon-edit"></span>
                                    Edit
                                </a>
                                <a class="btn btn-sm btn-danger delete-drug-susceptibility"
                                    data-url="{{ URL::route('drugsusceptibility.destroy',
                                        [$drug_susceptibility->id]) }}"
                                    data-id="{{ $drug_susceptibility->id }}"
                                    title="Delete">
                                    <span class="glyphicon glyphicon-trash"></span>
                                    Delete
                                </a>
                              </td>
                            </tr>
                            @endforeach
                        @endforeach
                      </tbody>
                    </table>
                </div>
                <div class="col-md-6">
                    <div class="susceptibility-result hidden">
                        <h5 class="col-md-12 isolated-organism-input-header"></h5>
                        <div class="drugs">
                            <div class="col-md-12">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {{ Form::label('drug', 'Antibiotic') }}
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {{ Form::label('susceptibility', 'Result') }}
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <select class="form-control drug" >
                                            @foreach($drugs as $key => $drug)
                                                <option value="{{$key}}">{{$drug}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <select class="form-control susceptibility" >
                                            @foreach($drugSusceptibilityMeasures as
                                                $key => $drugSusceptibilityMeasure)
                                                <option value="{{$key}}">{{$drugSusceptibilityMeasure}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group actions-row">
                                {{ Form::button(
                                    '<span class="glyphicon glyphicon-save"></span> '.trans('messages.save'), 
                                    ['class' => 'btn btn-primary save-drug-susceptibility']
                                ) }}
                                {{ Form::button(trans('messages.cancel'), 
                                    ['class' => 'btn btn-default cancel-drug-susceptibility-edition']
                                ) }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
<!-- culture observation -->
<!-- todo... check whether these empty things down here are neccessary data-url="" -->
                    <table>
                        <tbody class="hidden cultureObservationEntryLoader">
                            <tr class="new-culture-observation-tr">
                              <td><!-- id --></td>
                              <td class="duration-entry"></td>
                              <td class="observation-entry"></td>
                              <td>
                                <a class="btn btn-sm btn-info edit-culture-observation"
                                    data-url-verb="PUT"
                                    title="Edit">
                                    <span class="glyphicon glyphicon-edit"></span>
                                    Edit
                                </a>
                                <a class="btn btn-sm btn-danger delete-culture-observation"
                                    data-url-verb="DELETE"
                                    title="Delete">
                                    <span class="glyphicon glyphicon-trash"></span>
                                    Delete
                                </a>
                              </td>
                            </tr>
                        </tbody>
                    </table>
<!-- isolated organism -->
                    <table>
                        <tbody class="hidden isolatedOrganismEntryLoader">
                            <tr class="new-isolated-organism-tr">
                              <td><!-- id --></td>
                              <td class="isolated-organism-entry"></td>
                              <td>
                                <a class="btn btn-sm btn-success add-drug-susceptibility"
                                    title="Add Susceptibility Test">
                                    <span class="glyphicon glyphicon-plus"></span>
                                    Add Results
                                </a>
                                <a class="btn btn-sm btn-danger delete-isolated-organism"
                                    data-url-verb="DELETE"
                                    title="Delete Organism">
                                    <span class="glyphicon glyphicon-trash"></span>
                                    Delete Organism
                                </a>
                              </td>
                            </tr>
                        </tbody>
                    </table>
<!-- drug susceptibility -->
                    <table>
                        <tbody class="hidden drugSusceptibilityEntryLoader">
                            <tr class="new-drug-susceptibility-tr">
                              <td><!-- id --></td>
                              <td class="isolated-organism-entry"></td>
                              <td class="drug-entry"></td>
                              <td class="result-entry"></td>
                              <td>
                                <a class="btn btn-sm btn-info edit-drug-susceptibility"
                                    data-url-verb="PUT"
                                    title="Edit">
                                    <span class="glyphicon glyphicon-edit"></span>
                                    Edit
                                </a>
                                <a class="btn btn-sm btn-danger delete-drug-susceptibility"
                                    data-url-verb="DELETE"
                                    title="Delete">
                                    <span class="glyphicon glyphicon-trash"></span>
                                    Delete
                                </a>
                              </td>
                            </tr>
                        </tbody>
                    </table>
@stop   
