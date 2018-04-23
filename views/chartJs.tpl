<script type="text/javascript">
function buildPieChart(chartLabels,chartData,id) {
	var that = this;

	var ctx = document.getElementById(id);
	var myPieChart = new Chart(ctx, {
	  type: 'doughnut',
	  data: {
	    labels: chartLabels,
	    color: '#56BE99',
	    datasets: [{
	      data: chartData,
	      backgroundColor: ['#56BF9A', '#818285'],
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
	var gadgetColorGreen = "#56BF9A";
	var gadgetColorGrey = "#818285";

	var android = parseInt("{{androidUsers}}",10);
	var iOS = 30 - android;
	var chartLabels = [" Android"," iOS"];
	var chartData = [android,iOS];
	buildPieChart(chartLabels,chartData,"androidOsPieChart");

	var aList = parseStringToArray("{{davidVrobin}}");
	var chartLabels = [" vPub", " PDF"];
	var chartData = [18,2];
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
	
	var avgLabels = ["PDF USH", "PDF HITM", "vPub USH", "vPub HITM"];

	var yMax = Math.max(vals);

	// -- Bar Chart Example
	var ctx = document.getElementById("averageTimePerTask");
	var myLineChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: avgLabels,
	    datasets: [{
	      label: "Seconds",
	      backgroundColor: gadgetColorGreen,
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
	        },
	        scaleLabel: {
		        display: true,
		        labelString: 'Textbook'
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
	        },
	        scaleLabel: {
		        display: true,
		        labelString: 'Average Time (Seconds)'
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
	      backgroundColor: gadgetColorGreen,
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
	        },
	        scaleLabel: {
		        display: true,
		        labelString: 'Textbook'
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
	        },
	        scaleLabel: {
		        display: true,
		        labelString: 'Average Time (Seconds)'
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

	var bStr = "{{vPubEaseOfUse}}";
	//alert();
	var bList = parseStringToArray(bStr);
	//alert(aList[0]);

	var i;
	var valsVpub = [];
	for (i = 0; i < bList.length; i++){
		valsVpub[i] = parseInt(bList[i],10);
	}
	
	var avgLabels = ["1","2", "3", "4", "5"];
	var pdfMax = Math.max(vals);
	var vpubMax = Math.max(valsVpub);
	var yMax = Math.max(pdfMax,vpubMax);
	
	// -- Bar Chart Example
	var ctx = document.getElementById("pdfEasy");
	var myLineChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: avgLabels,
	    datasets: [{
	      label: "PDF",
	      backgroundColor: gadgetColorGrey,
	      borderColor: "rgba(2,117,216,1)",
	      data: vals
	  	},{
	      label: "vPub",
	      backgroundColor: gadgetColorGreen,
	      borderColor: "rgba(2,117,216,1)",
	      data: valsVpub,
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
	        },
	        scaleLabel: {
		        display: true,
		        labelString: 'Rating 1 to 5 (1-Hard; 5-Easy)'
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
	        },
	        scaleLabel: {
		        display: true,
		        labelString: 'Count'
		    }
	      }],
	    },
	    legend: {
	      display: true
	    }
	  }
	});


	//Create scatter plot

	/// Pdf Ease of use
	var that = this;
	var tasksCompletedPdf = "{{averageTaskCompletedPdf}}";
	var tasksCompletedVPub = "{{averageTaskCompletedVPub}}";
	var totalTimeVPub = "{{vPubTimeTest1}}";

	//alert();
	var pdfList = parseStringToArray(tasksCompletedPdf);
	var vPubList = parseStringToArray(tasksCompletedVPub);
	var vPubTimeList = parseStringToArray(totalTimeVPub);
	//alert(aList[0]);
	console.log(vPubList.length)

	var i;
	var valsPDF = [];
	var valsVpub = [];
	var timeValsVPub = [];
	var timeValsPDF = [];
	for (i = 0; i < vPubList.length; i++){
		valsPDF[i] = parseInt(pdfList[i],10);
		valsVpub[i] = parseInt(vPubList[i],10);
		timeValsVPub[i] = parseInt(vPubTimeList[i],10);
		timeValsPDF[i] = 360;
	}

	var xLabels = ['0','1','2','3','4','5','6','7','8'];
	var yVPub = [0,0,0,0,0,0,0,0,0];
	var yPdf = [0,0,0,0,0,0,0,0,0];
	for (i = 0; i < 30; i++){
		//if val
		yPdf[valsPDF[i]] = yPdf[valsPDF[i]] + 1;
		yVPub[valsVpub[i]] = yVPub[valsVpub[i]] + 1;
	}
	//alert(valsVpub);
		// -- Bar Chart Example
	var ctx = document.getElementById("tasksCompleted");
	var myLineChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: xLabels,
	    datasets: [{
	      label: "PDF",
	      backgroundColor: gadgetColorGrey,
	      borderColor: "rgba(2,117,216,1)",
	      data: yPdf
	  	},{
	      label: "vPub",
	      backgroundColor: gadgetColorGreen,
	      borderColor: "rgba(2,117,216,1)",
	      data: yVPub,
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
	        },
	        scaleLabel: {
		        display: true,
		        labelString: 'Tasks Completed'
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
	        },
	        scaleLabel: {
		        display: true,
		        labelString: 'Count'
		    }
	      }],
	    },
	    legend: {
	      display: true
	    }
	  }
	});





	// var xtimeList = [0,60,120,180,240,300,360];
	// var taskData = []

	// for (i = 0; i < valsPDF.length; i++){
	// 	taskData = {
	// 		x: valsPDF[i],
	// 		y: timeValsPDF[i]
	// 	}
	// }

	// var scatterChart = new Chart(ctx, {
	//     type: 'scatter',
	//     data: {
	//         datasets: [{
	//             label: 'Scatter Dataset',
	//             data: [{
	//                 x: -10,
	//                 y: 0
	//             }, {
	//                 x: 0,
	//                 y: 10
	//             }, {
	//                 x: 10,
	//                 y: 5
	//             }]
	//         }]
	//     },
	//     options: {
	//         scales: {
	//             xAxes: [{
	//                 type: 'linear',
	//                 position: 'bottom'
	//             }]
	//         }
	//     }
	// });


	/// vPub Ease of use
	// var that = this;
	// var aStr = "{{vPubEaseOfUse}}";
	// //alert();
	// var aList = parseStringToArray(aStr);
	// //alert(aList[0]);

	// var i;
	// var vals = [];
	// for (i = 0; i < aList.length; i++){
	// 	vals[i] = parseInt(aList[i],10);
	// }
	
	// var avgLabels = ["1","2", "3", "4", "5"];

	// var yMax = Math.max(vals);
	
	// -- Bar Chart Example
	// var ctx = document.getElementById("vPubEasy");
	// var myLineChart = new Chart(ctx, {
	//   type: 'bar',
	//   data: {
	//     labels: avgLabels,
	//     datasets: [{
	//       label: "Count",
	//       backgroundColor: gadgetColorGreen,
	//       borderColor: "rgba(2,117,216,1)",
	//       data: vals,
	//     }],
	//   },
	//   options: {
	//     scales: {
	//       xAxes: [{
	//         time: {
	//           unit: 'amount'
	//         },
	//         gridLines: {
	//           display: false
	//         },
	//         ticks: {
	//           maxTicksLimit: 6
	//         }
	//       }],
	//       yAxes: [{
	//         ticks: {
	//           min: 0,
	//           max: that.yMax,
	//           maxTicksLimit: (that.yMax)/2
	//         },
	//         gridLines: {
	//           display: true
	//         }
	//       }],
	//     },
	//     legend: {
	//       display: false
	//     }
	//   }
	// });

}

</script>

