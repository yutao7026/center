<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@page import="com.novel.osp.manager.util.SessionUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="/WEB-INF/layouts/common.jsp" />
<title>推荐管理</title>
<script src="<%=IConstants.imgResPath %>resources/manager/static/js/ajaxfileupload.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript">
$(function(){
	$.formValidator.initConfig({formID:"inputForm",theme:"SolidBox",submitOnce:true,
		onError:function(msg,obj,errorlist){}, ajaxPrompt : '正在验证，请稍等...', wideWord:false
	});
	
	$("#videoUrl").formValidator({onShow:"",onFocus:"长度1-300"}).inputValidator({min:1,max:300,onError:"长度1-300",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#videoTime").formValidator({onShow:"",onFocus:"范围10-30000 单位 秒"}).inputValidator({min:10,max:30000,type:"number",onError:"范围10-30000 单位 秒",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});

	
	
	$("#breadcrumb").jBreadCrumb();
	
	if("${recommend.location}" == "5"){
		$("#tr11").css({"display":""});
		$("#tr21").css({"display":""});
		$("#tr31").css({"display":"none"});
		unValidator(false);
	}else{
		$("#tr11").css({"display":"none"});
		$("#tr21").css({"display":"none"});
		$("#tr31").css({"display":""});
		unValidator(true);
	}
	$('#location').change(function() {
		if(this.value == "5"){
			$("#tr11").css({"display":""});
			$("#tr21").css({"display":""});
			$("#tr31").css({"display":"none"});
			unValidator(false);
		}else{
			$("#tr11").css({"display":"none"});
			$("#tr21").css({"display":"none"});
			$("#tr31").css({"display":""});
			unValidator(true);
		}
	});
});

function unValidator(flag){
	$("#videoUrl").unFormValidator(flag);
	$("#videoTime").unFormValidator(flag);
}

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
		url:'${ctx}/recommend/upload',
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
					<li><a href="${ctx}/recommend" style="width: 60px;font-size: 12px;">推荐管理</a></li>
					<li><span style="width: 30px;font-size: 12px;"><c:if test="${recommend.re_id == null}">增加</c:if><c:if test="${recommend.re_id != null}">编辑</c:if></span></li>
				</ul>
			</div>
		</div>
		<br />
		<form id="inputForm" action="${ctx}/recommend/${action}" method="post" class="form-horizontal">
		<input type="hidden" name="re_id" value="${recommend.re_id}" />
			<div id="message" class="alert alert-danger" style="width: 90%;display: none;"><span id="msgText"></span></div>
			<c:if test="${not empty message}">
				<script type="text/javascript">
					$("#message").css({"display":""});  
					$("#msgText").text("${message}");
				</script>
			</c:if>
			<div class="panel panel-default" style="width:90%;">
			  <div class="panel-heading"><strong>推荐管理</strong></div>
			  <table class="table">
			  		<tr>
						<td class="control-label" width="40%;" style="vertical-align: middle;">节目:</td>
						<td style="width: 140px;padding-right: 0px;" align="right">
							<select name="program.id" style="width: 200px;height: 26px;padding-top: 0px;" class="form-control">
							<c:forEach items="${programs}" var="item">
								<option value="${item.id}" <c:if test="${recommend.program.id == item.id}">selected="selected"</c:if>>${item.pg_cname}</option>
							</c:forEach>
						</select>
						</td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;"></font></td>
					</tr>  
					<tr>
						<td class="control-label" width="40%;" style="vertical-align: middle;">页面:</td>
						<td style="width: 140px;padding-right: 0px;" align="right">
							<select name="pageLevel.id" style="width: 200px;height: 26px;padding-top: 0px;" class="form-control">
							<c:forEach items="${pageLevels}" var="item">
								<option value="${item.id}" <c:if test="${recommend.pageLevel.id == item.id}">selected="selected"</c:if>>${item.name}</option>
							</c:forEach>
							</select>
						</td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;"></font></td>
					</tr> 
					<tr>
						<td class="control-label" width="40%;" style="vertical-align: middle;">标签:</td>
						<td style="width: 140px;padding-right: 0px;" align="center">
							<select name="mark" style="width: 200px;height: 26px;padding-top: 0px;padding-top: 0px" class="form-control">
								<c:forEach items="${mark}" var="item">
									<option value="${item.key}" <c:if test="${recommend.mark == item.key}">selected="selected"</c:if>>${item.value}</option>
								</c:forEach>
							</select>
						</td>
						<td class="control-label" style="text-align: left;vertical-align: middle;" width="*"><span id="markTip"></span></td>
					</tr>
					<tr>
						<td class="control-label" width="40%;" style="vertical-align: middle;">位置:</td>
						<td style="width: 140px;padding-right: 0px;" align="right">
							<select id="location" name="location" style="width: 200px;height: 26px;padding-top: 0px;padding-top: 0px" class="form-control">
								<c:forEach items="${locationType}" var="item">
									<option value="${item.key}" <c:if test="${recommend.location == item.key}">selected="selected"</c:if>>${item.value}</option>
								</c:forEach>
							</select>
						</td>
						<td class="control-label" style="text-align: left;vertical-align: middle;" width="*"><span id="locationTip"></span></td>
					</tr>
					<!-- 
					<tr>
						<td class="control-label" width="40%;" style="vertical-align: middle;">类型:</td>
						<td style="width: 140px;padding-right: 0px;" align="center">
							
							<select name="type" style="width: 140px;height: 25px;padding-top: 0px;padding-top: 0px" class="form-control">
								<option value="0" <c:if test="${recommend.type == 0}">selected="selected"</c:if>>图片</option>
								<option value="1" <c:if test="${recommend.type == 1}">selected="selected"</c:if>>视频</option>
							</select>
							
							图片:<input type="radio" name="type" value="0" <c:if test="${recommend.type == 0}">checked="checked"</c:if>>
							视频:<input type="radio" name="type" value="1" <c:if test="${recommend.type == 1}">checked="checked"</c:if>>
						</td>
						<td class="control-label" style="text-align: left;vertical-align: middle;" width="*"><span id="typeTip"></span></td>
					</tr>
					 -->
					<tr id="tr31" style="display: none;">
						<td class="control-label" width="40%;" style="vertical-align: middle;">图片地址:</td>
						<td colspan="2" align="left">
							<table class="table" style="width: 200px;margin: 0px;">
								<tr>
									<td align="right" style="vertical-align: middle;padding-left: 0px;border-top: 0px;">
										<div class="file-box">
											<input type="hidden" id="backgroundImageUrl" name="imageUrl" value="${recommend.imageUrl}" style="width: 140px;height: 25px;" class="form-control"/>
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
							<img id="bgImg" width="200px" alt="" src="${imgResPath}${recommend.imageUrl}">
						</td>
					</tr>
					
					<tr id="tr11" style="display: none;">
						<td class="control-label" width="40%;" style="vertical-align: middle;">视频地址:</td>
						<td style="width: 140px;padding-right: 0px;" align="right"><input type="text" id="videoUrl" name="videoUrl" value="${recommend.videoUrl}" maxlength="300" style="width: 200px;height: 26px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="videoUrlTip"></span></td>
					</tr>
					<tr id="tr21" style="display: none;">
						<td class="control-label" width="40%;" style="vertical-align: middle;">时长:</td>
						<td style="width: 140px;padding-right: 0px;" align="right"><input type="text" id="videoTime" name="videoTime" value="${recommend.videoTime}" maxlength="5" style="width: 200px;height: 26px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="videoTimeTip"></span></td>
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
