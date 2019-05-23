<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
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
		google.charts.setOnLoadCallback(drawPieChart);
		//google.charts.setOnLoadCallback(drawBarChart);
		//data = 'hi'
		//google.charts.setOnLoadCallback(function(){ drawPieChart(data) });
		
		/**
		 * 걸음걸이에 대한 분석 결과를 piechart로 뿌려주는 기능
		 */
		function drawPieChart() {
			var data = google.visualization.arrayToDataTable([
					[ '결과', 'percent' ], [ '정상', 11 ], [ '팔자걸음', 4 ],
					[ '거북목', 2 ], [ '구부정한 자세', 1 ] ]);

			var chart = new google.visualization.PieChart(document
					.getElementById('piechart'));

			chart.draw(data);
		}

		/**
		 * 분석 결과로 판단되는 증상을 barchart로 뿌려주는 기능
		 */
		function drawBarChart() {
		  var data = google.visualization.arrayToDataTable([
		    ["부위", "정도", { role: "style" } ],
		    ["걸음걸이", 70, "red"],
		    ["목", 30, "yellow"],
		    ["허리", 10, "green"]
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
	<div id="bar">
		
	</div>
	<div id="box">
		<video id="resultVideo" width="300" height="500" controls="controls">
			<!-- source 동영상 경로 필요! -->
			<source src="http://192.168.0.25/upload/application/sk/Video/a_result.mp4">
		</video>
		<div id="resultDiv">
			<fieldset>
				<legend>분석 결과</legend>
				<p id="resultTxt"></p>
				<div id="piechart"></div>
			</fieldset>
		</div>
		<!-- 정상 아닐 때만 띄우는걸로 -->
		<div id="symptomDiv">
			<fieldset>
				<legend>교정이 필요하다고 분석된 부위</legend>
				<div id="barchart">
					<div id="barbox">
						<table>
							<tr>
								<td></td>
								<td><div><p class="guide" style="border-left: 1px solid gray">의심</p><p class="guide">주의</p><p class="guide">위험</p></div></td>
							</tr>
							<tr>
								<td>걸음걸이</td>
								<td><div class="bar" style="width: 80%; background-color: red"></div></td>
							</tr>
							<tr>
								<td>거북목</td>
								<td><div class="bar" style="width: 40%; background-color: yellow"></div></td>
							</tr>
							<tr>
								<td>허리</td>
								<td><div class="bar" style="width: 10%; background-color: green"></div></td>
							</tr>
						</table>
					</div>
				</div>
			</fieldset>
		</div>
		<div id="adviceDiv">
			<fieldset>
				<legend>건강 관리 맞춤 Tip!</legend>
				<div id="videoDiv">
					<iframe width="727" height="409" src="https://www.youtube.com/embed/vrshvg0yztc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					<!-- <iframe src="https://www.youtube.com/embed/iRuID9T3xC4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
				</div>
			</fieldset>
		</div>
	</div>
</body>
</html>