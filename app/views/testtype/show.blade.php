	<div>
		<ol class="breadcrumb">
		  <li><a href="{{{URL::route('user.home')}}}">Home</a></li>
		  <li><a href="{{ URL::route('testtype.index') }}">Test Type</a></li>
		  <li class="active">Test Type Details</li>
		</ol>
	</div>
	<div class="panel panel-primary">
		<div class="panel-heading ">
			<span class="glyphicon glyphicon-cog"></span>
			Test Type Details
			<div class="panel-btn">
				<a class="btn btn-sm btn-info" href="javascript:void(0);" onclick="pageloader('{{ URL::to("testtype/". $testtype->id ."/edit") }}')">
					<span class="glyphicon glyphicon-edit"></span>
					Edit
				</a>
			</div>
		</div>
		<div class="panel-body">
			<div class="display-details">
				<h3 class="view"><strong>Name</strong>{{ $testtype->name }} </h3>
				<p class="view-striped"><strong>Description</strong>{{ $testtype->description }}</p>
				<p class="view"><strong>Section</strong>{{ $testtype->testCategory->name }}</p>
				<p class="view-striped"><strong>Compatible Specimen</strong>{{ implode(", ", $testtype->specimenTypes->lists('name')) }}</p>
				<p class="view"><strong>Measures</strong>{{ implode(", ", $testtype->measures->lists('name')) }}</p>
				<p class="view-striped"><strong>Turnaround Time</strong>{{ $testtype->targetTAT }}</p>
				<p class="view"><strong>Prevalence Threshold</strong>{{ $testtype->prevalence_threshold }}</p>
				<p class="view-striped"><strong>Date Created</strong>{{ $testtype->created_at }}</p>
			</div>
		</div>
	</div>
