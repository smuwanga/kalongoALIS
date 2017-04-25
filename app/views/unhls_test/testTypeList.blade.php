{{Form::label('test-list', trans("messages.select-tests"))}}
<div class="form-pane panel panel-default">
	<div class="container-fluid">
		<?php
			$cnt = 0;
			$zebra = "";
		?>
		@foreach($testTypes as $key=>$value)
			{{ ($cnt%4==0)?"<div class='row $zebra'>":"" }}
			<?php
				$cnt++;
				$zebra = (((int)$cnt/4)%2==1?"row-striped":"");
			?>
			<div class="col-md-3">
				<label  class="checkbox">
					<input type="checkbox" name="testtypes[]" value="{{ $value->id}}"/>{{$value->name}}
				</label>
			</div>
			{{ ($cnt%4==0)?"</div>":"" }}
		@endforeach
		</div>
	</div>
</div>
