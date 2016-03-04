<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>line</title>
</head>
<body>
	<div id="main" style="height: 400px"></div>
	<script src="${ctx}/static/js/jquery.min.js"></script>
	<script src="${ctx}/static/js/echarts.js"></script>
	<script type="text/javascript" language="javascript">
		var myChart;
		var eCharts;
		require.config({
					paths : {
						echarts: '${ctx}/static/js'
					}
				});
		require([ 'echarts',
		            'echarts/chart/bar',
		            'echarts/chart/line' ], drawEChart 
		);
		function drawEChart(ec) {
			eCharts = ec;
			myChart = eCharts.init(document.getElementById('main'));
			myChart.showLoading({
				text : "图表数据正在努力加载..."
			});
			var options = {
				title : {
					text : "未来一周气温变化",
					subtext : "纯属虚构",
					sublink : "http://www.baidu.com"
				},
				tooltip : {
					trigger : 'axis'
				},
				legend : {
					data : [ "最高气温" ]
				},
				toolbox : {
					show : true,
					feature : {
						mark : {
							show : true
						},
						dataView : {
							show : true,
							readOnly : false
						},
						magicType : {
							show : true,
							type : [ 'line', 'bar' ]
						},
						restore : {
							show : true
						},
						saveAsImage : {
							show : true
						}
					}
				},
				calculable : true,
				xAxis : [ {
					type : 'category',
					boundaryGap : false,
					data : [ '1', '2', '3', '4', '5', '6', '7' ]
				} ],
				yAxis : [ {
					type : 'value',
					axisLabel : {
						formatter : '{value} °C'
					},
					splitArea : {
						show : true
					}
				} ],
				grid : {
					width : '90%'
				},
				series : [ {
					name : '最高气温',
					type : 'line',
					data : [ 11, 22, 33, 44, 55, 33, 44 ],//必须是Integer类型的,String计算平均值会出错
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
					markLine : {
						data : [ {
							type : 'average',
							name : '平均值'
						} ]
					}
				} ]
			};
			myChart.setOption(options); 
			myChart.hideLoading();
			getChartData();
		}
		function getChartData() {
			var options = myChart.getOption();
			$.ajax({
				type : "post",
				async : false, 
				url : "${ctx}/report/watchTimeAllUser1",
				data : {},
				dataType : "json", 
				success : function(result) {
					if (result) {
						options.legend.data = result.legend;
						options.xAxis[0].data = result.category;
						options.series[0].data = result.series[0].data;
						myChart.hideLoading();
						myChart.setOption(options);
					}
				},
				error : function(errorMsg) {
					alert("图表请求数据失败!");
					myChart.hideLoading();
				}
			});
		}
	</script>
</body>
</html>