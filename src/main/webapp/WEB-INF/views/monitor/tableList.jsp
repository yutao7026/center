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
var isShow = false;
var currentStation = "";
var sObj = {
 	closeButton:false,
	title : "<strong>详情</strong>",
	message : "",
	className : "dqqq",
	buttons : {
		main : {
			label : "<span class='glyphicon glyphicon-remove'></span>&nbsp;确定",
			className : "btn btn-primary",
			callback : function() {
				isShow = false;
			}
		}
	}
}
$(function(){
	$("#breadcrumb").jBreadCrumb();
	setInterval(getData, 60000);
	getData();
	
	$('#table').on('dbl-click-row.bs.table', function (e, row) {
		 isShow = true;
		 currentStation = row.id.substring(row.id.indexOf(">") + 1);
		 currentStation = currentStation.substring(0, currentStation.indexOf("<"));
		 showDialog(row);
	});
});

function getTextByStatus(status){
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
			if (result) {
				
				rows = [];
				for(var i = 0; i < result.length; i ++){
					var random = Math.floor(Math.random() * 10);
					//result[i].powerstatus = random;
					var obj = getTextByStatus(result[i].powerstatus);
					
					var rowObj = {
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
			                electricfield: color(obj.color, result[i].electricfield == null? "" : result[i].electricfield),
			                groundresistance: color(obj.color, result[i].groundresistance == null? "" : result[i].groundresistance),
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
			                
			            };
					if(currentStation == result[i].stationId && isShow){
						showDialog(rowObj);
					}
					rows.push(rowObj); 
				}
				
			}
			$('#table').bootstrapTable('load', rows);
			$('#table').bootstrapTable('resetView');
		},
		error : function(errorMsg) {
			
		}
	});
	
}
	function showDialog(o){
		var msg = "<table width='100%'>";
		msg += "<tr valign='top' height='30px'>"
		msg += "<td style='width:25%;'>所属地：</td><td style='width:25%;'>"+ o.city +"</td>";
		msg += "<td style='width:25%;'>IP地址：</td><td style='width:25%;'>"+ o.ip +"</td>";
		msg += "</tr>"
		msg += "<tr valign='top' height='30px'>"
		msg += "<td style='width:25%;'>运行模式：</td><td style='width:25%;'>"+ o.powerstatus +"</td>";
		msg += "<td style='width:25%;'>端口：</td><td style='width:25%;'>"+ o.port +"</td>";
		msg += "</tr>"
		msg += "<tr valign='top' height='30px'>"
		msg += "<td style='width:25%;'>设备号：</td><td style='width:25%;'>"+ o.devno +"</td>";
		msg += "<td style='width:25%;'>更新时间：</td><td style='width:25%;'>"+ o.recvdatatime +"</td>";
		msg += "</tr>"
		
		msg += "<tr valign='top'>";
		msg += "<td style='width:50%;' colspan='2'>";
		msg += "<br /><fieldset><legend>环境</legend>"
		msg += "<table width='100%;'>";
		msg += "<tr height='30px' valign='top'>"
		msg += "<td style='width:25%;'>";
		msg += "温度：";
		msg += "</td>"
		msg += "<td style='width:25%;'>";
		msg += o.envtemp
		msg += "</td>"
		msg += "<td style='width:25%;'>";
		msg += "湿度：";
		msg += "</td>"
		msg += "<td style='width:25%;'>";
		msg += o.envhum;
		msg += "</td>"
		msg += "</tr>"
		
		msg += "<tr height='30px' valign='top'>"
		msg += "<td style='width:25%;'>";
		msg += "门磁：";
		msg += "</td>"
		msg += "<td style='width:25%;'>";
		msg += o.flagdoor
		msg += "</td>"
		msg += "<td style='width:25%;'>";
		msg += "红外：";
		msg += "</td>"
		msg += "<td style='width:25%;'>";
		msg += o.flagIR;
		msg += "</td>"
		msg += "</tr>"
		
		msg += "<tr height='30px' valign='top'>"
		msg += "<td style='width:25%;'>";
		msg += "雷击：";
		msg += "</td>"
		msg += "<td style='width:25%;'>";
		msg += o.flaglight
		msg += "</td>"
		msg += "<td style='width:25%;'>";
		msg += "浸水：";
		msg += "</td>"
		msg += "<td style='width:25%;'>";
		msg += o.flagwater;
		msg += "</td>"
		msg += "</tr>"
		
		msg += "</table>"
		msg += "</fieldset>"
		msg += "</td>"
		
		msg += "<td colspan='2'>";
		msg += "<br /><fieldset><legend>设备</legend>"
		msg += "<table width='100%;'>";
		msg += "<tr height='30px' valign='top'>"
		msg += "<td>温度：</td><td>"+ o.devtemp +"</td><td>电场：</td><td>"+ o.electricfield +"</td><td>地网电阻：</td><td>"+ o.groundresistance +"</td><td>SD卡</td><td>"+ o.flagSD +"</td>";
		msg += "</tr>";
		msg += "<tr height='30px' valign='top'>"
		msg += "<td>接入设备状态：</td><td colspan='7'>"+ o.pingstatus +"</td>";
		msg += "</tr>";
		
		msg += "</table>";
		msg += "</fieldset>"
		msg += "</td>"
		msg += "</tr>"
		
		msg += "<tr>";
		msg += "<td colspan='4'><br/>"
		msg += "<fieldset><legend>动力</legend>"
		msg += "<table width='100%;'>";
		msg += "<tr height='30px' valign='top'>"
		msg += "<td style='width:10%;'>";
		msg += "</td>"
		msg += "<td style='width:20%;'>";
		msg += "AC电压：" + o.ac;
		msg += "</td>"
		msg += "<td style='width:25%;'>";
		msg += "太阳能电压：" + o.voltagesolarceel;
		msg += "</td>"
		msg += "<td style='width:25%;'>";
		msg += "供电电池组：" + o.supplyceel;
		msg += "</td>"
		msg += "<td style='width:20%;'>";
		msg += "供电源：" + o.chargesource;
		msg += "</td>"
		msg += "</tr>"
		msg += "<tr>"
		msg += "<td colspan='5'>"
		msg += "<table width='100%;'>";
		msg += "<tr height='30px' valign='top'>"
		msg += "<td></td><td>负载1</td><td>负载2</td><td>负载3</td><td>负载4</td><td>负载5</td>";
		msg += "<td>供电</td><td>充电</td><td></td><td>内阻A</td><td>内阻B</td><td>内阻C</td><td>内阻D</td>";
		msg += "</tr>"
		msg += "<tr height='30px' valign='top'>"
		msg += "<td>电流（A）</td><td>"+ o.loadcurrent1 +"</td><td>"+ o.loadcurrent2 +"</td><td>"+ o.loadcurrent3 +"</td><td>"+ o.loadcurrent4 +"</td><td>"+ o.loadcurrent5 +"</td>";
		msg += "<td>"+ o.supplycurrent +"</td><td>"+ o.chargecurrent +"</td><td>状态</td><td>"+ o.innerstatus1 +"</td><td>"+ o.innerstatus2 +"</td><td>"+ o.innerstatus3 +"</td><td>"+ o.innerstatus4 +"</td>";
		msg += "</tr>"
		msg += "<tr height='30px' valign='top'>"
		msg += "<td>电压（V）</td><td>"+ o.loadvoltage1 +"</td><td>"+ o.loadvoltage2 +"</td><td>"+ o.loadvoltage3 +"</td><td>"+ o.loadvoltage4 +"</td><td>"+ o.loadvoltage5 +"</td>";
		msg += "<td>"+ o.supplyvoltage +"</td><td>"+ o.chargevoltage +"</td><td>阴值</td><td>"+ o.innervalue1 +"</td><td>"+ o.innervalue2 +"</td><td>"+ o.innervalue3 +"</td><td>"+ o.innervalue4 +"</td>";
		msg += "</tr>"
		msg += "</table>"
		msg += "</td>"
		msg += "</tr>"
		msg += "</table>"
		msg += "</fieldset>"
		msg += "</td>"
		msg += "</tr>";
		msg += "</table>"
		
		
		
		//var msg = o.recvdatatime + "<br />省份：" + o.city + "  台站编号：" + o.id + "  台站名称：" + o.name + "<br />";
		//msg += o.powerstatus + " " + o.id;
		sObj.message = msg;
		sObj.title = o.name + "  （" + o.id + "）";
		bootbox.hideAll();
		bootbox.dialog(sObj);
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
<style type="text/css">
	.dqqq{
		width : 800px;
		margin-left:auto; margin-right:auto; 
		
	}
</style>
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
		<div id="divTable" style="width: 90%;" align="center">
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-${msgType}"><button data-dismiss="alert" class="close">×</button>${message}</div>
			</c:if>
			<form name="form1" action="" method="post">
			
    	<table id="table"
           data-toggle="table"
           data-show-columns="false"
           data-search="true"
           data-show-refresh="false"
           data-show-toggle="false"
           data-pagination="false"
           data-height="680" 
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
					</tbody>
    </table>
				
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/layouts/footer.jsp" />
	<script src="${ctx}/static/js/bootstrap-table.js" type="text/javascript"></script>
</body>
</html>