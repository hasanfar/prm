import { LightningElement, wire } from 'lwc';
import getBarChartData from '@salesforce/apex/HealthPocChartsController.getBarChartData';
import getBarChartData1 from '@salesforce/apex/HealthPocChartsController.getBarChartData1';
import getBarChartData2 from '@salesforce/apex/HealthPocChartsController.getBarChartData2';
import getBarChartData3 from '@salesforce/apex/HealthPocChartsController.getBarChartData3';


export default class Gen_Barchart extends LightningElement {
    chartConfiguration;
    chartConfiguration1;
    chartConfiguration2;
    chartConfiguration3;


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

    @wire(getBarChartData, {})
    getBarChartData({ error, data }) {
        if (error) {
            this.error = error;
            console.log('error => ' + JSON.stringify(error));
            this.chartConfiguration = undefined;
        } else if (data) {
            let chartData = [];
            let chartLabels = [];
            if (data.ChartData) {
                //alert(JSON.stringify(data.ChartData));
                data.ChartData.forEach(opp => {
                    chartData.push(opp.chartData);
                    chartLabels.push(opp.chartLabel);
                });
            }

            // Bar Chart
            this.chartConfiguration = {
                type: 'bar',
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
							borderWidth : 0
                        },
                    ],
                },
               options: {
                   plugins: {
                       title: {
                           display: false
                       }
                   },
                   plugins: {
                       legend: {
                           display: false
                       }
                   },
                    indexAxis: 'y',
                    scales: {
                        x: {
                            grid: {
                                display: false, // Hide x-axis lines
                            },
                            border: {
                                display: false // remove border lines
                            }
                        },
                        y: {
                           grid: {
                                display: false, // Hide y-axis lines
                            },
                            border: {
                                display: false // remove border lines
                            }
                        },
                    },

                },
            };

            console.log('data => ', data);
            this.error = undefined;
        }
    }

    @wire(getBarChartData1, {})
    getBarChartData1({ error, data }) {
        if (error) {
            this.error = error;
            console.log('error => ' + JSON.stringify(error));
            this.chartConfiguration1 = undefined;
        } else if (data) {
            let chartData = [];
            let chartLabels = [];
            if (data.ChartData) {
                //alert(JSON.stringify(data.ChartData));
                data.ChartData.forEach(opp => {
                    chartData.push(opp.chartData);
                    chartLabels.push(opp.chartLabel);
                });
            }

            // Bar Chart
            this.chartConfiguration1 = {
                type: 'bar',
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
                    plugins: {
                       title: {
                           display: false
                       }
                   },
                   plugins: {
                       legend: {
                           display: false
                       }
                   },
                    indexAxis: 'y',
                    scales: {
                        x: {
                            grid: {
                                display: false, // Hide x-axis lines
                            },
                            border: {
                                display: false // remove border lines
                            }
                        },
                        y: {
                           grid: {
                                display: false, // Hide y-axis lines
                            },
                            border: {
                                display: false // remove border lines
                            }
                        },
                    },

                },
            };

            console.log('data => ', data);
            this.error = undefined;
        }
    }

    @wire(getBarChartData2, {})
    getBarChartData2({ error, data }) {
        if (error) {
            this.error = error;
            console.log('error => ' + JSON.stringify(error));
            this.chartConfiguration2 = undefined;
        } else if (data) {
            let chartData = [];
            let chartLabels = [];
            if (data.ChartData) {
                //alert(JSON.stringify(data.ChartData));
                data.ChartData.forEach(opp => {
                    chartData.push(opp.chartData);
                    chartLabels.push(opp.chartLabel);
                });
            }

            // Bar Chart
            this.chartConfiguration2 = {
                type: 'bar',
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
                    plugins: {
                       title: {
                           display: false
                       }
                   },
                   plugins: {
                       legend: {
                           display: false
                       }
                   },
                    indexAxis: 'y',
                    scales: {
                        x: {
                            grid: {
                                display: false, // Hide x-axis lines
                            },
                            border: {
                                display: false // remove border lines
                            }
                        },
                        y: {
                           grid: {
                                display: false, // Hide y-axis lines
                            },
                            border: {
                                display: false // remove border lines
                            }
                        },
                    },

                },
            };

            console.log('data => ', data);
            this.error = undefined;
        }
    }

    @wire(getBarChartData3, {})
    getBarChartData3({ error, data }) {
        if (error) {
            this.error = error;
            console.log('error => ' + JSON.stringify(error));
            this.chartConfiguration3 = undefined;
        } else if (data) {
            let chartData = [];
            let chartLabels = [];
            if (data.ChartData) {
                //alert(JSON.stringify(data.ChartData));
                data.ChartData.forEach(opp => {
                    chartData.push(opp.chartData);
                    chartLabels.push(opp.chartLabel);
                });
            }

            // Bar Chart
            this.chartConfiguration3 = {
                type: 'bar',
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
                    plugins: {
                       title: {
                           display: false
                       }
                   },
                   plugins: {
                       legend: {
                           display: false
                       }
                   },
                    indexAxis: 'y',
                    scales: {
                        x: {
                            grid: {
                                display: false, // Hide x-axis lines
                            },
                            border: {
                                display: false // remove border lines
                            }
                        },
                        y: {
                           grid: {
                                display: false, // Hide y-axis lines
                            },
                            border: {
                                display: false // remove border lines
                            }
                        },
                    },

                },
            };

            console.log('data => ', data);
            this.error = undefined;
        }
    }

    queryTerm;

    handleKeyUp(evt) {
        const isEnterKey = evt.keyCode === 13;
        if (isEnterKey) {
            this.queryTerm = evt.target.value;
        }
    }
}