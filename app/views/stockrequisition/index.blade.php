@extends("layout")
@section("content")
<div>
  <ol class="breadcrumb">
    <li><a href="{{{URL::route('user.home')}}}">{{trans('messages.home')}}</a></li>
   
    <li class="active">{{ Lang::choice('messages.stock-requisition',2) }}</li>
  </ol>
</div>
@if (Session::has('message'))
  <div class="alert alert-info">{{ trans(Session::get('message')) }}</div>
@endif
  <p class="bg-primary col-sm-3">
                <span class="label"><strong>Item code:</strong></span>
              </p>  
              <p class="bg-primary col-sm-7">
                <span class="label"><strong>Item description:</strong></span>
              </p>  
              <p class="bg-primary col-sm-2">
                <span class="label"><strong>Pack size:</strong></span>
              </p>

<div class="panel panel-default">

  <div class="panel-body">
            
            
      <div class="table-responsive">
        <table class="table table-condensed table-striped search-table">

            <thead>
              <tr>
                <th>Period</th>
                <th class="text-right">Quantity received</th> 
                <th class="text-right">Quantity issued</th>
                <th class="text-right">Days out of stock</th>
                <th class="text-right">Losses & Adjustments</th>
                <th class="text-right">Balance on Hand</th>
                <th class="text-right">AMC</th>
                <th class="text-right">Quantity to order</th>            
              </tr>
            </thead>
            <tbody>
              <tr>              
                <td>June 2016</td>
                <td class="text-right">10</td>
                <td class="text-right">9016</td>
                <td class="text-right">20</td>
                <td class="text-right">10</td>
                <td class="text-right text-danger">10</td>
                <td class="text-right">3</td>
                <td class="text-right">2</td>
              </tr>
              <tr>              
                <td>July 2016</td>
                <td class="text-right">10</td>
                <td class="text-right">9016</td>
                <td class="text-right">20</td>
                <td class="text-right">10</td>
                <td class="text-right">10</td>
                <td class="text-right">3</td>
                <td class="text-right">2</td>
              </tr>
            </tbody>
        </table>
      </div>


<div class="modal fade" tabindex="-1" role="dialog" id="new-stock-modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Parameters</h4>
      </div>
      <div class="modal-body">
      {{ Form::open(array('url' => 'stockrequisition/create')) }}
      <div class="form-group">
      {{ Form::label('district', 'District', array('class'=>'control-label')) }}
        {{ Form::select('district', array(null => '')+ $districts,
                    Input::old('district'), array('class' => 'form-control', 'id' => 'district-id')) }}             
      </div>

        <div class="form-group hidden" id="div-facility">            
      {{ Form::label('facility', 'Facility', array('class'=>'control-label')) }}
            <div id="facility-id">

            </div>
        </div>

      <div class="form-group">
      {{ Form::label('year', 'Financial Year', array('class'=>'control-label')) }}
        {{ Form::select('year', array(null => '')+ $years,
                    Input::old('year'), array('class' => 'form-control', 'id' => 'year-id')) }}             
      </div>

      <div class="form-group">
      {{ Form::label('item', 'Item', array('class'=>'control-label')) }}
        {{ Form::select('item', array(null => '')+ $items,
                    Input::old('item'), array('class' => 'form-control', 'id' => 'item-id')) }}             
      </div>

      <div class="row">
        <div class="col-sm-4">
         <label for="recipient-name" class="control-label">Action</label>  
      </div>
      

                <div class="form-group">
                {{ Form::label('redirect', 'Redirect',array('class'=>'hidden')) }}
                {{ Form::hidden('redirect', 0 ,Input::old('redirect'), array('class' => 'form-control')) }}
            </div>  

    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Continue</a>
      </div>
    {{ Form::close() }}

      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


    <?php Session::put('SOURCE_URL', URL::full());?>
  </div>
  
</div>


<script type="text/javascript">
  $(document).ready(function($){
   $('#district-id').change(function(e){

            var data = {
                districtId: e.target.value
            };


        $.ajax({
            type: 'POST',
            url: '/apite/facility',
            data: data
        }).done(function(response) {
          $('#div-facility').removeClass('hidden');
          $('#facility').remove();
          var sel = $('<select>').appendTo('#facility-id');
            sel.attr('id', 'facility').attr('name', 'facility').addClass('form-control');
              $.each(response, function(index,value) {   

          console.log(value.id);
          sel.append($('<option>', { value : value.id }).text(value.name)); 
      });
        }).fail(function (jqXHR, textStatus, errorThrown) {
            //TODO handle fails on note post backs.
            console.log(textStatus + ' : ' + errorThrown);
        });

  });
});
</script>
@stop