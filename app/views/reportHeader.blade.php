@section ("reportHeader")
<style type="text/css"></style>
    <table style="text-align:center;" >
        <thead>
            <tr>
                <td colspan="2" style="test-align:left;">{{ HTML::image(Config::get('kblis.organization-logo'),  Config::get('kblis.country') . trans('messages.court-of-arms'), array('width' => '90px')) }}</td>
                <td colspan="8" style="text-align:center;"><strong>
                    {{ strtoupper(Config::get('constants.FACILITY_NAME')) }},<br>
                    {{Config::get('kblis.organization')}}<br>
                    {{ trans('messages.laboratory-report')}}</strong>
                </td>
                <td colspan="2" style="text-align:right;">
                    {{ HTML::image(Config::get('kblis.organization-logo'),  Config::get('kblis.country') . trans('messages.court-of-arms'), array('width' => '90px')) }}
                </td>
            </tr>
        </thead>
    </table>
@show