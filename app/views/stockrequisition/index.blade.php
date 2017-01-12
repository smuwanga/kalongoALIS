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

<div class="row">
  
  <div class="col-md-12">
    <form class="form-horizontal">
      <fieldset>
 
    <div class="form-group">
      <label for="select" class="col-lg-2 control-label">Tracer item</label>
      <div class="col-lg-10">
        <select class="form-control" id="select">
          <option>Select item</option>
          <option>Sysmex Lysing Reagents </option>          
        </select>
      </div>
    </div>


          <div class="form-group">
            <div class="col-lg-10 col-lg-offset-2">
              <a id="btn_get_stock_book" class="btn btn-primary">Submit</a>
            </div>
          </div>

      </fieldset>
    </form>

  </div>

</div>
<hr>
<div class="row hidden" id="stockcard_table">
  
  <div class="col-md-12">
    <p class="bg-primary col-sm-3">
                  <span class="label"><strong>Item code: AMP</strong></span>
                </p>  
                <p class="bg-primary col-sm-7">
                  <span class="label"><strong>Item description: Ampicillin</strong></span>
                </p>  
                <p class="bg-primary col-sm-2">
                  <span class="label"><strong>Pack size: 50</strong></span>
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

                  </tbody>
              </table>
            </div>




          <?php Session::put('SOURCE_URL', URL::full());?>
        </div>
        
      </div>
  </div>

</div>

<script type="text/javascript">
  $(document).ready(function($){
   $('#btn_get_stock_book').click(function(e){

      $("#stockcard_table").removeClass("hidden").addClass("visible");

  });
});
</script>
@stop