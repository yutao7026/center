<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@page import="com.novel.osp.manager.util.SessionUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="/WEB-INF/layouts/common.jsp" />
<title>台站管理</title>
<script type="text/javascript">
$(function(){
	
	$.formValidator.initConfig({formID:"inputForm",theme:"SolidBox",submitOnce:true,
		onError:function(msg,obj,errorlist){},ajaxPrompt : '正在验证，请稍等...', wideWord:false
	});
	$("#name").formValidator({onShow:"",onFocus:"长度1-15"}).inputValidator({min:1,max:15,onError:"长度1-15",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#lat").formValidator({onShow:"",onFocus:"范围[0-180]"}).inputValidator({min:0,max:180,type:"number",onError:"范围[0-180]",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}})
	$("#lng").formValidator({onShow:"",onFocus:"范围[0-90]"}).inputValidator({min:0,max:90,type:"number",onError:"范围[0-90]",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}})
	$("#ip").formValidator({onShow:"",onFocus:"IP格式"}).inputValidator({empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}}).regexValidator({regExp:"ip4",dataType:"enum",onError:"IP格式错误"});
	$("#port").formValidator({onShow:"",onFocus:"范围1-65535"}).inputValidator({min:1,max:65535,type:"number",onError:"1-65535",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
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
					<li><a href="${ctx}/station" style="width: 60px;font-size: 12px;">台站管理</a></li>
					<li><span style="width: 30px;font-size: 12px;"><c:if test="${station.id == null}">增加</c:if><c:if test="${station.id != null}">编辑</c:if></span></li>
				</ul>
			</div>
		</div>
		<br />
		<form id="inputForm" action="${ctx}/station/${action}" method="post" class="form-horizontal">
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-danger" style="width: 90%"><button data-dismiss="alert" class="close">×</button>${message}</div>
			</c:if>
			<div class="panel panel-default" style="width:90%;">
			  <div class="panel-heading"><strong>台站管理</strong></div>
			  <table class="table">
			  		<tr>
						<td class="control-label" width="35%;" style="vertical-align: middle;">编号:</td>
						<td style="width: 140px;padding-right: 0px;" align="right">
							<input type="text" id="id" name="id" value="${station.id}" maxlength="300" style="width: 340px;height: 26px;" class="form-control" <c:if test="${station.id != null}"> readonly="readonly"</c:if>/>
						</td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="idTip"></span></td>
					</tr> 
			  		<tr>
						<td class="control-label" width="35%;" style="vertical-align: middle;">名称:</td>
						<td style="width: 140px;padding-right: 0px;" align="right"><input type="text" id="name" name="name" maxlength="15" value="${station.name}" style="width: 340px;height: 26px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="nameTip"></span></td>
					</tr> 
			  		<tr>
						<td class="control-label" width="35%;" style="vertical-align: middle;">所属地:</td>
						<td style="width: 140px;padding-right: 0px;" align="right">
						<select name="pId" style="width: 340px;height: 26px;padding-top: 0px;" class="form-control">
								<c:forEach items="${citys}" var="item">
									<option value="${item.id}" <c:if test="${station.pId == item.id}">selected="selected"</c:if>>${item.name}</option>
								</c:forEach>
							</select>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="control-label" width="35%;" style="vertical-align: middle;">纬度:</td>
						<td style="width: 140px;padding-right: 0px;" align="right"><input type="text" id="lat" name="lat" maxlength="5" value="${station.lat}" style="width: 340px;height: 26px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="latTip"></span></td>
					</tr>  
					<tr>
						<td class="control-label" width="35%;" style="vertical-align: middle;">经度:</td>
						<td style="width: 140px;padding-right: 0px;" align="right"><input type="text" id="lng" name="lng" maxlength="5" value="${station.lng}" style="width: 340px;height: 26px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="lngTip"></span></td>
					</tr>  
					<tr>
						<td class="control-label" width="35%;" style="vertical-align: middle;">IP:</td>
						<td style="width: 140px;padding-right: 0px;" align="right"><input type="text" id="ip" name="ip" maxlength="15" value="${station.ip}" style="width: 340px;height: 26px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="ipTip"></span></td>
					</tr> 
					<tr>
						<td class="control-label" width="35%;" style="vertical-align: middle;">端口:</td>
						<td style="width: 140px;padding-right: 0px;" align="right"><input type="text" id="port" name="port" maxlength="5" value="${station.port}" style="width: 340px;height: 26px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="portTip"></span></td>
					</tr>  
					<tr>
						<td class="control-label" width="35%;" style="vertical-align: middle;">主动发送:</td>
						<td align="left">
						
						支持：     <input type="radio" name="type" value="0" <c:if test="${station.type == 0}"> checked="checked"</c:if>/>&nbsp;&nbsp;&nbsp;&nbsp;
						不支持：<input type="radio" name="type" value="1" <c:if test="${station.type == 1}"> checked="checked"</c:if> />
						</td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"></td>
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
