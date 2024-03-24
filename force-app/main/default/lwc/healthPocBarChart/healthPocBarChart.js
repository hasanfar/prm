import { LightningElement, wire } from 'lwc';
import getData from '@salesforce/apex/HealthPocChartsController.getData';

export default class Gen_opportunitychart extends LightningElement {
    chartConfiguration;
    doughnutChartConfiguration;
    lineChartConfiguration;
    treeMapChartConfiguration;

    colorFromRaw(ctx) {
        if (ctx.type !== 'data') {
            return 'transparent';
        }
        const value = ctx.raw.v;
        let alpha = (1 + Math.log(value)) / 5;
        const color = 'green';
        return helpers.color(color)
            .alpha(alpha)
            .rgbString();
    }

    @wire(getData, {})
    getData({ error, data }) {
        if (error) {
            this.error = error;
            console.log('error => ' + JSON.stringify(error));
            this.chartConfiguration = undefined;
        } else if (data) {
            let chartData = [];
            let chartLabels = [];
            if (data.ChartData) {
                // alert(JSON.stringify(data.ChartData));
                data.ChartData.forEach(opp => {
                    chartData.push(opp.chartData);
                    chartLabels.push(opp.chartLabel);
                });
            }


            this.chartConfiguration = {
                type: 'horizontalBar',
                data: {
                    labels: chartLabels,
                    datasets: [
                        {
                            axis: 'y',
                            label: data.barLabel,
                            barPercentage: data.barPercentage,
                            barThickness: data.barThickness,
                            maxBarThickness: data.maxBarThickness,
                            minBarLength: data.minBarLength,
                            backgroundColor: data.backgroundColor,
                            data: chartData,
                        },
                    ],
                },
                options: {
                    indexAxis: 'y',
                }
            };



            console.log('data => ', data);
            this.error = undefined;
        }
    }
}