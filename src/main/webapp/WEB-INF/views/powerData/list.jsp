<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="/WEB-INF/layouts/common.jsp" />
<script src="${ctx}/static/js/common.js" type="text/javascript" charset="UTF-8"></script>
<script src="${ctx}/static/js/My97DatePicker/WdatePicker.js"></script>
<title>历史数据</title>
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
			form1.action = "${ctx}/powerData";
			if (form1.pageno.options > 0) {
				form1.pageno.options[0].selected = true;
			}
			form1.submit();
		}
		
		if (flag == 'export') {
			form1.action = "${ctx}/powerData/export";
			if (form1.pageno.options > 0) {
				form1.pageno.options[0].selected = true;
			}
			form1.submit();
		}
	}
	$(function() {
		$("#selectAll").click(function() {
			var checked = $(this).is(":checked");
			if (checked) {
				$("[name='ids']").prop("checked", true);
			} else {
				$("[name='ids']").prop("checked", false);
			}
		});
		$("#breadcrumb").jBreadCrumb();
		document.getElementById('cdiv').scrollLeft = $("#scroll").val();
		//$("#stationNames").append("<option value=''>全部</option>");
		$('#citySelect').change(function(){ 
			$("#stationNames").empty(); 
			$("#stationNames").append("<option value=''>全部</option>");
			
			var cityId = $(this).children('option:selected').val(); 
			var url = "${ctx}/station/stationsByCityId/" + cityId;
			$.ajax({
				type : "post",
				async : true, 
				url : url,
				data : {},
				dataType : "json", 
				success : function(result) {
					if (result) {
						for(var i = 0; i < result.length; i ++){
							$("#stationNames").append("<option value='"+ result[i].id +"'>"+ result[i].name +"</option>");
						} 
					}
				},
				error : function(errorMsg) {
					
				}
			});
		}) 
		
		attachTipEvent(getClass('title_hover'),100); 
	});
	
	function move(type, id){
		var url = "${ctx}/episode/" + type + "/" + id;
		$.post(url, function(data){
			if(data && data == "success"){
				check('search');
			}
		});
	}
	
	function sort(flag){
		$("#scroll").val(document.getElementById('cdiv').scrollLeft);
		if($("#sortValue").val() == "desc"){
			$("#sortValue").val("asc");
		}else{
			$("#sortValue").val("desc");
		}
		$("#sortField").val(flag);
			
		/* var sortDiv = $("#" + flag + "SortDiv");
		if($("#sortValue").val() == "desc"){
			sortDiv.text("∨");
		}else{
			sortDiv.text("∧");
		} */
		form1.action = "${ctx}/powerData";
		form1.submit();
	}
</script>
<style type="text/css">
.sortable{cursor:pointer;background-position:right;background-repeat:no-repeat;padding-right:30px}
.both{background-image:url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAATCAQAAADYWf5HAAAAkElEQVQoz7X QMQ5AQBCF4dWQSJxC5wwax1Cq1e7BAdxD5SL+Tq/QCM1oNiJidwox0355mXnG/DrEtIQ6azioNZQxI0ykPhTQIwhCR+BmBYtlK7kLJYwWCcJA9M4qdrZrd8pPjZWPtOqdRQy320YSV17OatFC4euts6z39GYMKRPCTKY9UnPQ6P+GtMRfGtPnBCiqhAeJPmkqAAAAAElFTkSuQmCC')}
.asc{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAATCAYAAAByUDbMAAAAZ0lEQVQ4y2NgGLKgquEuFxBPAGI2ahhWCsS/gDibUoO0gPgxEP8H4ttArEyuQYxAPBdqEAxPBImTY5gjEL9DM+wTENuQahAvEO9DMwiGdwAxOymGJQLxTyD+jgWDxCMZRsEoGAVoAADeemwtPcZI2wAAAABJRU5ErkJggg==)}
.desc{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAATCAYAAAByUDbMAAAAZUlEQVQ4y2NgGAWjYBSggaqGu5FA/BOIv2PBIPFEUgxjB+IdQPwfC94HxLykus4GiD+hGfQOiB3J8SojEE9EM2wuSJzcsFMG4ttQgx4DsRalkZENxL+AuJQaMcsGxBOAmGvopk8AVz1sLZgg0bsAAAAASUVORK5CYII=)}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/layouts/header.jsp" />
	<div align="center" style="width: 100%">
		<div class="breadcrumbholder module" style="width: 90%;">
			<div id="breadcrumb" class="breadcrumb module" style="width: 100%; height: 33px;">
				<ul>
					<li><a href="${ctx}/<%=(String)session.getAttribute(IConstants.HOME)%>"></a></li>
					<li><span style="width: 60px; font-size: 12px;">历史数据</span></li>
				</ul>
			</div>
		</div>
		<br />
		<div style="width: 90%" align="center">
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-${msgType}"><button data-dismiss="alert" class="close">×</button>${message}</div>
			</c:if>
			<form name="form1" action="" method="post">
				<fieldset>
					<div class="panel panel-default" style="width: 100%; padding: 10px;">
						<table class="table">
							
							<tr>
								<td class="control-label" width="100px;" align="right" style="vertical-align: middle;border: 0px;">省份:</td>
								<td width="100px;" style="vertical-align: middle;border: 0px;">
									<select id="citySelect" name="station.pId" style="width: 160px;height: 25px;padding-top: 0px;" class="form-control">
										<option value="">全部</option>
										<c:forEach items="${citys}" var="item">
											<option value="${item.id}" <c:if test="${powerData.station.pId == item.id}">selected="selected"</c:if>>${item.name}</option>
										</c:forEach> 
									</select>
								</td>
								<td class="control-label" width="100px;" align="right" style="vertical-align: middle;border: 0px;">台站名称:</td>
								<td style="vertical-align: middle;border: 0px;" width="100px;">
								<!-- <input type="text" name="station.name" value="${powerData.station.name}" style="width: 160px;height: 25px;" class="form-control"> -->
								<select id="stationNames" name="station.id" style="width: 160px;height: 25px;padding-top: 0px;" class="form-control">
									<option value="">全部</option>
									<c:forEach items="${stations}" var="item">
										<option value="${item.id}" <c:if test="${powerData.station.id == item.id}">selected="selected"</c:if>>${item.name}</option>
									</c:forEach> 
								</select>
								</td>
								<!-- 
								<td class="control-label" width="100px;" align="right" style="vertical-align: middle;">台站编号:</td>
								<td style="vertical-align: middle;" width="100px;"><input type="text" name="station.id" value="${powerData.station.id}" style="width: 160px;height: 25px;" class="form-control"></td>
								 -->
								
								<td style="border: 0px;" colspan="2"></td>
							</tr>
							<tr> 
								<td class="control-label" width="100px;" align="right" style="vertical-align: middle;border: 0px;">起始时间:</td>
								<td width="100px;" style="vertical-align: middle;border: 0px;">
								<input type="text" name="start" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${powerData.start}" style="width: 160px;height: 25px;" readonly="readonly" class="form-control"/>
								</td>
								<td class="control-label" width="100px;" align="right" style="vertical-align: middle;border: 0px;">结束时间:</td>
								<td style="vertical-align: middle;border: 0px;" width="100px;">
								<input type="text" name="end" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${powerData.end}" style="width: 160px;height: 25px;" readonly="readonly" class="form-control"/>
								</td>
								<td style="vertical-align: middle;padding-left: 100px;border: 0px;" width="100px;"><button type="button" class="btn btn-primary" onclick="javascript:check('search');"><span class="glyphicon glyphicon-search"></span>&nbsp;检索</button></td>
								<td style="vertical-align: middle;padding-left: 10px;border: 0px;" width="100px;">
								<button type="button" class="btn btn-primary" onclick="javascript:check('export');"><span class="glyphicon glyphicon-export"></span>&nbsp;导出</button>
								</td>
								<td style="border: 0px;"></td>
							</tr>
						</table>
					</div>
				</fieldset>
				<input type="hidden" value="${powerData.scroll}" id="scroll" name="scroll">
				<input type="hidden" value="${powerData.sortField}" id="sortField" name="sortField">
				<input type="hidden" value="${powerData.sortValue}" id="sortValue" name="sortValue">
				<div id="cdiv" style="width: 100%;overflow: auto;border: 1px solid #ddd;">
				<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover" style="table-layout: fixed;width: 6000px;">
					<thead>
					
						<tr style="background-image: linear-gradient(to bottom, #fff 0, #fff 100%);" height="35px">
							<th class="textCenter hand th-inner sortable <c:choose><c:when test="${powerData.sortField == 'recvdatatime' and powerData.sortValue == 'desc'}">${powerData.sortValue}</c:when><c:when test="${powerData.sortField == 'recvdatatime' and powerData.sortValue == 'asc'}">${powerData.sortValue}</c:when><c:otherwise>both</c:otherwise></c:choose>" style="vertical-align: middle;" width="200px" onclick="javascript:sort('recvdatatime');">最近更新时间</th>
							<th class="textCenter hand th-inner sortable <c:choose><c:when test="${powerData.sortField == 'pId' and powerData.sortValue == 'desc'}">${powerData.sortValue}</c:when><c:when test="${powerData.sortField == 'pId' and powerData.sortValue == 'asc'}">${powerData.sortValue}</c:when><c:otherwise>both</c:otherwise></c:choose>" style="vertical-align: middle;" onclick="javascript:sort('pId');">省份</th>
							<th class="textCenter hand th-inner sortable <c:choose><c:when test="${powerData.sortField == 'id' and powerData.sortValue == 'desc'}">${powerData.sortValue}</c:when><c:when test="${powerData.sortField == 'id' and powerData.sortValue == 'asc'}">${powerData.sortValue}</c:when><c:otherwise>both</c:otherwise></c:choose>" style="vertical-align: middle;" onclick="javascript:sort('id');">台站编号</th>
							<th class="textCenter hand th-inner sortable <c:choose><c:when test="${powerData.sortField == 'name' and powerData.sortValue == 'desc'}">${powerData.sortValue}</c:when><c:when test="${powerData.sortField == 'name' and powerData.sortValue == 'asc'}">${powerData.sortValue}</c:when><c:otherwise>both</c:otherwise></c:choose>" style="vertical-align: middle;" width="200px" onclick="javascript:sort('name');">台站名称</th>
							<th class="textCenter hand th-inner sortable <c:choose><c:when test="${powerData.sortField == 'powerstatus' and powerData.sortValue == 'desc'}">${powerData.sortValue}</c:when><c:when test="${powerData.sortField == 'powerstatus' and powerData.sortValue == 'asc'}">${powerData.sortValue}</c:when><c:otherwise>both</c:otherwise></c:choose>" style="vertical-align: middle;" width="200px" onclick="javascript:sort('powerstatus');">运行模式</th>
							
							<th class="textCenter hand th-inner sortable <c:choose><c:when test="${powerData.sortField == 'devno' and powerData.sortValue == 'desc'}">${powerData.sortValue}</c:when><c:when test="${powerData.sortField == 'devno' and powerData.sortValue == 'asc'}">${powerData.sortValue}</c:when><c:otherwise>both</c:otherwise></c:choose>" style="vertical-align: middle;" onclick="javascript:sort('devno');">设备号</th>
							<th class="textCenter hand th-inner sortable <c:choose><c:when test="${powerData.sortField == 'ac' and powerData.sortValue == 'desc'}">${powerData.sortValue}</c:when><c:when test="${powerData.sortField == 'ac' and powerData.sortValue == 'asc'}">${powerData.sortValue}</c:when><c:otherwise>both</c:otherwise></c:choose>" style="vertical-align: middle;" onclick="javascript:sort('ac');">AC</th>
							<th class="textCenter hand th-inner sortable <c:choose><c:when test="${powerData.sortField == 'voltagesolarceel' and powerData.sortValue == 'desc'}">${powerData.sortValue}</c:when><c:when test="${powerData.sortField == 'voltagesolarceel' and powerData.sortValue == 'asc'}">${powerData.sortValue}</c:when><c:otherwise>both</c:otherwise></c:choose>" style="vertical-align: middle;" onclick="javascript:sort('voltagesolarceel');">太阳能电压</th>
							<th class="textCenter hand th-inner sortable <c:choose><c:when test="${powerData.sortField == 'supplyvoltage' and powerData.sortValue == 'desc'}">${powerData.sortValue}</c:when><c:when test="${powerData.sortField == 'supplyvoltage' and powerData.sortValue == 'asc'}">${powerData.sortValue}</c:when><c:otherwise>both</c:otherwise></c:choose>" style="vertical-align: middle;" onclick="javascript:sort('supplyvoltage');">供电电压</th>
							<th class="textCenter hand th-inner sortable <c:choose><c:when test="${powerData.sortField == 'supplycurrent' and powerData.sortValue == 'desc'}">${powerData.sortValue}</c:when><c:when test="${powerData.sortField == 'supplycurrent' and powerData.sortValue == 'asc'}">${powerData.sortValue}</c:when><c:otherwise>both</c:otherwise></c:choose>" style="vertical-align: middle;" onclick="javascript:sort('supplycurrent');">供电电流</th>
							<th class="textCenter hand th-inner sortable <c:choose><c:when test="${powerData.sortField == 'chargevoltage' and powerData.sortValue == 'desc'}">${powerData.sortValue}</c:when><c:when test="${powerData.sortField == 'chargevoltage' and powerData.sortValue == 'asc'}">${powerData.sortValue}</c:when><c:otherwise>both</c:otherwise></c:choose>" style="vertical-align: middle;" onclick="javascript:sort('chargevoltage');">充电电压</th>
							<th class="textCenter hand th-inner sortable <c:choose><c:when test="${powerData.sortField == 'chargecurrent' and powerData.sortValue == 'desc'}">${powerData.sortValue}</c:when><c:when test="${powerData.sortField == 'chargecurrent' and powerData.sortValue == 'asc'}">${powerData.sortValue}</c:when><c:otherwise>both</c:otherwise></c:choose>" style="vertical-align: middle;" onclick="javascript:sort('chargecurrent');">充电电流</th>
							<th class="textCenter hand th-inner sortable <c:choose><c:when test="${powerData.sortField == 'devtemp' and powerData.sortValue == 'desc'}">${powerData.sortValue}</c:when><c:when test="${powerData.sortField == 'devtemp' and powerData.sortValue == 'asc'}">${powerData.sortValue}</c:when><c:otherwise>both</c:otherwise></c:choose>" style="vertical-align: middle;" onclick="javascript:sort('devtemp');">设备温度</th>
							<th class="textCenter hand th-inner sortable <c:choose><c:when test="${powerData.sortField == 'envtemp' and powerData.sortValue == 'desc'}">${powerData.sortValue}</c:when><c:when test="${powerData.sortField == 'envtemp' and powerData.sortValue == 'asc'}">${powerData.sortValue}</c:when><c:otherwise>both</c:otherwise></c:choose>" style="vertical-align: middle;" onclick="javascript:sort('envtemp');">环境温度</th>
							<th class="textCenter hand th-inner sortable <c:choose><c:when test="${powerData.sortField == 'envhum' and powerData.sortValue == 'desc'}">${powerData.sortValue}</c:when><c:when test="${powerData.sortField == 'envhum' and powerData.sortValue == 'asc'}">${powerData.sortValue}</c:when><c:otherwise>both</c:otherwise></c:choose>" style="vertical-align: middle;" onclick="javascript:sort('envhum');">环境湿度</th>
							<th class="textCenter hand th-inner sortable <c:choose><c:when test="${powerData.sortField == 'chargesource' and powerData.sortValue == 'desc'}">${powerData.sortValue}</c:when><c:when test="${powerData.sortField == 'chargesource' and powerData.sortValue == 'asc'}">${powerData.sortValue}</c:when><c:otherwise>both</c:otherwise></c:choose>" style="vertical-align: middle;" onclick="javascript:sort('chargesource');">供电源</th>
							<th class="textCenter hand th-inner sortable <c:choose><c:when test="${powerData.sortField == 'supplyceel' and powerData.sortValue == 'desc'}">${powerData.sortValue}</c:when><c:when test="${powerData.sortField == 'supplyceel' and powerData.sortValue == 'asc'}">${powerData.sortValue}</c:when><c:otherwise>both</c:otherwise></c:choose>" style="vertical-align: middle;" onclick="javascript:sort('supplyceel');">供电电池组</th>
							<th class="textCenter" style="vertical-align: middle;">负载1电压</th>
							<th class="textCenter" style="vertical-align: middle;">负载1电流</th>
							<th class="textCenter" style="vertical-align: middle;">负载2电压</th>
							<th class="textCenter" style="vertical-align: middle;">负载2电流</th>
							<th class="textCenter" style="vertical-align: middle;">负载3电压</th>
							<th class="textCenter" style="vertical-align: middle;">负载3电流</th>
							<th class="textCenter" style="vertical-align: middle;">负载4电压</th>
							<th class="textCenter" style="vertical-align: middle;">负载4电流</th>
							<th class="textCenter" style="vertical-align: middle;">负载5电压</th>
							<th class="textCenter" style="vertical-align: middle;">负载5电流</th>
							
							<th class="textCenter" style="vertical-align: middle;">内阻A状态</th>
							<th class="textCenter" style="vertical-align: middle;">内阻A阴值</th>
							<th class="textCenter" style="vertical-align: middle;">内阻B状态</th>
							<th class="textCenter" style="vertical-align: middle;">内阻B阴值</th>
							<th class="textCenter" style="vertical-align: middle;">内阻C状态</th>
							<th class="textCenter" style="vertical-align: middle;">内阻C阴值</th>
							<th class="textCenter" style="vertical-align: middle;">内阻D状态</th>
							<th class="textCenter" style="vertical-align: middle;">内阻D阴值</th>
							
							<th class="textCenter" style="vertical-align: middle;">门磁</th>
							<th class="textCenter" style="vertical-align: middle;">红外</th>
							<th class="textCenter" style="vertical-align: middle;">浸水</th>
							<th class="textCenter" style="vertical-align: middle;">雷击</th>
							<th class="textCenter" style="vertical-align: middle;">SD卡</th>
							<th class="textCenter" style="vertical-align: middle;" width="300px">坐标</th>
							<th class="textCenter" style="vertical-align: middle;">IP地址</th>
							<th class="textCenter" style="vertical-align: middle;">端口号</th>
							<th class="textCenter" style="vertical-align: middle;" width="300px">下位机设备ping状态</th>
							<th class="textCenter" style="vertical-align: middle;" width="300px">冗余数采分钟值数据</th>
							
							
							
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.content}" var="content">
							<tr height="30px">
								<td class="textCenter">${content.recvdatatime}</td>
								<td class="textCenter">${content.station.city.name}</td>
								<td class="textCenter">${content.station.id}</td>
								<td class="textCenter">${content.station.name}</td>
								<td class="textCenter">
									<c:if test="${content.powerstatus == '0'}">隔供模式</c:if>
									<c:if test="${content.powerstatus == '1'}">市电停电</c:if>
									<c:if test="${content.powerstatus == '2'}">浮充模式</c:if>
									<c:if test="${content.powerstatus == '3'}">直供模式</c:if>
									<c:if test="${content.powerstatus == '4'}">充电故障</c:if>
									<c:if test="${content.powerstatus == '5'}">索数未回</c:if>
									<c:if test="${content.powerstatus == '6'}">通信中断</c:if>
									<c:if test="${content.powerstatus == '7'}">回数异常</c:if>
									<c:if test="${content.powerstatus == '8'}">工作端口连接不成功</c:if>
									<c:if test="${content.powerstatus == '9'}">正在获取电源信息...</c:if>
								</td>
								<td class="textCenter">${content.devno}</td>
								<td class="textCenter">${content.ac}</td>
								<td class="textCenter">${content.voltagesolarceel}</td>
								<td class="textCenter">${content.supplyvoltage}</td>
								<td class="textCenter">${content.supplycurrent}</td>
								<td class="textCenter">${content.chargevoltage}</td>
								<td class="textCenter">${content.chargecurrent}</td>
								<td class="textCenter">${content.devtemp}</td>
								
								<td class="textCenter">${content.envtemp}</td>
								<td class="textCenter">${content.envhum}</td>
								<td class="textCenter">
									<c:forEach items="${chargeSourceTypes}" var="item">
										<c:if test="${content.chargesource == item.key}">${item.value}</c:if>
									</c:forEach>
								</td>
								<td class="textCenter">
									<c:forEach items="${supplyCeelTypes}" var="item">
										<c:if test="${content.supplyceel == item.key}">${item.value}</c:if>
									</c:forEach>
								</td>
								
								<td class="textCenter">${content.loadvoltage1}</td>
								<td class="textCenter">${content.loadcurrent1}</td>
								<td class="textCenter">${content.loadvoltage2}</td>
								<td class="textCenter">${content.loadcurrent2}</td>
								<td class="textCenter">${content.loadvoltage3}</td>
								<td class="textCenter">${content.loadcurrent3}</td>
								<td class="textCenter">${content.loadvoltage4}</td>
								<td class="textCenter">${content.loadcurrent4}</td>
								<td class="textCenter">${content.loadvoltage5}</td>
								<td class="textCenter">${content.loadcurrent5}</td>
								
								
								<td class="textCenter">${content.innerstatus1}</td>
								<td class="textCenter">${content.innervalue1}</td>
								<td class="textCenter">${content.innerstatus2}</td>
								<td class="textCenter">${content.innervalue2}</td>
								<td class="textCenter">${content.innerstatus3}</td>
								<td class="textCenter">${content.innervalue3}</td>
								<td class="textCenter">${content.innerstatus4}</td>
								<td class="textCenter">${content.innervalue4}</td>
								
								
								<td class="textCenter">
									<c:if test="${content.flagdoor == 'Y'}">正常状态</c:if>
									<c:if test="${content.flagdoor == 'N'}">报警状态</c:if>
								</td>
								<td class="textCenter">
									<c:if test="${content.flagIR == 'Y'}">正常状态</c:if>
									<c:if test="${content.flagIR == 'N'}">报警状态</c:if>
								</td>
								<td class="textCenter">
									<c:if test="${content.flagwater == 'Y'}">正常状态</c:if>
									<c:if test="${content.flagwater == 'N'}">报警状态</c:if>
								</td>
								<td class="textCenter">
									<c:if test="${content.flaglight == 'Y'}">正常状态</c:if>
									<c:if test="${content.flaglight == 'N'}">报警状态</c:if>
								</td>
								<td class="textCenter">
									<c:if test="${content.flagSD == 'Y'}">已插入</c:if>
									<c:if test="${content.flagSD == 'N'}">未插入</c:if>
								</td>
								<td class="textCenter">${content.station.lat}, ${content.station.lng}</td>
								<td class="textCenter">${content.station.ip}</td>
								<td class="textCenter">${content.station.port}</td>
								
								<td class="textCenter">${content.pingstatus}</td>
								<td class="textCenter">${content.thdccminvalue}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
				<br />
				<jsp:include page="/page/page.jsp" />
				
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/layouts/footer.jsp" />
</body>
</html>