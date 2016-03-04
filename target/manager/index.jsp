<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>登录</title>
<meta name="renderer" content="webkit">
<link rel="shortcut icon" href="${ctx}/static/images/logo.png" type="image/x-icon"/>
<link rel="stylesheet" type="text/css" href="${ctx}/static/js/dist/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/style/common.css">
<script src="${ctx}/static/js/jquery.min.js"></script>
<script src="${ctx}/static/js/placeholder.js" type="text/javascript"></script>
<script type="text/javascript"> 
	$(function() {
		var userAgent = window.navigator.userAgent.toLowerCase();
		
		var ieVer;
		if(/msie 7\.0/i.test(userAgent)){
			ieVer = "IE7";
			$("#loginForm").css({"display":"none"});
			$(".info").html("<h1>请使用ie9或chrome访问 </h1><br/>" + userAgent + " " + ieVer);
		}
		if(/msie 8\.0/i.test(userAgent)){
			ieVer = "IE8";
			$("#loginForm").css({"display":"none"});
			$(".info").html("<h1>请使用ie9或chrome访问 </h1><br/>" + userAgent + " " + ieVer);
		}
		if(/msie 9\.0/i.test(userAgent)){
			ieVer = "IE9";
		}
		if(/rv:11\.0/i.test(userAgent)){
			ieVer = "IE11";
		}
		if(/chrome\/33\.0/i.test(userAgent)){
			ieVer = "chrome33";
		}
		var o = $(window).height();
		o = (o < 600 ? 600 : o);
		$("#loginDiv").css({"height":o});
		$("#loginForm").css({"margin-top":(o - 400)/2});
		$("#loginForm").css({"margin-bottom":(o - 400)/2});
		
	});
	
	function login(){
		var username = $.trim($("#username").val());
		var password = $.trim($("#password").val());
		if((username == "" && password == "") || (username == "请输入用户名" && password == "请输入密码")){
			$("#usernameTip").text("用户名不能为空");
			$("#passwordTip").text("密码不能为空");
			return;
		}
		if(username == "" || username == "请输入用户名"){
			$("#usernameTip").text("用户名不能为空");
			$("#passwordTip").text("");
			return;
		}
		if(password == "" || password == "请输入密码"){
			$("#usernameTip").text("");
			$("#passwordTip").text("密码不能为空");
			return;
		}
		$.post("${ctx}/login", {"username":username,"password":password},   function(data){
			d = data.split(",");
			if(d[0] == "1"){
				window.location.href = "${ctx}/" + d[1];
			}
			if(d[0] == "2"){
				$("#usernameTip").text("");
				$("#passwordTip").text("密码错误");
			}
			if(d[0] == "3"){
				$("#usernameTip").text("用户名不存在");
				$("#passwordTip").text("");
			}
			if(d[0] == "7"){
				$("#usernameTip").text("用户被禁用");
				$("#passwordTip").text("");
			}
		});
	}
	
	 function enterSumbit(){  
		var event=arguments.callee.caller.arguments[0]||window.event;
		if (event.keyCode == 13){  
			login();  
		}  
	 }  
	
	</script>
	<style>
	
	.shadow {
    box-shadow:
        0 2px 2px rgba(0,0,0,0),        
        0 1px 5px rgba(0,0,0,0),        
        0 0 0 12px rgba(33,33,33,0.1); 
	}
</style>
</head>
<body>
	<div align="center" id="loginDiv" style="padding-bottom: 0px;">
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs1">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${ctx}/"><img alt="" src="${ctx}/static/images/logo.png" height="22px" style="float: left;">&nbsp;&nbsp;中心服务器</a>
		</div>
	</nav>
	<div style="width: 90%" align="center">
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	</div>
	<div class="panel panel-default" id="loginForm" style="width: 500px;height: 280px;" >
					<br />
					<div><h4></h4></div>
					<br /><br />
					<table class="table">
						<tr>
							<td align="right" width="150px" style="vertical-align: middle;" class="control-label"></td>
							<td align="left" width="220px">
						    <span class="input-group-addon" style="background-color: #fff;width:40px;height:30px;float: left;"><span class="glyphicon glyphicon-user"></span></span>
						    <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名" autocomplete="off" style="height: 30px;width: 160px;border: 1px solid #ddd;font-size: 14px;color: #969EA1;">
							</td>
							<td width="150px" style="padding-top: 13px;"><span id="usernameTip" style="color: red;font: bold;"></span></td>
						</tr>
						<tr>
							<td align="right" style="vertical-align: middle;border-top: 0px;" class="control-label"></td>
							<td align="left" style="border-top: 0px;">
							<span class="input-group-addon" style="background-color: #fff;width:40px;height:30px;float: left;"><span class="glyphicon glyphicon-lock"></span></span>
							<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" onkeydown="javascript:enterSumbit();" style="height: 30px;width: 160px;border: 1px solid #ddd;font-size: 14px;color: #969EA1;padding-left: 12px;">
							</td>
							<td style="padding-top: 13px;border-top: 0px;"><span id="passwordTip" style="color: red;font: bold;"></span></td>
						</tr>
						<tr>
							<td colspan="2" align="right" style="border-top: 0px;"><button type="button" class="btn btn-primary" onclick="javascript:login();" style="width:200px;text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录</button></td>
							<td style="border-top: 0px;"></td>
						</tr>
					</table>
	</div>
	<div class="info"></div>
	<jsp:include page="/WEB-INF/layouts/footer.jsp" />
	</div>
</body>
</html>
