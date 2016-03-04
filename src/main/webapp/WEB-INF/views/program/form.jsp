<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@page import="com.novel.osp.manager.util.SessionUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="/WEB-INF/layouts/common.jsp" />
<script src="<%=IConstants.imgResPath %>resources/manager/static/js/ajaxfileupload.js" type="text/javascript" charset="UTF-8"></script>
<title>节目管理</title>
<script type="text/javascript">
$(function(){
	
	$.formValidator.initConfig({formID:"inputForm",theme:"SolidBox",submitOnce:true,
		onError:function(msg,obj,errorlist){}, ajaxPrompt : '正在验证，请稍等...', wideWord:false
	});
	
	$("#pg_cname").formValidator({onShow:"",onFocus:"长度1-20"}).inputValidator({min:1,max:20,onError:"长度1-20",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#pg_cintroduction").formValidator({onShow:"",onFocus:"长度1-100",onEmpty:"",empty:true}).inputValidator({min:1,max:100,onError:"长度1-100",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#breadcrumb").jBreadCrumb();
});

var imgResPath = "${imgResPath}";

function upload(obj){
	document.getElementById('textfield').innerText=obj.value.split('\\')[obj.value.split('\\').length - 1]
	var file = $("#file").val();
	if(file == ""){
		$("#message").attr("class", "alert alert-danger");
		$("#message").css({"display":""});  
		$("#msgText").text("图片不能为空");
		return;
	}else if(file.substring(file.lastIndexOf(".")) != ".jpg" && file.substring(file.lastIndexOf(".")) != ".png"){
		$("#message").attr("class", "alert alert-danger");
		$("#message").css({"display":""});  
		$("#msgText").text("请上传jpg或png文件！");
		return;
	}
	$("#backgroundImageUrl").val("");
	$("#message").css({"display":"none"});  
	var btn = $("#submit_btn");
    btn.button('loading');
	$.ajaxFileUpload({
		url:'${ctx}/program/upload',
		secureuri:false,
		fileElementId:'file',
		dataType: 'text',
		async:false,
		success: function (data, status){
			var d = data.split(":");
			if(d[0] == "1"){
				$("#backgroundImageUrl").val(d[1]);
				document.getElementById("bgImg").src = imgResPath + d[1];
			}else if(d[0] == "2"){
				$("#msgText").text("图片上传失败");
				$("#message").attr("class", "alert alert-danger");
				$("#message").css({"display":""});  
			} 
			btn.button('reset');
		},
		error: function (data, status, e){
			$("#textfield").text("");
			alert(e);
		}
	});
	
}

function upload1(obj){
	document.getElementById('textfield1').innerText=obj.value.split('\\')[obj.value.split('\\').length - 1]
	var file = $("#file1").val();
	if(file == ""){
		$("#message").attr("class", "alert alert-danger");
		$("#message").css({"display":""});  
		$("#msgText").text("图片不能为空");
		return;
	}else if(file.substring(file.lastIndexOf(".")) != ".jpg" && file.substring(file.lastIndexOf(".")) != ".png"){
		$("#message").attr("class", "alert alert-danger");
		$("#message").css({"display":""});  
		$("#msgText").text("请上传jpg或png文件！");
		return;
	}
	$("#imageUrl1").val("");
	$("#message").css({"display":"none"});  
	var btn = $("#submit_btn");
    btn.button('loading');
	$.ajaxFileUpload({
		url:'${ctx}/program/upload',
		secureuri:false,
		fileElementId:'file1',
		dataType: 'text',
		async:false,
		success: function (data, status){
			var d = data.split(":");
			if(d[0] == "1"){
				//$("#uDiv").css({"display":""});
				//$("#message").attr("class", "alert alert-success");
				//$("#message").css({"display":""}); 
				//$("#msgText").text("添加产品成功");
				$("#imageUrl1").val(d[1]);
				document.getElementById("bgImg1").src = imgResPath + d[1];
			}else if(d[0] == "2"){
				$("#msgText").text("图片上传失败");
				$("#message").attr("class", "alert alert-danger");
				$("#message").css({"display":""});  
			} 
			btn.button('reset');
		},
		error: function (data, status, e){
			$("#textfield1").text("");
			alert(e);
		}
	});
}
</script> 
<style type="text/css">
.file-box{ position:relative;width:200px;}
.txt{ height:24px; border:1px solid #cdcdcd; width:180px;float: left;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
.btn11{ background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:110px;}
.file{ position:absolute; top:0;right:0px; height:24px; filter:alpha(opacity:1);opacity: 1;width:200px;border: 1px solid #ddd; }
.fileinput-button {
  position: relative;
  overflow: hidden;
}
.fileinput-button input {
  position: absolute;
  top: 0;
  right: 0;
  margin: 0;
  opacity: 0;
  -ms-filter: 'alpha(opacity=0)';
  font-size: 200px;
  direction: ltr;
  cursor: pointer;
}
</style>
</head>

<body> 
	<jsp:include page="/WEB-INF/layouts/header.jsp" />
	<div style="width: 100%;" align="center">
		<div class="breadcrumbholder module" style="width: 90%;">
			<div id="breadcrumb" class="breadcrumb module" style="width: 100%;height: 33px;">
				<ul>
					<li><a href="${ctx}/<%=(String)session.getAttribute(IConstants.HOME)%>"></a></li>
					<li><a href="${ctx}/program" style="width: 60px;font-size: 12px;">节目管理</a></li>
					<li><span style="width: 30px;font-size: 12px;"><c:if test="${program.id == null}">增加</c:if><c:if test="${program.id != null}">编辑</c:if></span></li>
				</ul>
			</div>
		</div>
		<br />
		<form id="inputForm" action="${ctx}/program/${action}" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${program.id}" />
			<div id="message" style="width: 90%;display: none;"><span id="msgText"></span></div>
			<div class="panel panel-default" style="width:90%;">
			  <div class="panel-heading"><strong>节目</strong></div>
			  <table class="table">
			  		<tr>
						<td class="control-label" width="40%;" style="vertical-align: middle;">节目类型:</td>
						<td style="width: 140px;padding-right: 0px;" align="right">
							<select name="type" style="width: 200px;height: 26px;padding-top: 0px;padding-top: 0px" class="form-control">
								<c:forEach items="${programType}" var="item">
									<option value="${item.key}" <c:if test="${program.type == item.key}">selected="selected"</c:if>>${item.value}</option>
								</c:forEach>
							</select>
						</td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;</font><span id="typeTip"></span></td>
					</tr>  
					<tr>
						<td class="control-label" width="40%;" style="vertical-align: middle;">节目名称:</td>
						<td style="width: 140px;padding-right: 0px;" align="right"><input type="text" id="pg_cname" name="pg_cname" value="${program.pg_cname}" maxlength="20" style="width: 200px;height: 26px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="pg_cnameTip"></span></td>
					</tr> 
					<tr>
						<td class="control-label" width="40%;" style="vertical-align: middle;">简介:</td>
						<td style="width: 140px;padding-right: 0px;" align="right"><input type="hidden" name="typeRank" value="${program.typeRank}"><input type="hidden" name="rank" value="${program.rank}">
							<!-- <input type="text" id="pg_cintroduction" name="pg_cintroduction" value="${program.pg_cintroduction}" style="width: 200px;height: 26px;" class="form-control"/> -->
							<textarea rows="3" id="pg_cintroduction" name="pg_cintroduction" maxlength="100"  style="width: 200px;" class="form-control">${program.pg_cintroduction}</textarea>
						</td>
						<td class="control-label" style="text-align: left;vertical-align: middle;" width="*"><span id="pg_cintroductionTip"></span></td>
					</tr>
					<tr>
						<td class="control-label" width="40%;" style="vertical-align: middle;">列表图片:</td>
						<td colspan="2" align="left">
							<table class="table" style="width: 200px;margin: 0px;">
								<tr>
									<td align="right" style="vertical-align: middle;padding-left: 0px;border-top: 0px;">
										<div class="file-box">
											<input type="hidden" id="backgroundImageUrl" name="src" value="${program.src}" style="width: 140px;height: 25px;" class="form-control"/>
											<div id='textfield' class='txt' style="width: 200px;vertical-align: middle;padding-top: 2px;" align="left"></div>
										</div>
									</td>
									<td align="left" valign="middle" style="border-top: 0px;">
										<span class="btn fileinput-button" style="height: 25px;padding-top: 1px;vertical-align: middle;border: 1px solid #ddd;">
									        <span>浏览</span>
									        <input type="file" name="file" class="file" id="file" onchange="javascript:upload(this);"/>
									    </span>
									</td>
								</tr>
							</table>
							<img id="bgImg" width="200px" alt="" src="${imgResPath}${program.src}">
						</td>
					</tr>
					
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">详情图片:</td>
						<td colspan="2" align="left">
							<table class="table" style="width: 200px;margin: 0px;">
								<tr>
									<td align="right" style="vertical-align: middle;padding-left: 0px;border-top: 0px;">
										<input type="hidden" id="imageUrl1" name="pg_picurl_detail" value="${program.pg_picurl_detail}"/>
										<div class="file-box">
											<div id='textfield1' class='txt' style="width: 200px;vertical-align: middle;padding-top: 2px;" align="left"></div>
										</div>
										
									</td>
									<td align="left" valign="middle" style="border-top: 0px;">
										<span class="btn fileinput-button" style="height: 25px;padding-top: 1px;vertical-align: middle;border: 1px solid #ddd;">
									        <span>浏览</span>
									        <input type="file" name="file" class="file" id="file1" onchange="javascript:upload1(this);"/>
									    </span>
									</td>
								</tr>
							</table>
							<img id="bgImg1" width="200px" alt="" src="${imgResPath}${program.pg_picurl_detail}">
						</td>
					</tr>
					<tr>
						<td class="control-label" width="40%;" style="vertical-align: middle;">类别:</td>
						<td style="width: 300px;padding-right: 0px;" align="left" colspan="2">
							 <c:forEach items="${bussinessTypes}" var="item" varStatus="i">
							 	  <c:set var="flag" value="false"></c:set>
							  	  <c:forEach items="${program.bussinessTypes}" var="item1">
								   	<c:if test="${item1.id == item.id}">
								    	<c:set var="flag" value="true"></c:set>   
								   	</c:if>
								  </c:forEach>
								  
								  <input type="checkbox" name="bt" value="${item.id}" style="width: 15px;" <c:if test="${flag == true}">checked="checked"</c:if>>${item.name}&nbsp;&nbsp;
									
							  	  <c:if test="${(i.index + 1) % 4 == 0}"><br /></c:if>
							  </c:forEach>
							  
		  					  
						</td>
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
