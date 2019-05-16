<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>걸음걸이 분석 결과</title>
	<link rel="stylesheet" type="text/css" href="css/resultPage.css">
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<!-- <script type="text/javascript" src="js/resultPage_js.js"></script> -->
	<script>
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		//google.charts.setOnLoadCallback(drawPieChart);
		google.charts.setOnLoadCallback(drawBarChart);
		data = 'hi'
		google.charts.setOnLoadCallback(function(){ drawPieChart(data) });
		
		/**
		 * 걸음걸이에 대한 분석 결과를 piechart로 뿌려주는 기능
		 */
		function drawPieChart(data) {
			//alert(data);
			var data = google.visualization.arrayToDataTable([
					[ '결과', 'percent' ], [ '정상', 11 ], [ '팔자걸음', 4 ],
					[ '안짱걸음', 2 ], [ '구부정한 자세', 2 ] ]);

			var chart = new google.visualization.PieChart(document
					.getElementById('piechart'));

			chart.draw(data);
		}

		/**
		 * 분석 결과로 판단되는 증상을 barchart로 뿌려주는 기능
		 */
		function drawBarChart() {
		  var data = google.visualization.arrayToDataTable([
		    ["증상", "%", { role: "style" } ],
		    ["치매", 60, "red"],
		    ["파킨슨병", 30, "yellow"],
		    ["알츠하이머", 10, "green"]
		  ]);

		  var view = new google.visualization.DataView(data);
		  view.setColumns([0, 1,
		                   { calc: "stringify",
		                     sourceColumn: 1,
		                     type: "string",
		                     role: "annotation" },
		                   2]);

		  var chart = new google.visualization.BarChart(document.getElementById("barchart"));
		  chart.draw(view);
		}
	</script>
</head>
<body>
	<div id="box">
		<video id="resultVideo" width="300" height="500" controls="controls">
			<!-- source 동영상 경로 필요! -->
			<source src="http://192.168.0.86/upload/application/sk/file_save/a.mp4">
		</video>
		<div id="resultDiv">
			<!-- 분석 결과 받아와야 함! -->
			<fieldset>
				<legend>분석 결과</legend>
				<p id="resultTxt">허리가 구부정하고 팔자걸음이 의심됩니다.</p>
				<div id="piechart"></div>
			</fieldset>
		</div>
		<!-- 정상 아닐 때만 띄우는걸로 -->
		<div id="symptomDiv">
			<!-- 분석 결과 받아와야 함! -->
			<fieldset>
				<legend>건강 관리 맞춤 Tip!</legend>
				<p id="symptomTxt">치매가 매우 의심됩니다.</p>
				<div id="barchart"></div>
			</fieldset>
		</div>
	</div>
</body>
</html>