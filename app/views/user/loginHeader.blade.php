@section ("loginHeader")
	<table width="100%" style="font-size:12px;" border='0'>
        <thead>
            <tr>
                <td><a class="col-md-4 col-md-offset-4" href="http://www.aslm.org/" target="_blank"><img width="190" height="70" src="{{ Config::get('kblis.aslmlogo') }}" alt="African Society for Laboratory Medicine"></a></td>
                <td style="text-align:left;">
                    {{HTML::image(Config::get('kblis.organization-logo'),  Config::get('kblis.country') . trans('messages.court-of-arms'), array('width' => '200px')) }}
                </td>
                <td>{{HTML::image(Config::get('kblis.cdc-logo'), 'alt', array('width' => '120px', 'height' => '70px')) }}</td>
            </tr>
        </thead>
    </table>
    <h3 align="center"><font color="black"> ASLM Laboratory Information System (ALIS)</font></h3>
    <p align="center"><i><font color ="black">Towards quality laboratory data for evidence based planning and decision making</font></i></p>
@show

