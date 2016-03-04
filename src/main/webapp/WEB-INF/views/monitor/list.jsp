<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="/WEB-INF/layouts/common.jsp" />
<script src="${ctx}/static/js/common.js" type="text/javascript" charset="UTF-8"></script>
<title>地图监测</title>
<link rel="stylesheet" href="${ctx}/static/style/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="${ctx}/static/js/jquery.ztree.core-3.5.min.js"></script>
	<link rel="stylesheet" href="${ctx}/static/js/leaflet/leaflet.css" />
	<script src="${ctx}/static/js/leaflet/leaflet.js"></script>
	<style>
		#map { 
			height: 700px;
			width:100%;
			 }
			 
		.hf *{
			padding:0; margin:0; font-size:12px; font-family: Verdana, Arial, Helvetica, AppleGothic, sans-serif;
			font: normal #333;
		}	
	</style>
<script type="text/javascript">
	$(function() {
		
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
					//var tr = "";
					var marqueeStr = "";
					for(var i = 0; i < result.length; i ++){
						var random = Math.floor(Math.random() * 10);
						//result[i].powerstatus = random;
						if(result[i].powerstatus == "0" || result[i].powerstatus == "2" || result[i].powerstatus == "3" || result[i].powerstatus == "9"){
							continue;
						}
						var obj = getTextByStatus(result[i].powerstatus);
						try{
							marqueeStr += "<span style='color:"+ obj.color +";'>"+ (result[i].recvdatatime == null? "" : result[i].recvdatatime) + "&nbsp;" + result[i].station.id + "&nbsp;" + result[i].station.name + "&nbsp;" + obj.text +"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
						}catch(e){}
						//tr += "<tr height='30px' style='color:"+ obj.color +"'>";
						//tr += "<td class='textCenter' style='vertical-align: middle;'>"+ (result[i].recvdatatime == null? "" : result[i].recvdatatime) +"</td>";
						//tr += "<td class='textCenter' style='vertical-align: middle;'>"+ result[i].station.id +"</td>";
						//tr += "<td class='textCenter' style='vertical-align: middle;'>"+ result[i].station.name +"</td>";
						//tr += "<td class='textCenter' style='vertical-align: middle;'>"+ obj.text +"</td>";
						//tr += "</tr>"; 
					}
					//document.getElementById("tbody1").innerHTML = tr;
					document.getElementById("marquee").innerHTML = marqueeStr;
					updateMap(result);
				}
			},
			error : function(errorMsg) {
				
			}
		});
		
	}
	
	function updateMap(result){
		for(var i = 0; i < result.length; i ++){
			for(var j = 0; j < objs.length; j ++){
				try{
				if(result[i].station.id == objs[j].stationId){
					var random = Math.floor(Math.random() * 10);
					//result[i].powerstatus = random;
					var obj = getTextByStatus(result[i].powerstatus);
					objs[j].setStyle({
					     color: obj.color,
					     fillColor: obj.color
					});
					
					var popupText = "台站编号：" + result[i].station.id + "<br />";
						popupText += "台站名称：" + result[i].station.name + "<br />";
						popupText += "设备温度：" + result[i].devtemp + "<br />";
						popupText += "环境温度：" + result[i].envtemp + ", " + "环境湿度：" + result[i].envhum + "<br />";
						popupText += "运行模式：" + obj.text + "<br />";
						popupText += "供电源：" + chargesourceText(result[i].chargesource) + "<br />";
						popupText += "供电电池组：" + supplyceelText(result[i].supplyceel) + "<br />";
						popupText += "供电：电压：" + (result[i].supplyvoltage == null? "" : result[i].supplyvoltage);
						popupText += "，电流：" + (result[i].supplycurrent == null? "" : result[i].supplycurrent) + "<br />";
						popupText += "充电：电压：" + (result[i].chargevoltage == null? "" : result[i].chargevoltage);
						popupText += "，电流：" + (result[i].chargecurrent == null? "" : result[i].chargecurrent) + "<br />";
						popupText += "负载1：电压" + (result[i].loadvoltage1 == null? "" : result[i].loadvoltage1);
						popupText += "，电流：" + (result[i].loadcurrent1 == null? "" : result[i].loadcurrent1) + "<br />";
						popupText += "负载2：电压" + (result[i].loadvoltage2 == null? "" : result[i].loadvoltage2);
						popupText += "，电流：" + (result[i].loadcurrent2 == null? "" : result[i].loadcurrent2) + "<br />";
						popupText += "负载3：电压" + (result[i].loadvoltage3 == null? "" : result[i].loadvoltage3);
						popupText += "，电流：" + (result[i].loadcurrent3 == null? "" : result[i].loadcurrent3) + "<br />";
						popupText += "负载4：电压" + (result[i].loadvoltage4 == null? "" : result[i].loadvoltage4);
						popupText += "，电流：" + (result[i].loadcurrent4 == null? "" : result[i].loadcurrent4) + "<br />";
						popupText += "负载5：电压" + (result[i].loadvoltage5 == null? "" : result[i].loadvoltage5);
						popupText += "，电流：" + (result[i].loadcurrent5 == null? "" : result[i].loadcurrent5) + "<br />";
						popupText += "内阻A：" + result[i].innerstatus1 + "<br />";
						popupText += "内阻B：" + result[i].innerstatus2 + "<br />";
						popupText += "内阻C：" + result[i].innerstatus3 + "<br />";
						popupText += "内阻D：" + result[i].innerstatus4 + "<br />";
						popupText += "门磁：" + statusText(result[i].flagdoor) + "<br />";
						popupText += "红外：" + statusText(result[i].flagIR) + "<br />";
						popupText += "浸水：" + statusText(result[i].flagwater) + "<br />";
						popupText += "雷击：" + statusText(result[i].flaglight) + "<br />";
						popupText += "SD卡：" + sdText(result[i].flagSD) + "<br />";
						popupText += "最近更新时间：" + (result[i].recvdatatime == null? "" : result[i].recvdatatime) + "<br />";
						popupText += "当前状态持续时间：" + (result[i].d == null? "" : result[i].d) + "秒<br />";
					objs[j].popupText = popupText;
					
					break;
				}
				}catch(e){}
			}	
		}
		
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/layouts/header.jsp" />
	<div align="center" style="width: 100%">
		<div class="breadcrumbholder module" style="width: 90%;">
			<div id="breadcrumb" class="breadcrumb module" style="width: 100%; height: 33px;">
				<ul>
					<li><a href="${ctx}/<%=(String)session.getAttribute(IConstants.HOME)%>"></a></li>
					<li><span style="width: 60px; font-size: 12px;">地图监测</span></li>
				</ul>
			</div>
		</div>
		<br />
		<div style="width: 90%" align="center">
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-${msgType}"><button data-dismiss="alert" class="close">×</button>${message}</div>
			</c:if>
	<table style="width: 100%;">
		<tr>
			<td width="100%" style="vertical-align:top;">
					<div id="map" style="border: 1px solid #ddd;"></div>
			</td>
			
			<td style="vertical-align:top;padding-left: 1px;height: 100%;position:relative;">
					<div id="treeDiv" style="margin-top:0px; height:100%;overflow: auto;border: 1px solid #ddd;width:200px;position:relative;">
						<ul id="tree" class="ztree"></ul>
					</div>
					<div id="cd" style="width: 35px;height: 35px;background: #fff;border: 1px solid #BEBEBE;position:absolute;top: 0px; right:0px;z-index:10; -webkit-border-radius: 4px;-moz-border-radius: 4px;-ms-border-radius: 4px;border-radius: 4px;" align="center">
						<span id="iconSpan" class="glyphicon glyphicon-resize-small" style="margin-top: 9px;"></span>
					</div>
					<!-- 
					<div style="margin-top:0px; height:300px;overflow: auto;border: 1px solid #ddd; width: 350px;">
						<table class="table hf" id="table1" style="width: 100%;">
							<thead>
								<tr>
									<th class="textCenter" style="vertical-align: middle;" width="90px">时间</th>
									<th class="textCenter" style="vertical-align: middle;" width="70px">台站编号</th>
									<th class="textCenter" style="vertical-align: middle;" width="70px">台站名称</th>
									<th class="textCenter" style="vertical-align: middle;">台站状态</th>
								</tr>
							</thead>
							<tbody id="tbody1"></tbody>
						</table>
					</div>
					 -->
			</td>	
		</tr>	
	</table>
	
	
	<marquee id="marquee" scrollAmount=5 direction=left onmouseover="this.stop();" onmouseout="this.start();"></marquee>
<script>
var resizeSmall = "glyphicon glyphicon-resize-small"
var resizeFull = "glyphicon glyphicon-resize-full";
$("#cd").click(function(){
	  var classAttr = $("#iconSpan").attr("class");
	  if(classAttr == resizeSmall){
		  $("#iconSpan").attr("class", resizeFull);
	  }else if(classAttr == resizeFull){
		  $("#iconSpan").attr("class", resizeSmall);
	  }
	  $("#treeDiv").toggle();
});

var mapCenter = new L.LatLng(35.5323, 107.5063); 
var map = new L.Map('map', {
    center : mapCenter,
    zoom : 5,
    maxZoom : 9,
    minZoom : 5,
    inertia : false,
    dragging : true,
    maxBounds: [[60.58351256610522, 73.920234375], [17.145311187950925, 135.3421875]]
});

var popup1 = new L.popup({autoPan:true, keepInView:false, zoomAnimation:true,offset:L.point(0, -2) ,autoPanPaddingBottomRight:L.point(10, 10)});
var popup2 = new L.popup({autoPan:true, keepInView:false, zoomAnimation:true,offset:L.point(0, -2) ,autoPanPaddingBottomRight:L.point(10, 10)});
var wmsLayer = L.tileLayer.wms("http://localhost:8081/geowebcache/service/wms", {
        layers: 'ARCGIS',
        format: 'image/png',
        maxZoom: 9
});
wmsLayer.addTo(map);
var city = ${citysJson};
var stations = ${stationsJson};

for(var i = 0; i < city.length; i ++){
	(function(){      
    //var marker = L.marker([city[i].lat, city[i].lng]);
    var marker = L.circleMarker([city[i].lat, city[i].lng], {
	     color: '#ddd',
	     fillColor: '#ddd',
	     weight: 1,
	     fillOpacity: 0.5,
	     radius: 1
	    });
		var lat = city[i].lat;
		var lng = city[i].lng;
		var name = city[i].name;
		marker.on('mouseover', function(e) {
		    popup1.setLatLng([lat,lng]).setContent(name).openOn(map);
		});
		
		marker.on('mouseout', function(e) {
		    //map.closePopup();
		});
	
		marker.addTo(map);
  })();  
}
var objs = new Array();
for(var i = 0; i < stations.length; i ++){
	(function(){   
	var circle = L.circleMarker([stations[i].lat, stations[i].lng], {
	     color: '#ddd',
	     fillColor: '#ddd',
	     weight: 1,
	     fillOpacity: 0.5,
	     radius: 5 
	    }); 
		circle.stationId = stations[i].id;
		var stationId = stations[i].id;
		var lat = stations[i].lat;
		var lng = stations[i].lng;
		var name = stations[i].name;
		circle.on('click', function(e) {
			if(!circle.popupText){
				var popupText = "台站编号：" + stationId + "<br />";
				popupText += "台站名称：" + name + "<br />";
				popupText += "设备温度：" + "" + "<br />";
				popupText += "环境温度：" + "" + ", " + "环境湿度：" + "" + "<br />";
				popupText += "运行模式：" + "" + "<br />";
				popupText += "供电源：" + "" + "<br />";
				popupText += "供电电池组：" + "" + "<br />";
				popupText += "供电电压：" + "" + "<br />";
				popupText += "充电电压：" + "" + "<br />"; 
				popupText += "负载1：" + "" + "<br />";
				popupText += "负载2：" + "" + "<br />";
				popupText += "负载3：" + "" + "<br />";
				popupText += "负载4：" + "" + "<br />";
				popupText += "负载5：" + "" + "<br />";
				popupText += "内阻A：" + "" + "<br />";
				popupText += "内阻B：" + "" + "<br />";
				popupText += "内阻C：" + "" + "<br />";
				popupText += "内阻D：" + "" + "<br />";
				popupText += "门磁：" + "" + "<br />";
				popupText += "红外：" + "" + "<br />";
				popupText += "浸水：" + "" + "<br />";
				popupText += "雷击：" + "" + "<br />";
				popupText += "SD卡：" + "" + "<br />";
				popupText += "最近更新时间：" + "" + "<br />";
				popupText += "当前状态持续时间：" + "" + "<br />";
				circle.popupText = popupText;
			}
			popup1.setLatLng([lat,lng]).setContent(circle.popupText).openOn(map);
			//popup1.update();
		});
		function mo(e) {
			if(!circle.popupText1){
				var popupText1 = "台站名称：" + name;
				circle.popupText1 = popupText1;
			}
			popup2.setLatLng([lat,lng]).setContent(circle.popupText1).openOn(map);
			circle.off('mouseover', mo);
			
		}
		circle.on('mouseover', mo);
		
		circle.on('mouseout', function(e) {
			circle.on('mouseover', mo);
		});
	
		circle.addTo(map);
		objs.push(circle);
  })();  
}

var setting = {
	view: {
		showIcon: false
	},
	data: {
		simpleData: {
			enable: true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: null
		}
	},
	callback: {
		onClick: onClick
	}
	
};

function onClick(event, treeId, treeNode, clickFlag) {
	if(treeNode.id == -1){
		return;
	}
	var center = new L.LatLng(treeNode.lat, treeNode.lng);
	var zoom = (treeNode.pId == -1 ? treeNode.zoom : 9);
	map.setView(center, zoom);
}		


$(document).ready(function(){
	var qg =[{ id:-1, pId:null, name:"全国", open:true}];
	$.fn.zTree.init($("#tree"), setting, qg.concat(city).concat(stations));
	$("#breadcrumb").jBreadCrumb();
	setInterval(getData, 60000);
	getData();
}); 
</script>
	</div>
	</div>
	<jsp:include page="/WEB-INF/layouts/footer.jsp" />
</body>
</html>