<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="/WEB-INF/layouts/common.jsp" />
<title>报表管理</title>
<script type="text/javascript">
	function check(flag) {
		if (flag == 'del') {
			if ($("input[name='ids']:checked").length == 0) {
				showDialog("未选中任何记录！");
			} else {
				bootbox
						.dialog({
							message : "是否确认删除！",
							title : "<strong>警告</strong>",
							buttons : {
								danger : {
									label : "<span class='glyphicon glyphicon-ok'></span>&nbsp;确定",
									className : "btn-danger",
									callback : function() {
										form1.action = "${ctx}/episode/delete";
										form1.submit();
									}
								},
								main : {
									label : "<span class='glyphicon glyphicon-remove'></span>&nbsp;取消",
									className : "btn btn-primary",
									callback : function() {
									}
								}
							}
						});
			}
		}
		if (flag == 'search') {
			form1.action = "${ctx}/episode";
			if (form1.pageno.options > 0) {
				form1.pageno.options[0].selected = true;
			}
			form1.submit();
		}
	}
	$(function() {
		$("#selectAll").click(function() {
			var checked = $(this).attr("checked");
			if (checked && checked == "checked") {
				$("[name='ids']").attr("checked", "checked");
			} else {
				$("[name='ids']").removeAttr("checked");
			}
		});
		$("#breadcrumb").jBreadCrumb();
	});
</script>
</head>
<body style="min-width: 1000px;">
	<div align="center" style="width: 100%">
		<div style="width: 100%" align="center">
		<fieldset>
			<div class="panel panel-default" style="width: 100%; padding: 10px;">
				<table class="table">
					<tr>
						<td class="control-label" width="100px;" align="right" style="vertical-align: middle;">报表类型:</td>
						<td width="100px;" style="vertical-align: middle;">
							<select id="changeReport" style="width: 240px;height: 25px;padding-top: 0px;" class="form-control">
								<option value="1">节目观看总时长、总次数图表</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
		</fieldset>
			<div id="main" style="height:500px;border:1px solid #ccc;padding:10px;"></div>
			</div>
		</div>
	<script src="<%=IConstants.imgResPath %>resources/manager/static/js/echarts.js"></script>
	<script type="text/javascript">
		$("#changeReport").change(function(){
			getChartData(this.value);
		});
	
		var myChart;
		var eCharts;
		require.config({
					paths : {
						echarts: '<%=IConstants.imgResPath %>resources/manager/static/js'
					}
				});
		require([ 'echarts',
		            'echarts/chart/bar',
		            'echarts/chart/line' ], drawEChart 
		);
		
		var options = {
				title : {
					text : "",
					subtext : "",
					sublink : ""
				},
				tooltip : {
					trigger : 'axis'
				},
				legend : {
					data : []
				},
				toolbox : {
					show : true,
					feature : {
						dataView : {
							show : true,
							readOnly : true,
							optionToContent: function(opt) {
			                    var axisData = opt.xAxis[0].data;
			                    var series = opt.series;
			                    var table = '<table class="table" style="width:100%;text-align:center"><tbody><tr>'
			                                 + '<td>节目</td>'
			                                 + '<td>' + series[0].name + '</td>'
			                                 + '<td>' + series[1].name + '</td>'
			                                 + '</tr>';
			                    for (var i = 0, l = axisData.length; i < l; i++) {
			                        table += '<tr>'
			                                 + '<td>' + axisData[i] + '</td>'
			                                 + '<td>' + series[0].data[i] + '</td>'
			                                 + '<td>' + series[1].data[i] + '</td>'
			                                 + '</tr>';
			                    }
			                    table += '</tbody></table>';
			                    return table;
			                }
						}
					}
				},
				calculable : false,
				dataZoom:{
					orient:"horizontal", 
					show:true, 
					start:0, 
					end:100  
					},
				xAxis : [ {
					type : 'category',
					data : []
				} ],
				yAxis : [ {
					type : 'value',
					position: 'left',
					axisLabel : {
						formatter : ''
					},
					splitArea : {
						show : true
					}
				},
				{
		            type : 'value',
		            axisLabel : {
		            	formatter : ''
		            },
		            splitLine : {
		                show: false
		            }
		        }
				],
				series : [ {
					name : '',
					type : '',
					data : []
				},
				{
		            name:'',
		            type: '',
		            yAxisIndex: 1,
		            data: []
		        },
				
				]
			};
		
		function drawEChart(ec) {
			eCharts = ec;
			myChart = eCharts.init(document.getElementById('main'));
			myChart.showLoading({
				text : "图表数据正在加载..."
			});
			
			getChartData(1);
			myChart.setOption(options); 
			myChart.hideLoading();
		}
		function getChartData(flag) {
			var url = "";
			myChart.clear();
		
			if(flag == 1){
				options.title.text = "节目观看总时长、总次数图表";
				options.yAxis[0].axisLabel.formatter = "{value} 秒";
				options.yAxis[1].axisLabel.formatter = "{value} 次";
				url = "${ctx}/report/watchTimeAllProgramData";
			}
			if(flag == 2){
				options.title.text = "节目详细统计图表";
				options.yAxis[0].axisLabel.formatter = "{value} 秒";
				options.yAxis[1].axisLabel.formatter = "{value} 次";
				url = "${ctx}/report/watchTimeAllProgramData";
			}
			
			$.ajax({
				type : "post",
				async : false, 
				url : url,
				data : {},
				dataType : "json", 
				success : function(result) {
					if (result) {
						options.legend.data = result.legend;
						options.xAxis[0].data = result.category;
						options.series[0].name = result.series[0].name;
						options.series[0].type = result.series[0].type;
						options.series[0].data = result.series[0].data;
						options.series[1].name = result.series[1].name;
						options.series[1].type = result.series[1].type;
						options.series[1].data = result.series[1].data;
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