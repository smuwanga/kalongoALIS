$(document).ready(
    function(){
        
        
        Highcharts.chart('trendsDiv', {

            title: {
                text: 'Daily TAT for '+data_resultset.test_type.name
            },

            subtitle: {
                text: 'Source: ALIS'
            },
            xAxis:{
                categories:data_resultset.x_axis
            },

            yAxis: {
                title: {
                    text: 'Average Turn Around Time('+data_resultset.test_type.targetTAT_unit+')'
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle'
            },

            plotOptions: {
                series: {
                    label: {
                        connectorAllowed: false
                    },
                   // pointStart: 1
                }
            },

            series: [{
                name: 'Expected TAT',
                data: data_resultset.target_tat
            }, {
                name: 'Analysis(Actual) TAT',
                data: data_resultset.testing_tat
            }, {
                name: 'Patient Waiting Time',
                data: data_resultset.waiting_tat
            }],

            responsive: {
                rules: [{
                    condition: {
                        maxWidth: 500
                    },
                    chartOptions: {
                        legend: {
                            layout: 'horizontal',
                            align: 'center',
                            verticalAlign: 'bottom'
                        }
                    }
                }]
            }

    });//end Highcharts

    });
