$(document).ready(function () {
$("input[name=optAction]").click(function(){
 	
 	$selected = $(this).val();

 	if($selected=='I')
 	{
 		$("#inbound_options").removeClass("hidden"); 		
 		$("#outbound_options").addClass("hidden");		
 	}

 	else if($selected=='O')
 	{
 		$("#inbound_options").addClass("hidden"); 		
 		$("#outbound_options").removeClass("hidden");		
 	}
 	else
 	{
 		$("#inbound_options").addClass("hidden"); 		
 		$("#outbound_options").addClass("hidden");		
 	}

});

if($("#action").val()!=null && $("#action").val()=="I")
{
	$("#quantity_out_div").addClass("hidden");
	$("#losses_adjustments_div").addClass("hidden");
	$("#remarks_div").addClass("hidden");
	$("#quantity_in").attr("required",true);
}


if($("#action").val()!=null && $("#action").val()=="O")
{
	$("#quantity_in_div").addClass("hidden");
	$("#losses_adjustments_div").addClass("hidden");
	$("#remarks_div").addClass("hidden");	
	$("#quantity_out").attr("required",true);
}


if($("#action").val()!=null && $("#action").val()=="A")
{
	$("#quantity_in_div").addClass("hidden");
	$("#quantity_out_div").addClass("hidden");
	$("#losses_adjustments").attr("required",true);	
	$("#remarks").attr("required",true);		
}

});
