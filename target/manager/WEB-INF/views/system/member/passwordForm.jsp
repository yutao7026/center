<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="/WEB-INF/layouts/common.jsp" />
<title>用户管理</title>
<script type="text/javascript">
$(function(){
	$.formValidator.initConfig({formID:"inputForm",theme:"SolidBox",submitOnce:true,
		onError:function(msg,obj,errorlist){},ajaxPrompt : '正在验证，请稍等...'
	});
	$("#password").formValidator({onShow:"",onFocus:"长度1-20"}).inputValidator({min:1,max:20,onError:"长度1-20",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}}).regexValidator({regExp:"username",dataType:"enum",onError:"输入英文数字下划线,不能数字开头"});
	$("#password1").formValidator({onShow:"",onFocus:"长度1-20"}).inputValidator({min:1,max:20,onError:"长度1-20",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}}).compareValidator({desID:"password",operateor:"=",onError:"密码不一致,请确认"});
	$("#breadcrumb").jBreadCrumb();
});
</script> 
</head>

<body> 
	<jsp:include page="/WEB-INF/layouts/header.jsp" />
	<div style="width: 100%;" align="center">
		<div class="breadcrumbholder module" style="width: 90%;">
			<div id="breadcrumb" class="breadcrumb module" style="width: 100%;height: 33px;">
				<ul>
					<li><a href="${ctx}/<%=(String)session.getAttribute(IConstants.HOME)%>"></a></li>
					<li><span style="width: 60px;font-size: 12px;">修改密码</span></li>
				</ul>
			</div>
		</div>
		<br />
		<form id="inputForm" action="${ctx}/system/member/updatePassword" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${member.id}" />
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-success" style="width: 90%"><button data-dismiss="alert" class="close">×</button>${message}</div>
			</c:if>
			<div class="panel panel-default" style="width:90%;">
			  <div class="panel-heading"><strong>修改密码</strong></div>
			  <table class="table">
			  		<tr>
						<td class="control-label" width="40%;" style="vertical-align: middle;">用户名:</td>
						<td style="width: 160px;" align="left"><input type="text" id="loginName" name="loginName" value="${member.loginName}" style="width: 160px;height: 25px;" class="form-control" disabled/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;" width="*"><span id="loginNameTip"></span></td>
					</tr>
					<tr>
						<td class="control-label" width="40%;" style="vertical-align: middle;">昵称:</td>
						<td align="left"><input type="text" id="me_username" name="me_username" value="${member.me_username}" style="width: 160px;height: 25px;" class="form-control" disabled/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;" width="*"><span id="me_usernameTip"></span></td>
					</tr>
					<tr>
						<td class="control-label" width="40%;" style="vertical-align: middle;">密码:</td>
						<td align="left"><input type="password" id="password" name="password" value="" style="width: 160px;height: 25px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="passwordTip"></span></td>
					</tr>
					<tr>
						<td class="control-label" width="40%;" style="vertical-align: middle;">重复密码:</td>
						<td align="left"><input type="password" id="password1" name="password1" value="" style="width: 160px;height: 25px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="password1Tip"></span></td>
					</tr>
					
			  </table>
			  </div>
			  <div class="form-actions">
					<button id="submit_btn" class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-save"></span>&nbsp;保存</button>&nbsp; <button id="cancel_btn" class="btn btn-primary" type="button" onclick="history.back()"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;返回</button>
				</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/layouts/footer.jsp" />
</body>
</html>
