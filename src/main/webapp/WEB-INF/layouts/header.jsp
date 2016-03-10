<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div id="header">
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs1">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" style="width: 300px;"><img alt="" src="${ctx}/static/images/logo.png" height="22px" style="float: left;">&nbsp;&nbsp;中心服务器</a>
		</div>
		<div class="collapse navbar-collapse" id="bs1">
			<ul class="nav navbar-nav navbar-right" style="<c:if test="${flag == 'login'}">display: none;</c:if>">
				 
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<%=session.getAttribute(IConstants.MEMBERNAME) %>&nbsp; <b class="caret"></b></a>
					<ul class="dropdown-menu" style="-webkit-border-radius: 4px;-moz-border-radius: 4px;-ms-border-radius: 4px;border-radius: 4px;">
						<li><a href="${ctx}/system/member/password">修改密码</a></li>
						<li><a href="${ctx}/logout">退出</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
</div>

<script> 
	$(function(){
		$('#menuDiv').mouseenter(function(evt){
			showMenu(true);
		});
	
		$('#menuDiv').mouseleave(function(evt){
			showMenu(true);
		});
		
		var top = $("#menuDiv").offset().top;  
        $(window).scroll(function (){  
            var offsetTop = top + $(window).scrollTop() +"px";  
            $("#menuDiv").animate({top : offsetTop },{ duration:600 , queue:false });  
        });  
	});

	function showMenu(isShow){  
		var div=$("#menuDiv");  
		if(isShow){
			div.animate({width:'56px',opacity:'0.9'},"fast");  
			$(".m1").css({"display":""});
			$("#menuTd").css({"display":"none"});
			isShow = true;
		}else{
			div.animate({width:'20px',opacity:'0.9'},"fast"); 
			isShow = false;
			$(".m1").css({"display":"none"});
			$("#menuTd").css({"display":""});
		}
	}
	
	function showAbout(){
		var html = "版本: 1.0<br><br>";
		html += "版权所有 &copy; 2015  中心服务器<br><br>";
		html += "警告: 本计算机程序受版权法及国际公约的保护，未经授权擅自复制或散布本程序的部分或";
		html += "全部，将承受严厉的民事和刑事处罚，对已知的违反者将给予法律范围内的全面制裁。";
		html += "<br>";
		bootbox.dialog({
			message: html,
			className : "dq",
			title: "<img alt='' src='${ctx}/static/images/logo.png' height='22px'> <strong>关于&nbsp;&nbsp;&nbsp;&nbsp;中心服务器</strong>",
			buttons: {
				main: {
					label: "<span class='glyphicon glyphicon-ok'></span>&nbsp;确定",
					className: "btn btn-primary",
					callback: function() {}
			    }
			}
		}); 
	}
</script>   

<table id="menuDiv" style="background:#fff;border-color:#fff; height:35px;width:20px;top:110px;position:absolute;left: 0px; <c:if test="${flag == 'login'}">display: none;</c:if>">
	<tr>
		<td class="m1" width="110px;" valign="top" style="border: 0px solid #ddd;">
			<div style="background:#fff;border-color:#fff;margin-right: 0px;" class="panel panel-primary">
				<div class="panel-body m1" style="padding: 0px;width: 60px;">
					<ul class="nav nav-pills nav-stacked">
						<!-- 
						<li <c:if test="${active == '1'}">class="active"</c:if>><a href="${ctx}/root">主页预览</a></li>
						-->
						<%
							List<String> purvew = Arrays.asList(((String)session.getAttribute(IConstants.PURVIEW)).split(","));
							if(purvew.contains("1")){
								%>
								<li <c:if test="${active == '6'}">class="active"</c:if>><a href="${ctx}/monitor">地图监测</a></li>
								<%
							}
							if(purvew.contains("4")){
								%>
								<li <c:if test="${active == '9'}">class="active"</c:if>><a href="${ctx}/monitor/tableList">状态列表</a></li>
								<%
							}
							if(purvew.contains("3")){
								%>
								<li <c:if test="${active == '2'}">class="active"</c:if>><a href="${ctx}/powerData">历史数据</a></li>
								<%
							}
							if(purvew.contains("2")){
								%>
								<li <c:if test="${active == '8'}">class="active"</c:if>><a href="${ctx}/station">台站管理</a></li>
								<%
							}
							
							
							if(purvew.contains("5")){
								%>
								<li <c:if test="${active == '5'}">class="active"</c:if>><a href="${ctx}/system/log">日志管理</a></li>
								<%
							}
						%>
							<% 
								if(((String)session.getAttribute(IConstants.USERNAME)).equals("admin")){
									%>
									<li <c:if test="${active == '3'}">class="active"</c:if>><a href="${ctx}/system/member">系统用户</a></li>
									<%		
								} 
							%>
							
							
							<!-- 
							<li <c:if test="${active == '10'}">class="active"</c:if>><a href="${ctx}/report">报表管理</a></li>
							<li <c:if test="${active == '4'}">class="active"</c:if>><a href="${ctx}/system/config/update/0">系统配置</a></li>
							 -->
							<!-- 
							<li <c:if test="${active == '6'}">class="active"</c:if>><a href="${ctx}/system/updateForm">升级管理</a></li>
							-->
						<li><a href="javascript:showAbout();">关于</a></li>
					</ul>
				</div>
			</div> 
		</td>
		<td width="20px;" style="display: none;padding-left: 12px;" id="menuTd">
			<div style="width: 35px;height: 35px;background: #fff;padding-top: 1px;border: 1px solid #BEBEBE;margin-top: 0px;-webkit-border-radius: 4px;-moz-border-radius: 4px;-ms-border-radius: 4px;border-radius: 4px;" align="center">
				<div style="width: 21px;height: 2px;background: #BEBEBE;margin-top: 5px;"></div>
				<div style="width: 21px;height: 2px;background: #BEBEBE;margin-top: 4px;"></div>
				<div style="width: 21px;height: 2px;background: #BEBEBE;margin-top: 4px;"></div>
				<div style="width: 21px;height: 2px;background: #BEBEBE;margin-top: 4px;"></div>
			</div>
		</td>
	</tr>
</table>
