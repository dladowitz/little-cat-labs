
//weight and date variables are set in user/show.html.haml

var graph_data_points = []

for(i = 0; i < weights.length; i++){
  point = {"category": dates[i], "column-1": weights[i]};
  graph_data_points.push(point);
};

//For some reason an extra y0: point is being added. Only when using y for weight. Not sure why.
console.log(graph_data_points);

AmCharts.makeChart("chartdiv",
  {
    "type": "serial",
    "pathToImages": "http://cdn.amcharts.com/lib/3/images/",
    "categoryField": "category",
    "startDuration": 1,
    "fontFamily": "",
    "theme": "light",
    "categoryAxis": {
      "gridPosition": "start",

      //TODO set minimum period to "mm"
      "minPeriod": "ss",
      "parseDates": true
    },
    "chartCursor": {
      "avoidBalloonOverlapping": false,
      "valueLineBalloonEnabled": true
    },
    "trendLines": [],
    "graphs": [
      {
        "balloonText": "[[title]] of [[category]]:[[value]]",
        "bullet": "round",
        "id": "AmGraph-1",
        "title": "Weight",
        "valueAxis": "Not set",
        "valueField": "column-1",
        "visibleInLegend": false
      }
    ],
    "guides": [],
    "valueAxes": [
      {
        "id": "ValueAxis-1",
        "title": "Lbs"
      }
    ],
    "allLabels": [],
    "balloon": {},
    "legend": {
      "useGraphSettings": true
    },
    //"titles": [
    //  {
    //    "id": "Title-1",
    //    "size": 24,
    //    "text": "Weight History"
    //  }
    //],
    "dataProvider": graph_data_points
  }
);
