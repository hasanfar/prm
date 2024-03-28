public class HealthPocChartsController {

    //Bar Chart
     @AuraEnabled(cacheable=true)
        public static ChartWrapper getBarChartData(){
            ChartWrapper chart=new ChartWrapper();
            List<ChartDataWrapper> ChartData=new List<ChartDataWrapper>();
            
            //Dummy Data
            List<ChartDataWrapper> chartDummyDataList= getChartDummyData();

            for(ChartDataWrapper opp :  chartDummyDataList)
            {
                ChartDataWrapper data=new ChartDataWrapper();
                data.chartLabel=opp.chartLabel;
                data.chartData=opp.chartData;
                ChartData.add(data);
            }
            chart.ChartData=ChartData;
            chart.barLabel='';
            chart.barPercentage=0.5;
            chart.barThickness=24;
            chart.maxBarThickness=30;
            chart.minBarLength=10;
            chart.backgroundColor='#275f87';

            return chart;
    }

    //Bar Chart 1
     @AuraEnabled(cacheable=true)
        public static ChartWrapper getBarChartData1(){
            ChartWrapper chart=new ChartWrapper();
            List<ChartDataWrapper> ChartData=new List<ChartDataWrapper>();
            
            //Dummy Data
            List<ChartDataWrapper> chartDummyDataList= getChartDummyData1();

            for(ChartDataWrapper opp :  chartDummyDataList)
            {
                ChartDataWrapper data=new ChartDataWrapper();
                data.chartLabel=opp.chartLabel;
                data.chartData=opp.chartData;
                ChartData.add(data);
            }
            chart.ChartData=ChartData;
            chart.barLabel='';
            chart.barPercentage=0.5;
            chart.barThickness=24;
            chart.maxBarThickness=30;
            chart.minBarLength=10;
            chart.backgroundColor='#275f87';

            return chart;
    }

    //Bar Chart 2
     @AuraEnabled(cacheable=true)
        public static ChartWrapper getBarChartData2(){
            ChartWrapper chart=new ChartWrapper();
            List<ChartDataWrapper> ChartData=new List<ChartDataWrapper>();
            
            //Dummy Data
            List<ChartDataWrapper> chartDummyDataList= getChartDummyData2();

            for(ChartDataWrapper opp :  chartDummyDataList)
            {
                ChartDataWrapper data=new ChartDataWrapper();
                data.chartLabel=opp.chartLabel;
                data.chartData=opp.chartData;
                ChartData.add(data);
            }
            chart.ChartData=ChartData;
            chart.barLabel='';
            chart.barPercentage=0.5;
            chart.barThickness=24;
            chart.maxBarThickness=30;
            chart.minBarLength=10;
            chart.backgroundColor='#275f87';

            return chart;
    }

    //Bar Chart 3
     @AuraEnabled(cacheable=true)
        public static ChartWrapper getBarChartData3(){
            ChartWrapper chart=new ChartWrapper();
            List<ChartDataWrapper> ChartData=new List<ChartDataWrapper>();
            
            //Dummy Data
            List<ChartDataWrapper> chartDummyDataList= getChartDummyData3();

            for(ChartDataWrapper opp :  chartDummyDataList)
            {
                ChartDataWrapper data=new ChartDataWrapper();
                data.chartLabel=opp.chartLabel;
                data.chartData=opp.chartData;
                ChartData.add(data);
            }
            chart.ChartData=ChartData;
            chart.barLabel='';
            chart.barPercentage=0.5;
            chart.barThickness=24;
            chart.maxBarThickness=30;
            chart.minBarLength=10;
            chart.backgroundColor='#275f87';

            return chart;
    }

    //Doughnut Chart Data
     @AuraEnabled(cacheable=true)
        public static ChartWrapper getDoughnutChartData(){
            ChartWrapper chart=new ChartWrapper();
            List<ChartDataWrapper> ChartData=new List<ChartDataWrapper>();
            
            //Dummy Data
            List<ChartDataWrapper> chartDummyDataList= getChartDummyData();

            for(ChartDataWrapper opp :  chartDummyDataList)
            {
                ChartDataWrapper data=new ChartDataWrapper();
                data.chartLabel=opp.chartLabel;
                data.chartData=opp.chartData;
                ChartData.add(data);
            }
            chart.ChartData=ChartData;
           chart.barLabel='';
            chart.barPercentage=0.5;
            chart.barThickness=24;
            chart.maxBarThickness=30;
            chart.minBarLength=10;
            chart.backgroundColor='#275f87';

            return chart;
    }

    //Line Chart Data
     @AuraEnabled(cacheable=true)
        public static ChartWrapper getLineChartData(){
            ChartWrapper chart=new ChartWrapper();
            List<ChartDataWrapper> ChartData=new List<ChartDataWrapper>();
            
            //Dummy Data
            List<ChartDataWrapper> chartDummyDataList= getChartDummyData();

            for(ChartDataWrapper opp :  chartDummyDataList)
            {
                ChartDataWrapper data=new ChartDataWrapper();
                data.chartLabel=opp.chartLabel;
                data.chartData=opp.chartData;
                ChartData.add(data);
            }
            chart.ChartData=ChartData;
            chart.barLabel='';
            chart.barPercentage=0.5;
            chart.barThickness=24;
            chart.maxBarThickness=30;
            chart.minBarLength=10;
            chart.backgroundColor='#275f87';

            return chart;
    }

    @AuraEnabled(cacheable=true)
    public static List<ChartDataWrapper> getChartDummyData(){
            
            //Dummy Data
            List<ChartDataWrapper> chartDummyDataList=new List<ChartDataWrapper>();

            ChartDataWrapper chartDummyData=new ChartDataWrapper();
            chartDummyData.chartLabel='Facility 1';
            chartDummyData.chartData=500;
            chartDummyDataList.add(chartDummyData);

            ChartDataWrapper chartDummyData1=new ChartDataWrapper();
            chartDummyData1.chartLabel='Facility 2';
            chartDummyData1.chartData=450;
            chartDummyDataList.add(chartDummyData1);

            ChartDataWrapper chartDummyData2=new ChartDataWrapper();
            chartDummyData2.chartLabel='Facility 3';
            chartDummyData2.chartData=300;
            chartDummyDataList.add(chartDummyData2);

            ChartDataWrapper chartDummyData3=new ChartDataWrapper();
            chartDummyData3.chartLabel='Facility 4';
            chartDummyData3.chartData=250;
            chartDummyDataList.add(chartDummyData3);

            ChartDataWrapper chartDummyData4=new ChartDataWrapper();
            chartDummyData4.chartLabel='Facility 5';
            chartDummyData4.chartData=200;
            chartDummyDataList.add(chartDummyData4);

            /*ChartDataWrapper chartDummyData5=new ChartDataWrapper();
            chartDummyData5.chartLabel='Facility 6';
            chartDummyData5.chartData=150;
            chartDummyDataList.add(chartDummyData5);*/

            return chartDummyDataList;
    }

    @AuraEnabled(cacheable=true)
    public static List<ChartDataWrapper> getChartDummyData1(){
            
            //Dummy Data
            List<ChartDataWrapper> chartDummyDataList=new List<ChartDataWrapper>();

            ChartDataWrapper chartDummyData=new ChartDataWrapper();
            chartDummyData.chartLabel='Facility 1';
            chartDummyData.chartData=250;
            chartDummyDataList.add(chartDummyData);

            ChartDataWrapper chartDummyData1=new ChartDataWrapper();
            chartDummyData1.chartLabel='Facility 2';
            chartDummyData1.chartData=500;
            chartDummyDataList.add(chartDummyData1);

            ChartDataWrapper chartDummyData2=new ChartDataWrapper();
            chartDummyData2.chartLabel='Facility 3';
            chartDummyData2.chartData=300;
            chartDummyDataList.add(chartDummyData2);

            /*ChartDataWrapper chartDummyData3=new ChartDataWrapper();
            chartDummyData3.chartLabel='Facility 4';
            chartDummyData3.chartData=150;
            chartDummyDataList.add(chartDummyData3);*/

            ChartDataWrapper chartDummyData4=new ChartDataWrapper();
            chartDummyData4.chartLabel='Facility 4';
            chartDummyData4.chartData=200;
            chartDummyDataList.add(chartDummyData4);

            ChartDataWrapper chartDummyData5=new ChartDataWrapper();
            chartDummyData5.chartLabel='Facility 5';
            chartDummyData5.chartData=250;
            chartDummyDataList.add(chartDummyData5);

            return chartDummyDataList;
    }

    @AuraEnabled(cacheable=true)
    public static List<ChartDataWrapper> getChartDummyData2(){
            
            //Dummy Data
            List<ChartDataWrapper> chartDummyDataList=new List<ChartDataWrapper>();

            ChartDataWrapper chartDummyData=new ChartDataWrapper();
            chartDummyData.chartLabel='Facility 1';
            chartDummyData.chartData=200;
            chartDummyDataList.add(chartDummyData);

            ChartDataWrapper chartDummyData1=new ChartDataWrapper();
            chartDummyData1.chartLabel='Facility 2';
            chartDummyData1.chartData=450;
            chartDummyDataList.add(chartDummyData1);

            /*ChartDataWrapper chartDummyData2=new ChartDataWrapper();
            chartDummyData2.chartLabel='Facility 3';
            chartDummyData2.chartData=150;
            chartDummyDataList.add(chartDummyData2);*/

            ChartDataWrapper chartDummyData3=new ChartDataWrapper();
            chartDummyData3.chartLabel='Facility 3';
            chartDummyData3.chartData=250;
            chartDummyDataList.add(chartDummyData3);

            ChartDataWrapper chartDummyData4=new ChartDataWrapper();
            chartDummyData4.chartLabel='Facility 4';
            chartDummyData4.chartData=500;
            chartDummyDataList.add(chartDummyData4);

            ChartDataWrapper chartDummyData5=new ChartDataWrapper();
            chartDummyData5.chartLabel='Facility 5';
            chartDummyData5.chartData=350;
            chartDummyDataList.add(chartDummyData5);

            return chartDummyDataList;
    }

    @AuraEnabled(cacheable=true)
    public static List<ChartDataWrapper> getChartDummyData3(){
            
            //Dummy Data
            List<ChartDataWrapper> chartDummyDataList=new List<ChartDataWrapper>();

            ChartDataWrapper chartDummyData=new ChartDataWrapper();
            chartDummyData.chartLabel='Facility 1';
            chartDummyData.chartData=500;
            chartDummyDataList.add(chartDummyData);

            ChartDataWrapper chartDummyData1=new ChartDataWrapper();
            chartDummyData1.chartLabel='Facility 2';
            chartDummyData1.chartData=250;
            chartDummyDataList.add(chartDummyData1);

            ChartDataWrapper chartDummyData2=new ChartDataWrapper();
            chartDummyData2.chartLabel='Facility 3';
            chartDummyData2.chartData=200;
            chartDummyDataList.add(chartDummyData2);

            ChartDataWrapper chartDummyData3=new ChartDataWrapper();
            chartDummyData3.chartLabel='Facility 4';
            chartDummyData3.chartData=250;
            chartDummyDataList.add(chartDummyData3);

            ChartDataWrapper chartDummyData4=new ChartDataWrapper();
            chartDummyData4.chartLabel='Facility 5';
            chartDummyData4.chartData=400;
            chartDummyDataList.add(chartDummyData4);

            /*ChartDataWrapper chartDummyData5=new ChartDataWrapper();
            chartDummyData5.chartLabel='Facility 6';
            chartDummyData5.chartData=150;
            chartDummyDataList.add(chartDummyData5);*/

            return chartDummyDataList;
    }

    public class ChartWrapper{
        @AuraEnabled
        public string barLabel;
        @AuraEnabled
        public Decimal barPercentage;
        @AuraEnabled
        public Integer barThickness;
        @AuraEnabled
        public Integer maxBarThickness;
        @AuraEnabled
        public Integer minBarLength;
        @AuraEnabled
        public string backgroundColor;
        @AuraEnabled
        public List<ChartDataWrapper> ChartData;
    }

    public class ChartDataWrapper{
        @AuraEnabled
        public string chartLabel;
        @AuraEnabled
        public Decimal chartData;

    }
}