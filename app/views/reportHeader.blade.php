@section ("reportHeader")
<style type="text/css"></style>
    <table style="text-align:center;" >
        <thead>
            <tr>
                <td colspan="12"></td>
            </tr>
            <tr>
                <td colspan="12" style="text-align:center;">
                    {{ HTML::image(Config::get('kblis.organization-logo'),  Config::get('kblis.country') . trans('messages.court-of-arms'), array('width' => '90px')) }}
                </td>
            </tr>
            <tr>
                <td colspan="12" style="text-align:center;"><strong>
                    {{ strtoupper(Config::get('constants.FACILITY_NAME')) }},<br>
                    {{Config::get('kblis.organization')}}</strong><br>
                    {{ trans('messages.laboratory-report')}}
                </td>
            </tr>
        </thead>
    </table>
@show