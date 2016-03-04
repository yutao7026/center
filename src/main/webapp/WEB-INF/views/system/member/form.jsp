<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@page import="com.novel.osp.manager.util.SessionUtil"%>
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
		onError:function(msg,obj,errorlist){},ajaxPrompt : '正在验证，请稍等...', wideWord:false
	});
	<c:if test="${action == 'add'}">
	$("#loginName").formValidator({onShow:"",onFocus:"长度1-20"}).inputValidator({min:1,max:20,onError:"长度1-20",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}}).regexValidator({regExp:"username",dataType:"enum",onError:"输入英文数字下划线，不能数字开头"});
	</c:if>
	$("#userName").formValidator({onShow:"",onFocus:"长度1-32"}).inputValidator({min:1,max:32,onError:"长度1-32",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#phone").formValidator({onShow:"",onFocus:"请输入11位手机号",onEmpty:"",empty:true}).inputValidator({min:11,max:11,onError:"请输入11位手机号"}).regexValidator({regExp:"intege1",dataType:"enum",onError:"请输入11位手机号"});
	$("#email").formValidator({onShow:"",onFocus:"请输入邮箱",onEmpty:"",empty:true}).inputValidator({min:1,max:32,onError:"长度1-32"}).regexValidator({regExp:"email",dataType:"enum",onError:"邮箱格式错误"});
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
					<li><a href="${ctx}/system/member" style="width: 60px;font-size: 12px;">系统用户</a></li>
					<li><span style="width: 30px;font-size: 12px;"><c:if test="${member.id == null}">增加</c:if><c:if test="${member.id != null}">编辑</c:if></span></li>
				</ul>
			</div>
		</div>
		<br />
		<form id="inputForm" action="${ctx}/system/member/${action}" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${member.id}" />
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-danger" style="width: 90%"><button data-dismiss="alert" class="close">×</button>${message}</div>
			</c:if>
			<div class="panel panel-default" style="width:90%;">
			  <div class="panel-heading"><strong>用户管理</strong></div>
			  <table class="table">
			  		<tr>
						<td class="control-label" width="40%;" style="vertical-align: middle;">用户名:</td>
						<td style="width: 140px;padding-right: 0px;" align="right">
							<input type="text" id="loginName" name="loginName" value="${member.loginName}" maxlength="20" style="width: 200px;height: 26px;" <c:if test="${action == 'update'}">readonly="readonly"</c:if> class="form-control"/>
							<input type="hidden" id="me_loginpwd" name="me_loginpwd" value="${member.me_loginpwd}"/>
						</td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="loginNameTip"></span></td>
					</tr>  
					<tr>
						<td class="control-label" width="40%;" style="vertical-align: middle;">昵称:</td>
						<td style="width: 140px;padding-right: 0px;" align="right"><input type="text" id="userName" name="me_username" value="${member.me_username}" maxlength="32" style="width: 200px;height: 26px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="userNameTip"></span></td>
					</tr> 
					<tr>
						<td class="control-label" width="40%;" style="vertical-align: middle;">联系方式:</td>
						<td style="width: 140px;padding-right: 0px;" align="right"><input type="text" id="phone" name="me_phone" value="${member.me_phone}" maxlength="11" style="width: 200px;height: 26px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;" width="*"><span id="phoneTip"></span></td>
					</tr>
					<tr>
						<td class="control-label" width="40%;" style="vertical-align: middle;">邮箱:</td>
						<td style="width: 140px;padding-right: 0px;" align="right"><input type="text" id="email" name="me_email" value="${member.me_email}" maxlength="32" style="width: 200px;height: 26px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;" width="*"><span id="emailTip"></span></td>
					</tr>
					<tr style="<c:if test="${member.loginName == 'admin'}">display: none</c:if>">
						<td class="control-label" width="40%;" style="vertical-align: middle;">权限:</td>
						<td style="width: 140px;padding-right: 0px;" align="left" colspan="2">
							<!-- <input type="text" name="me_purview" style="width: 200px;height: 26px;" value="${member.me_purview}"  class="form-control"/> -->
							<c:forEach items="${purview}" var="item" varStatus="i">
							 	  <c:set var="flag" value="false"></c:set>
							  	  <c:forEach items="${member.p}" var="item1">
								   	<c:if test="${item1 == item.key}">
								    	<c:set var="flag" value="true"></c:set>   
								   	</c:if>
								  </c:forEach>
								  <input type="checkbox" name="p" value="${item.key}" style="width: 15px;" <c:if test="${flag == true}">checked="checked"</c:if>>${item.value}&nbsp;&nbsp;
									
							  	  <c:if test="${(i.index + 1) % 5 == 0}"><br /></c:if>
							  </c:forEach>
						</td>
					</tr>
					
					<tr style="<c:if test="${member.loginName == 'admin'}">display: none</c:if>">
						<td class="control-label" width="40%;" style="vertical-align: middle;">状态:</td>
						<td style="width: 140px;padding-right: 0px;" align="right">
							<select name="me_status" style="width: 200px;height: 26px;padding-top: 0px;padding-top: 0px" class="form-control">
								<option value="1" <c:if test="${member.me_status == 1}">selected="selected"</c:if>>禁用</option>
								<option value="2" <c:if test="${member.me_status == 2}">selected="selected"</c:if>>启用</option>
							</select>
						</td>
						<td></td>
					</tr>
					
			  </table>
			  </div>
			  	<%	
					if(SessionUtil.checkPurview(session)) {
						%>
						<div class="form-actions">
							<button id="submit_btn" class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-save"></span>&nbsp;保存</button>&nbsp; <button id="cancel_btn" class="btn btn-primary" type="button" onclick="history.back()"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;返回</button>
						</div>
						<%
					}
				%>
		</form>
	</div>
	<jsp:include page="/WEB-INF/layouts/footer.jsp" />
</body>
</html>
