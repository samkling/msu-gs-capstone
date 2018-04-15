<script type="text/javascript">
function buildPieChart(chartLabels,chartData,id) {
	var that = this;

	var ctx = document.getElementById(id);
	var myPieChart = new Chart(ctx, {
	  type: 'doughnut',
	  data: {
	    labels: chartLabels,
	    datasets: [{
	      data: chartData,
	      backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745'],
	    }],
	  },
	});
}

</script>

<script type="text/javascript">
	
window.onload = function () {

	var android = parseInt("{{androidUsers}}",10);
	var iOS = 30 - android;
	var chartLabels = [" Android"," iOS"];
	var chartData = [android,iOS];
	buildPieChart(chartLabels,chartData,"androidOsPieChart");

	//alert("{{stepsCompletedPdf1Test1}}");
	var that = this;
	var aStr = "{{stepsCompletedPdf1Test1}}";
	//alert();
	aStr = aStr.substring(1,aStr.length-1)
	var aList = aStr.split(',');
	//alert(aList[0]);

	var i;
	var vals = [];
	for (i = 0; i < aList.length; i++){
		vals[i] = parseInt(aList[i],10);
	}
	//alert(vals);

	var yMax = Math.max(vals);


	// -- Bar Chart Example
	var ctx = document.getElementById("pdfTest1CompleteChart");
	var myLineChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: ["0","1", "2", "3", "4"],
	    datasets: [{
	      label: "Amount",
	      backgroundColor: "rgba(2,117,216,1)",
	      borderColor: "rgba(2,117,216,1)",
	      data: vals,
	    }],
	  },
	  options: {
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'amount'
	        },
	        gridLines: {
	          display: false
	        },
	        ticks: {
	          maxTicksLimit: 6
	        }
	      }],
	      yAxes: [{
	        ticks: {
	          min: 0,
	          max: that.yMax,
	          maxTicksLimit: (that.yMax)/2
	        },
	        gridLines: {
	          display: true
	        }
	      }],
	    },
	    legend: {
	      display: false
	    }
	  }
	});

}

</script>