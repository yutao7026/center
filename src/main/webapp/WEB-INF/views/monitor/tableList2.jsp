<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="/WEB-INF/layouts/common.jsp" />
<script src="${ctx}/static/js/common.js" type="text/javascript" charset="UTF-8"></script>
<title>状态列表</title>
<script type="text/javascript">
function check(flag) {
	if (flag == 'search') {
		form1.action = "${ctx}/monitor/tableList";
		form1.submit();
	}
}

$(function(){
	$("#breadcrumb").jBreadCrumb();
	setInterval(getData, 30000);
	getData();
	$("#table").bootstrapTable('refreshOptions', {
        });
});

function getTextByStatus(status){
	//0.隔供模式   Color.FromArgb(51, 153, 0);#339900
	//1.市电停电   Color.Red#FF0000
	//2.浮充模式  Color.FromArgb(51, 204, 255);#33ccff
	//3.直供模式  Color.Blue;#0000FF
	//4.充电故障   Color.Pink;#FFC0CB
	//5.索数未回   Color.FromArgb(51, 255, 51);#33ff33
	//6.通信中断   Color.FromArgb(255, 153, 42);#ff992a
	//7.回数异常   Color.FromArgb(165, 42, 42);#a52a2a
	//8.工作端口连接不成功  Color.Black;#000000
	//9.正在获取电源信息...";  Color.NavajoWhite;#FFDEAD
	var obj = new Object();
	if(status == "0"){
		obj.text = "隔供模式";
		obj.color = "#339900";
	}else if(status == "1"){
		obj.text = "市电停电";
		obj.color = "#FF0000";
	}else if(status == "2"){
		obj.text = "浮充模式";
		obj.color = "#33ccff";
	}else if(status == "3"){
		obj.text = "直供模式";
		obj.color = "#0000FF";
	}else if(status == "4"){
		obj.text = "充电故障";
		obj.color = "#FFC0CB";
	}else if(status == "5"){
		obj.text = "索数未回";
		obj.color = "#33ff33";
	}else if(status == "6"){
		obj.text = "通信中断";
		obj.color = "#ff992a";
	}else if(status == "7"){
		obj.text = "回数异常";
		obj.color = "#a52a2a";
	}else if(status == "8"){
		obj.text = "工作端口连接不成功";
		obj.color = "#000000";
	}else if(status == "9"){
		obj.text = "正在获取电源信息...";
		obj.color = "#FFDEAD";
	}else{
		return "";
	}
	
	return obj;
	
}

function chargesourceText(type){
	if(type == "A"){
		return "AC充电";
	}else if(type == "B"){
		return "太阳能充电";
	}else if(type == "Z"){
		return "未充电";
	}else{
		return "";
	}
}
function supplyceelText(type){
	if(type == "C"){
		return "A组电池";
	}else if(type == "D"){
		return "B组电池";
	}else if(type == "Y"){
		return "电池未接入";
	}else{
		return "";
	}
}

function statusText(type){
	if(type == "Y"){
		return "正常状态";
	}else if(type == "N"){
		return "报警状态";
	}else{
		return "";
	}
}

function sdText(type){
	if(type == "Y"){
		return "已插入";
	}else if(type == "N"){
		return "未插入";
	}else{
		return "";
	}
}
var rows = [];
function getData(){
	var url = "${ctx}/monitor/powerData?time=" + new Date().getTime();
	$.ajax({
		type : "post",
		async : true, 
		url : url,
		data : {},
		dataType : "json", 
		success : function(result) {
			$("#divTable").css({"visibility":"visible"});
			if (result) {
				
				rows = [];
				for(var i = 0; i < result.length; i ++){
					var random = Math.floor(Math.random() * 10);
					//result[i].powerstatus = random;
					var obj = getTextByStatus(result[i].powerstatus);
					
					rows.push({
						city: color(obj.color, result[i].station.city.name),
		                id: color(obj.color, result[i].stationId),
		                name: color(obj.color, result[i].station.name),
		                powerstatus: color(obj.color, obj.text),
		                devno: color(obj.color, result[i].devno == null? "" : result[i].devno),
		                
		                ac: color(obj.color, result[i].ac == null? "" : result[i].ac),
		                voltagesolarceel: color(obj.color, result[i].voltagesolarceel == null? "" : result[i].voltagesolarceel),
		                supplyvoltage: color(obj.color, result[i].supplyvoltage == null? "" : result[i].supplyvoltage),
		                supplycurrent: color(obj.color, result[i].supplycurrent == null? "" : result[i].supplycurrent),
		                chargevoltage: color(obj.color, result[i].chargevoltage == null? "" : result[i].chargevoltage),
		                chargecurrent: color(obj.color, result[i].chargecurrent == null? "" : result[i].chargecurrent),
		                devtemp: color(obj.color, result[i].devtemp == null? "" : result[i].devtemp),
		                envtemp: color(obj.color, result[i].envtemp == null? "" : result[i].envtemp),
		                envhum: color(obj.color, result[i].envhum == null? "" : result[i].envhum),
		                chargesource: color(obj.color, result[i].chargesource == null? "" : chargesourceText(result[i].chargesource)),
		                supplyceel: color(obj.color, result[i].supplyceel == null? "" : supplyceelText(result[i].supplyceel)),
		                
		                loadvoltage1: color(obj.color, result[i].loadvoltage1 == null? "" : result[i].loadvoltage1),
		                loadcurrent1: color(obj.color, result[i].loadcurrent1 == null? "" : result[i].loadcurrent1),
		                loadvoltage2: color(obj.color, result[i].loadvoltage2 == null? "" : result[i].loadvoltage2),
		                loadcurrent2: color(obj.color, result[i].loadcurrent2 == null? "" : result[i].loadcurrent2),
		                loadvoltage3: color(obj.color, result[i].loadvoltage3 == null? "" : result[i].loadvoltage3),
		                loadcurrent3: color(obj.color, result[i].loadcurrent3 == null? "" : result[i].loadcurrent3),
		                loadvoltage4: color(obj.color, result[i].loadvoltage4 == null? "" : result[i].loadvoltage4),
		                loadcurrent4: color(obj.color, result[i].loadcurrent4 == null? "" : result[i].loadcurrent4),
		                loadvoltage5: color(obj.color, result[i].loadvoltage5 == null? "" : result[i].loadvoltage5),
		                loadcurrent5: color(obj.color, result[i].loadcurrent5 == null? "" : result[i].loadcurrent5),
		                
		                innerstatus1: color(obj.color, result[i].innerstatus1 == null? "" : result[i].innerstatus1),
		                innervalue1: color(obj.color, result[i].innervalue1 == null? "" : result[i].innervalue1),
		                innerstatus2: color(obj.color, result[i].innerstatus2 == null? "" : result[i].innerstatus2),
		                innervalue2: color(obj.color, result[i].innervalue2 == null? "" : result[i].innervalue2),
		                innerstatus3: color(obj.color, result[i].innerstatus3 == null? "" : result[i].innerstatus3),
		                innervalue3: color(obj.color, result[i].innervalue3 == null? "" : result[i].innervalue3),
		                innerstatus4: color(obj.color, result[i].innerstatus4 == null? "" : result[i].innerstatus4),
		                innervalue4: color(obj.color, result[i].innervalue4 == null? "" : result[i].innervalue4),
		                
		                flagdoor: color(obj.color, result[i].flagdoor == null? "" : statusText(result[i].flagdoor)),
		                flagIR: color(obj.color, result[i].flagIR == null? "" : statusText(result[i].flagIR)),
		                flagwater: color(obj.color, result[i].flagwater == null? "" : statusText(result[i].flagwater)),
		                flaglight: color(obj.color, result[i].flaglight == null? "" : statusText(result[i].flaglight)),
		                flagSD: color(obj.color, result[i].flagSD == null? "" : sdText(result[i].flagSD)),
		                
		                recvdatatime: color(obj.color, result[i].recvdatatime == null? "" : result[i].recvdatatime),
		                
						zbdz: color(obj.color, result[i].station.lat + ", " + result[i].station.lng),
		                ip: color(obj.color, result[i].station.ip == null? "" : result[i].station.ip),
		                port: color(obj.color, result[i].station.port == null? "" : result[i].station.port),
		                
		                
		                pingstatus: color(obj.color, result[i].pingstatus == null? "" : result[i].pingstatus),
		                thdccminvalue: color(obj.color, result[i].thdccminvalue == null? "" : result[i].thdccminvalue)
		                
		            }); 
					/*
					$("#" + result[i].stationId + "_powerstatus").text(obj.text);
					$("#" + result[i].stationId + "_tr").css({"color":obj.color});
					$("#" + result[i].stationId + "_devno").text(result[i].devno == null? "" : result[i].devno);
					$("#" + result[i].stationId + "_ac").text(result[i].ac == null? "" : result[i].ac);
					$("#" + result[i].stationId + "_voltagesolarceel").text(result[i].voltagesolarceel == null? "" : result[i].voltagesolarceel);
					$("#" + result[i].stationId + "_supplyvoltage").text(result[i].supplyvoltage == null? "" : result[i].supplyvoltage);
					$("#" + result[i].stationId + "_supplycurrent").text(result[i].supplycurrent == null? "" : result[i].supplycurrent);
					$("#" + result[i].stationId + "_chargevoltage").text(result[i].chargevoltage == null? "" : result[i].chargevoltage);
					$("#" + result[i].stationId + "_chargecurrent").text(result[i].chargecurrent == null? "" : result[i].chargecurrent);
					$("#" + result[i].stationId + "_devtemp").text(result[i].devtemp == null? "" : result[i].devtemp);
					$("#" + result[i].stationId + "_envtemp").text(result[i].envtemp == null? "" : result[i].envtemp);
					$("#" + result[i].stationId + "_envhum").text(result[i].envhum == null? "" : result[i].envhum);
					
					$("#" + result[i].stationId + "_chargesource").text(result[i].chargesource == null? "" : chargesourceText(result[i].chargesource));
					$("#" + result[i].stationId + "_supplyceel").text(result[i].supplyceel == null? "" : supplyceelText(result[i].supplyceel));
				
					$("#" + result[i].stationId + "_loadvoltage1").text(result[i].loadvoltage1 == null? "" : result[i].loadvoltage1);
					$("#" + result[i].stationId + "_loadcurrent1").text(result[i].loadcurrent1 == null? "" : result[i].loadcurrent1);
					$("#" + result[i].stationId + "_loadvoltage2").text(result[i].loadvoltage2 == null? "" : result[i].loadvoltage2);
					$("#" + result[i].stationId + "_loadcurrent2").text(result[i].loadcurrent2 == null? "" : result[i].loadcurrent2);
					$("#" + result[i].stationId + "_loadvoltage3").text(result[i].loadvoltage3 == null? "" : result[i].loadvoltage3);
					$("#" + result[i].stationId + "_loadcurrent3").text(result[i].loadcurrent3 == null? "" : result[i].loadcurrent3);
					$("#" + result[i].stationId + "_loadvoltage4").text(result[i].loadvoltage4 == null? "" : result[i].loadvoltage4);
					$("#" + result[i].stationId + "_loadcurrent4").text(result[i].loadcurrent4 == null? "" : result[i].loadcurrent4);
					$("#" + result[i].stationId + "_loadvoltage5").text(result[i].loadvoltage5 == null? "" : result[i].loadvoltage5);
					$("#" + result[i].stationId + "_loadcurrent5").text(result[i].loadcurrent5 == null? "" : result[i].loadcurrent5);
					
					$("#" + result[i].stationId + "_innerstatus1").text(result[i].innerstatus1 == null? "" : result[i].innerstatus1);
					$("#" + result[i].stationId + "_innervalue1").text(result[i].innervalue1 == null? "" : result[i].innervalue1);
					$("#" + result[i].stationId + "_innerstatus2").text(result[i].innerstatus2 == null? "" : result[i].innerstatus2);
					$("#" + result[i].stationId + "_innervalue2").text(result[i].innervalue2 == null? "" : result[i].innervalue2);
					$("#" + result[i].stationId + "_innerstatus3").text(result[i].innerstatus3 == null? "" : result[i].innerstatus3);
					$("#" + result[i].stationId + "_innervalue3").text(result[i].innervalue3 == null? "" : result[i].innervalue3);
					$("#" + result[i].stationId + "_innerstatus4").text(result[i].innerstatus4 == null? "" : result[i].innerstatus4);
					$("#" + result[i].stationId + "_innervalue4").text(result[i].innervalue4 == null? "" : result[i].innervalue4);
					
					$("#" + result[i].stationId + "_flagdoor").text(result[i].flagdoor == null? "" : statusText(result[i].flagdoor));
					$("#" + result[i].stationId + "_flagIR").text(result[i].flagIR == null? "" : statusText(result[i].flagIR));
					$("#" + result[i].stationId + "_flagwater").text(result[i].flagwater == null? "" : statusText(result[i].flagwater));
					$("#" + result[i].stationId + "_flaglight").text(result[i].flaglight == null? "" : statusText(result[i].flaglight));
					$("#" + result[i].stationId + "_flagSD").text(result[i].flagSD == null? "" : sdText(result[i].flagSD));
					
					$("#" + result[i].stationId + "_recvdatatime").text(result[i].recvdatatime == null? "" : result[i].recvdatatime);
					
					$("#" + result[i].stationId + "_pingstatus").text(result[i].pingstatus == null? "" : result[i].pingstatus);
					$("#" + result[i].stationId + "_thdccminvalue").text(result[i].thdccminvalue == null? "" : result[i].thdccminvalue);
					*/
				}
				
			}
			$('#table').bootstrapTable('load', rows);
			$('#table').bootstrapTable('resetView');
		},
		error : function(errorMsg) {
			
		}
	});
	
}
	function sort(flag){
		alert(flag);
	}
	
	function color(color, id){
		return "<font color='"+ color +"'>" + id + "<font>";
	}
	
	function sorter(a, b) {
        a = a.substring(a.indexOf(">") + 1); // remove $
        b = b.substring(b.indexOf(">") + 1);
        a = a.substring(0, a.indexOf("<"));
        b = b.substring(0, b.indexOf("<"));
        if (a > b) return 1;
        if (a < b) return -1;
        return 0;
    }
	
</script>

<link rel="stylesheet" type="text/css" href="${ctx}/static/style/bootstrap-table.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/layouts/header.jsp" />
	<div align="center" style="width: 100%">
		<div class="breadcrumbholder module" style="width: 90%;">
			<div id="breadcrumb" class="breadcrumb module" style="width: 100%; height: 33px;">
				<ul>
					<li><a href="${ctx}/<%=(String)session.getAttribute(IConstants.HOME)%>"></a></li>
					<li><span style="width: 60px; font-size: 12px;">状态列表</span></li>
				</ul>
			</div>
		</div>
		<div id="divTable" style="width: 90%;visibility: hidden;" align="center">
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-${msgType}"><button data-dismiss="alert" class="close">×</button>${message}</div>
			</c:if>
			<form name="form1" action="" method="post">
			<!-- 
				<fieldset>
					<div class="panel panel-default" style="width: 100%; padding: 10px;">
						<table class="table" style="border: 0px;">
							<tr>
								<td class="control-label" width="100px;" align="right" style="vertical-align: middle;border: 0px;">省份:</td>
								<td width="100px;" style="vertical-align: middle;border: 0px;">
									<select name="cityId" style="width: 140px;height: 25px;padding-top: 0px;" class="form-control">
										<option value="-1">全部</option>
										<c:forEach items="${citys}" var="item">
											<option value="${item.id}" <c:if test="${cityId == item.id}">selected="selected"</c:if>>${item.name}</option>
										</c:forEach> 
									</select>
								</td>
								<td class="control-label" width="100px;" align="right" style="vertical-align: middle;border: 0px;">台站名称:</td>
								<td style="vertical-align: middle;border: 0px;" width="100px;"><input type="text" name="name" value="${name}" style="width: 140px;height: 25px;" class="form-control"></td>
								<td class="control-label" width="100px;" align="right" style="vertical-align: middle;">台站编号:</td>
								<td style="vertical-align: middle;" width="100px;"><input type="text" name="id" value="${id}" style="width: 140px;height: 25px;" class="form-control"></td>
								
								<td style="vertical-align: middle;padding-left: 100px;border: 0px;" width="100px;"><button type="button" class="btn btn-primary" onclick="javascript:check('search');"><span class="glyphicon glyphicon-search"></span>&nbsp;检索</button></td>
								<td style="vertical-align: middle;padding-left: 10px;border: 0px;" width="100px;">
								</td>
								<td style="border: 0px;"></td>
							</tr>
						</table>
					</div>
				</fieldset>
				 -->
				<!-- <div id="divTable" style="width: 100%; height:600px; overflow: auto;visibility: hidden;"> -->
    	<table id="table"
           data-toggle="table"
           data-show-columns="false"
           data-search="true"
           data-show-refresh="false"
           data-show-toggle="false"
           data-pagination="false"
           data-height="550" 
           data-unique-id="id"
           style="width: 6000px;">
        <thead>
            <tr height="35px">
							<th class="textCenter" style="vertical-align: middle;" data-field="city" data-sortable="true" data-sorter="sorter">省份</th> 
							<th class="textCenter" style="vertical-align: middle;" data-field="id" data-sortable="true" data-sorter="sorter">台站编号</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="name" data-sortable="true" data-sorter="sorter">台站名称</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="powerstatus" data-sortable="true" data-sorter="sorter">运行模式</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="devno" data-sortable="true" data-sorter="sorter">设备号</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="ac" data-sortable="true" data-sorter="sorter">AC</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="voltagesolarceel" data-sortable="true" data-sorter="sorter">太阳能电压</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="supplyvoltage" data-sortable="true" data-sorter="sorter">供电电压</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="supplycurrent" data-sortable="true" data-sorter="sorter">供电电流</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="chargevoltage" data-sortable="true" data-sorter="sorter">充电电压</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="chargecurrent" data-sortable="true" data-sorter="sorter">充电电流</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="devtemp" data-sortable="true" data-sorter="sorter">设备温度</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="envtemp" data-sortable="true" data-sorter="sorter">环境温度</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="envhum" data-sortable="true" data-sorter="sorter">环境湿度</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="chargesource" data-sortable="true" data-sorter="sorter">供电源</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="supplyceel" data-sortable="true" data-sorter="sorter">供电电池组</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="loadvoltage1" data-sortable="true" data-sorter="sorter">负载1电压</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="loadcurrent1" data-sortable="true" data-sorter="sorter">负载1电流</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="loadvoltage2" data-sortable="true" data-sorter="sorter">负载2电压</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="loadcurrent2" data-sortable="true" data-sorter="sorter">负载2电流</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="loadvoltage3" data-sortable="true" data-sorter="sorter">负载3电压</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="loadcurrent3" data-sortable="true" data-sorter="sorter">负载3电流</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="loadvoltage4" data-sortable="true" data-sorter="sorter">负载4电压</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="loadcurrent4" data-sortable="true" data-sorter="sorter">负载4电流</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="loadvoltage5" data-sortable="true" data-sorter="sorter">负载5电压</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="loadcurrent5" data-sortable="true" data-sorter="sorter">负载5电流</th>
							
							<th class="textCenter" style="vertical-align: middle;" data-field="innerstatus1" data-sortable="true" data-sorter="sorter">内阻A状态</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="innervalue1" data-sortable="true" data-sorter="sorter">内阻A阴值</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="innerstatus2" data-sortable="true" data-sorter="sorter">内阻B状态</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="innervalue2" data-sortable="true" data-sorter="sorter">内阻B阴值</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="innerstatus3" data-sortable="true" data-sorter="sorter">内阻C状态</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="innervalue3" data-sortable="true" data-sorter="sorter">内阻C阴值</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="innerstatus4" data-sortable="true" data-sorter="sorter">内阻D状态</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="innervalue4" data-sortable="true" data-sorter="sorter">内阻D阴值</th>
							
							<th class="textCenter" style="vertical-align: middle;" data-field="flagdoor" data-sortable="true" data-sorter="sorter">门磁</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="flagIR" data-sortable="true" data-sorter="sorter">红外</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="flagwater" data-sortable="true" data-sorter="sorter">浸水</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="flaglight" data-sortable="true" data-sorter="sorter">雷击</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="flagSD" data-sortable="true" data-sorter="sorter">SD卡</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="recvdatatime" data-sortable="true" data-sorter="sorter">最近更新时间</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="zbdz" data-sortable="true" data-sorter="sorter">坐标</th>
							<th class="textCenter" style="vertical-align: middle;" data-field="ip" data-sortable="true" data-sorter="sorter">IP地址</th>
			 				<th class="textCenter" style="vertical-align: middle;" data-field="port" data-sortable="true" data-sorter="sorter">端口号</th>
							<th class="textCenter" style="vertical-align: middle;" width="300px" data-field="pingstatus" data-sortable="true" data-sorter="sorter">下位机设备ping状态</th>
							<th class="textCenter" style="vertical-align: middle;" width="300px" data-field="thdccminvalue" data-sortable="true" data-sorter="sorter">冗余数采分钟值数据</th>
							
						</tr>
        </thead>
        <tbody>
						<c:forEach items="${stations}" var="content">
							<tr id="${content.id}_tr" height="30px">
								<td class="textCenter">
									<c:forEach items="${citys}" var="item">
										<c:if test="${content.city.id == item.id}">${item.name}</c:if>
									</c:forEach> 
								</td>
								<td class="textCenter">${content.id}</td>
								<td class="textCenter">${content.name}</td>
								<td id="${content.id}_powerstatus" class="textCenter"></td>
								<td id="${content.id}_devno" class="textCenter"></td>
								<td id="${content.id}_ac" class="textCenter"></td>
								<td id="${content.id}_voltagesolarceel" class="textCenter"></td>
								<td id="${content.id}_supplyvoltage" class="textCenter"></td>
								<td id="${content.id}_supplycurrent" class="textCenter"></td>
								
								<td id="${content.id}_chargevoltage" class="textCenter"></td>
								<td id="${content.id}_chargecurrent" class="textCenter"></td>
								<td id="${content.id}_devtemp" class="textCenter"></td>
								<td id="${content.id}_envtemp" class="textCenter"></td>
								<td id="${content.id}_envhum" class="textCenter"></td>
								
								<td id="${content.id}_chargesource" class="textCenter"></td>
								<td id="${content.id}_supplyceel" class="textCenter"></td>
								
								<td id="${content.id}_loadvoltage1" class="textCenter"></td>
								<td id="${content.id}_loadcurrent1" class="textCenter"></td>
								<td id="${content.id}_loadvoltage2" class="textCenter"></td>
								<td id="${content.id}_loadcurrent2" class="textCenter"></td>
								<td id="${content.id}_loadvoltage3" class="textCenter"></td>
								<td id="${content.id}_loadcurrent3" class="textCenter"></td>
								<td id="${content.id}_loadvoltage4" class="textCenter"></td>
								<td id="${content.id}_loadcurrent4" class="textCenter"></td>
								<td id="${content.id}_loadvoltage5" class="textCenter"></td>
								<td id="${content.id}_loadcurrent5" class="textCenter"></td>
								
								
								<td id="${content.id}_innerstatus1" class="textCenter"></td>
								<td id="${content.id}_innervalue1" class="textCenter"></td>
								<td id="${content.id}_innerstatus2" class="textCenter"></td>
								<td id="${content.id}_innervalue2" class="textCenter"></td>
								<td id="${content.id}_innerstatus3" class="textCenter"></td>
								<td id="${content.id}_innervalue3" class="textCenter"></td>
								<td id="${content.id}_innerstatus4" class="textCenter"></td>
								<td id="${content.id}_innervalue4" class="textCenter"></td>
								
								<td id="${content.id}_flagdoor" class="textCenter"></td>
								<td id="${content.id}_flagIR" class="textCenter"></td>
								<td id="${content.id}_flagwater" class="textCenter"></td>
								<td id="${content.id}_flaglight" class="textCenter"></td>
								<td id="${content.id}_flagSD" class="textCenter"></td>
								
								<td id="${content.id}_recvdatatime" class="textCenter"></td>
								
								<td class="textCenter">${content.lat}, ${content.lng}</td>
								<td class="textCenter">${content.ip}</td>
								<td class="textCenter">${content.port}</td>
								
								<td id="${content.id}_pingstatus" class="textCenter"></td>
								<td id="${content.id}_thdccminvalue" class="textCenter"></td>
							</tr>
						</c:forEach>
						
					</tbody>
    </table>
				<!-- 
				<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover" style="table-layout: fixed;width: 5000px;">
					<thead>
						<tr style="background-image: linear-gradient(to bottom, #fff 0, #fff 100%);" height="35px">
							<th class="textCenter" style="vertical-align: middle;">台站编号</th>
							<th class="textCenter" style="vertical-align: middle;" width="200px">台站名称</th>
							<th class="textCenter" style="vertical-align: middle;">所属地</th>
							<th class="textCenter" style="vertical-align: middle;">运行模式</th>
							<th class="textCenter" style="vertical-align: middle;">设备号</th>
							<th class="textCenter" style="vertical-align: middle;">AC</th>
							<th class="textCenter" style="vertical-align: middle;">太阳能电压</th>
							<th class="textCenter" style="vertical-align: middle;">供电电压</th>
							<th class="textCenter" style="vertical-align: middle;">供电电流</th>
							<th class="textCenter" style="vertical-align: middle;">充电电压</th>
							<th class="textCenter" style="vertical-align: middle;">充电电流</th>
							<th class="textCenter" style="vertical-align: middle;">设备温度</th>
							<th class="textCenter" style="vertical-align: middle;">环境温度</th>
							<th class="textCenter" style="vertical-align: middle;">环境湿度</th>
							<th class="textCenter" style="vertical-align: middle;">供电源</th>
							<th class="textCenter" style="vertical-align: middle;">供电电池组</th>
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
							<th class="textCenter" style="vertical-align: middle;" width="200px">最近更新时间</th>
							<th class="textCenter" style="vertical-align: middle;" width="300px">坐标</th>
							<th class="textCenter" style="vertical-align: middle;">IP地址</th>
							<th class="textCenter" style="vertical-align: middle;">端口号</th>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${stations}" var="content">
							<tr id="${content.id}_tr" height="30px">
								<td class="textCenter">${content.id}</td>
								<td class="textCenter">${content.name}</td>
								<td class="textCenter">${content.city.name}</td>
								<td id="${content.id}_powerstatus" class="textCenter"></td>
								<td id="${content.id}_devno" class="textCenter"></td>
								<td id="${content.id}_ac" class="textCenter"></td>
								<td id="${content.id}_voltagesolarceel" class="textCenter"></td>
								<td id="${content.id}_supplyvoltage" class="textCenter"></td>
								<td id="${content.id}_supplycurrent" class="textCenter"></td>
								
								<td id="${content.id}_chargevoltage" class="textCenter"></td>
								<td id="${content.id}_chargecurrent" class="textCenter"></td>
								<td id="${content.id}_devtemp" class="textCenter"></td>
								<td id="${content.id}_envtemp" class="textCenter"></td>
								<td id="${content.id}_envhum" class="textCenter"></td>
								
								<td id="${content.id}_chargesource" class="textCenter"></td>
								<td id="${content.id}_supplyceel" class="textCenter"></td>
								
								<td id="${content.id}_loadvoltage1" class="textCenter"></td>
								<td id="${content.id}_loadcurrent1" class="textCenter"></td>
								<td id="${content.id}_loadvoltage2" class="textCenter"></td>
								<td id="${content.id}_loadcurrent2" class="textCenter"></td>
								<td id="${content.id}_loadvoltage3" class="textCenter"></td>
								<td id="${content.id}_loadcurrent3" class="textCenter"></td>
								<td id="${content.id}_loadvoltage4" class="textCenter"></td>
								<td id="${content.id}_loadcurrent4" class="textCenter"></td>
								<td id="${content.id}_loadvoltage5" class="textCenter"></td>
								<td id="${content.id}_loadcurrent5" class="textCenter"></td>
								
								
								<td id="${content.id}_innerstatus1" class="textCenter"></td>
								<td id="${content.id}_innervalue1" class="textCenter"></td>
								<td id="${content.id}_innerstatus2" class="textCenter"></td>
								<td id="${content.id}_innervalue2" class="textCenter"></td>
								<td id="${content.id}_innerstatus3" class="textCenter"></td>
								<td id="${content.id}_innervalue3" class="textCenter"></td>
								<td id="${content.id}_innerstatus4" class="textCenter"></td>
								<td id="${content.id}_innervalue4" class="textCenter"></td>
								
								<td id="${content.id}_flagdoor" class="textCenter"></td>
								<td id="${content.id}_flagIR" class="textCenter"></td>
								<td id="${content.id}_flagwater" class="textCenter"></td>
								<td id="${content.id}_flaglight" class="textCenter"></td>
								<td id="${content.id}_flagSD" class="textCenter"></td>
								
								<td id="${content.id}_recvdatatime" class="textCenter"></td>
								
								<td class="textCenter">${content.lat}, ${content.lng}</td>
								<td class="textCenter">${content.ip}</td>
								<td class="textCenter">${content.port}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				</div> -->
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/layouts/footer.jsp" />
	<script src="${ctx}/static/js/bootstrap-table.js" type="text/javascript"></script>
</body>
</html>