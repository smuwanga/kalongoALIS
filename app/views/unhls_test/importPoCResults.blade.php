@extends("layout")
@section("content")
	<div>
		<ol class="breadcrumb">
		  <li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
		  <li><a href="{{ URL::route('unhls_test.index') }}">{{ Lang::choice('messages.test',2) }}</a></li>
		  <li class="active">{{trans('messages.import-results-title')}}</li>
		</ol>
	</div>
	<div class="panel panel-primary">
		<div class="panel-heading ">
            <div class="container-fluid">
                <div class="row less-gutter">
                    <div class="col-md-11">
						<span class="ion-archive"> </span>{{trans('messages.import-results-title')}}
                    </div>

                </div>
            </div>
		</div>


		<div class="panel-body">
		<!-- if there are creation errors, they will show here -->
		@if($errors->all())
			<div class="alert alert-danger">
				{{ HTML::ul($errors->all()) }}
			</div>
		@endif
		{{ Form::open(array('route' => 'unhls_test.rejectAction',"id"=>"js-upload-form")) }}
			<div class="panel-body">

					<div class="input-group image-preview">
						{{ Form::label('filename', 'File name', array('class'=>'control-label hidden')) }}						
                		{{ Form::text('filename', Input::old('filename'), array('class' => 'form-control image-preview-filename','readonly'=>'readonly')) }}
						<!-- don't give a name === doesn't send on POST/GET --> 
						<span class="input-group-btn"> 
						<!-- image-preview-input -->
						<div class="btn btn-default image-preview-input file"> <span class="glyphicon glyphicon-folder-open"></span> <span class="image-preview-input-title">Browse</span>
							<input type="file" class="file" accept=".csv" name="input-file-preview" id="filez"/>
							<!-- rename it --> 
						</div>
						<button type="submit" class="btn btn-labeled btn-default"> <span class="btn-label"><i class="glyphicon glyphicon-upload"></i> </span>Upload</button>
						</span> 
					</div>
					<!-- /input-group image-preview [TO HERE]--> 
					</br></br>
					<!-- Upload Finished -->
					<div class="js-upload-finished">
						<h4>Upload history</h4>
						<div class="list-group"> <a href="#" class="list-group-item list-group-item-danger"><span class="badge alert-danger pull-right">23-11-2014</span>amended-catalogue-01.xls</a> <a href="#" class="list-group-item list-group-item-success"><span class="badge alert-success pull-right">23-11-2014</span>amended-catalogue-01.xls</a> <a href="#" class="list-group-item list-group-item-success"><span class="badge alert-success pull-right">23-11-2014</span>amended-catalogue-01.xls</a> <a href="#" class="list-group-item list-group-item-success"><span class="badge alert-success pull-right">23-11-2014</span>amended-catalogue.xls</a> </div>
					</div>
				
		{{ Form::close() }}
		</div>
	</div>

<script type="text/javascript">

$('.file').change(function(e){
	
	    
        $('#filename').val(e.target.files[0].name);
});



</script>
@stop