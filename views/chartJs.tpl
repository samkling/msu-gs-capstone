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

function parseStringToArray(pStr) {

	pStr = pStr.substring(1,pStr.length-1)
	var pList = pStr.split(',');
	return pList;
}
	
window.onload = function () {

	var android = parseInt("{{androidUsers}}",10);
	var iOS = 30 - android;
	var chartLabels = [" Android"," iOS"];
	var chartData = [android,iOS];
	buildPieChart(chartLabels,chartData,"androidOsPieChart");

	var aList = parseStringToArray("{{davidVrobin}}");
	var chartLabels = [" David", " Robin"];
	var chartData = aList;
	buildPieChart(chartLabels,chartData,"robinVdavid");

	//alert("{{stepsCompletedPdf1Test1}}");
	var that = this;
	var aStr = "{{averageTimePerTask}}";
	//alert();
	var aList = parseStringToArray(aStr);
	//alert(aList[0]);

	var i;
	var vals = [];
	for (i = 0; i < aList.length; i++){
		vals[i] = parseInt(aList[i],10);
	}
	
	var avgLabels = ["PDF HITM","PDF USH", "vPub USH", "vPub HITM"];

	var yMax = Math.max(vals);

	// -- Bar Chart Example
	var ctx = document.getElementById("averageTimePerTask");
	var myLineChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: avgLabels,
	    datasets: [{
	      label: "Seconds",
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

	/// AVERAGE IF COMPLETED ALL TASKS
	var that = this;
	var aStr = "{{completedAll}}";
	//alert();
	var aList = parseStringToArray(aStr);
	//alert(aList[0]);

	var i;
	var vals = [];
	for (i = 0; i < aList.length; i++){
		vals[i] = parseInt(aList[i],10);
	}
	
	var avgLabels = ["PDF HITM","PDF USH", "vPub USH", "vPub HITM"];

	var yMax = Math.max(vals);
	
	// -- Bar Chart Example
	var ctx = document.getElementById("averageTimePerTaskWhenCompleted");
	var myLineChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: avgLabels,
	    datasets: [{
	      label: "Seconds",
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




	/// Pdf Ease of use
	var that = this;
	var aStr = "{{pdfEaseOfUse}}";
	//alert();
	var aList = parseStringToArray(aStr);
	//alert(aList[0]);

	var i;
	var vals = [];
	for (i = 0; i < aList.length; i++){
		vals[i] = parseInt(aList[i],10);
	}
	
	var avgLabels = ["1","2", "3", "4", "5"];

	var yMax = Math.max(vals);
	
	// -- Bar Chart Example
	var ctx = document.getElementById("pdfEasy");
	var myLineChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: avgLabels,
	    datasets: [{
	      label: "Count",
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


	/// vPub Ease of use
	var that = this;
	var aStr = "{{vPubEaseOfUse}}";
	//alert();
	var aList = parseStringToArray(aStr);
	//alert(aList[0]);

	var i;
	var vals = [];
	for (i = 0; i < aList.length; i++){
		vals[i] = parseInt(aList[i],10);
	}
	
	var avgLabels = ["1","2", "3", "4", "5"];

	var yMax = Math.max(vals);
	
	// -- Bar Chart Example
	var ctx = document.getElementById("vPubEasy");
	var myLineChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: avgLabels,
	    datasets: [{
	      label: "Count",
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

