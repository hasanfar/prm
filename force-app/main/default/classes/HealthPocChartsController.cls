public class HealthPocChartsController {
     @AuraEnabled(cacheable=true)
        public static ChartWrapper getData(){
            ChartWrapper chart=new ChartWrapper();
            List<ChartDataWrapper> ChartData=new List<ChartDataWrapper>();
            
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

            ChartDataWrapper chartDummyData5=new ChartDataWrapper();
            chartDummyData5.chartLabel='Facility 6';
            chartDummyData5.chartData=150;
            chartDummyDataList.add(chartDummyData5);


            for(ChartDataWrapper opp :  chartDummyDataList)
            {

                ChartDataWrapper data=new ChartDataWrapper();
                data.chartLabel=opp.chartLabel;
                data.chartData=opp.chartData;
                ChartData.add(data);
            }
            chart.ChartData=ChartData;
            chart.barLabel='Amount';
            chart.barPercentage=0.5;
            chart.barThickness=6;
            chart.maxBarThickness=8;
            chart.minBarLength=2;
            chart.backgroundColor='#1f5a84';

            return chart;


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