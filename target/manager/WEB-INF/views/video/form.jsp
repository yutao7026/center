<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@page import="com.novel.osp.manager.util.SessionUtil"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<script src="<%=IConstants.imgResPath %>resources/manager/static/js/ajaxfileupload.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript">
$(function(){
	$.formValidator.initConfig({formID:"inputForm",theme:"SolidBox",submitOnce:true,
		onError:function(msg,obj,errorlist){
			//$("#errorlist").empty();
			//$.map(errorlist,function(msg){
			//	$("#errorlist").append("<li>" + msg + "</li>")
			//});
		},
		ajaxPrompt : '正在验证，请稍等...'
	});
	
	$("#title").formValidator({onShow:"",onFocus:"长度1-128"}).inputValidator({min:1,max:128,onError:"长度1-128",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#secondTitle").formValidator({onShow:"",onFocus:"长度1-128"}).inputValidator({min:1,max:128,onError:"长度1-128",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#description").formValidator({onShow:"",onFocus:"长度1-256"}).inputValidator({min:1,max:256,onError:"长度1-256",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#url").formValidator({onShow:"",onFocus:"长度1-256"}).inputValidator({min:1,max:256,onError:"长度1-256",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#titleEn").formValidator({onShow:"",onFocus:"长度1-128"}).inputValidator({min:1,max:128,onError:"长度1-128",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#secondTitleEn").formValidator({onShow:"",onFocus:"长度1-128"}).inputValidator({min:1,max:128,onError:"长度1-128",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#descriptionEn").formValidator({onShow:"",onFocus:"长度1-256"}).inputValidator({min:1,max:256,onError:"长度1-256",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	
	$("#breadcrumb").jBreadCrumb();
});

function upload(obj){
	$("#backgroundImageUrl").val("");
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
	
	$.ajaxFileUpload({
		url:'${ctx}/video/upload',
		secureuri:false,
		fileElementId:'file',
		dataType: 'text',
		async:false,
		success: function (data, status){
			var d = data.split(":");
			if(d[0] == "1"){
				//$("#uDiv").css({"display":""});
				//$("#message").attr("class", "alert alert-success");
				//$("#message").css({"display":""}); 
				//$("#msgText").text("添加产品成功");
				$("#backgroundImageUrl").val(d[1]);
				document.getElementById("bgImg").src = "${ctx}/file/image?fileName=" + d[1];
			}else if(d[0] == "2"){
				$("#msgText").text("图片上传失败");
				$("#message").attr("class", "alert alert-danger");
				$("#message").css({"display":""});  
			} 
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
	<div style="width: 100%;" align="center">
		<div class="breadcrumbholder module" style="width: 90%;">
			<div id="breadcrumb" class="breadcrumb module" style="width: 100%;height: 33px;">
				<ul>
					<li><a href="${ctx}/focus"></a></li>
					<li><a href="${ctx}/video" style="width: 60px;font-size: 12px;">视频管理</a></li>
					<li><span style="width: 30px;font-size: 12px;"><c:if test="${video.id == null}">增加</c:if><c:if test="${video.id != null}">编辑</c:if></span></li>
				</ul>
			</div>
		</div>
		<br />
		<form id="inputForm" name="inputForm" action="${ctx}/video/${action}" method="post" class="form-horizontal">
		<c:if test="${not empty message}">
			<div id="message" class="alert alert-${msgType}" style="width: 90%;"><button data-dismiss="alert" class="close">×</button>${message}</div>
			
		</c:if>
		<div id="message" style="width: 90%;display: none;"><a class="close" href="#">×</a><span id="msgText"></span></div>
			<div class="panel panel-default" style="width: 90%;">
				<div class="panel-heading"><strong>视频管理</strong></div>
				<input type="hidden" id="id" name="id" value="${video.id}"/>
				<table class="table">
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">标题:</td>
						<td width="130px" style="padding-right: 0px;" align="left"><input type="text" id="title" name="title" value="${video.title}" style="width: 200px;height: 25px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="titleTip"></span></td>
					</tr>
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">副标题:</td>
						<td width="130px" style="padding-right: 0px;" align="left"><input type="text" id="secondTitle" name="secondTitle" value="${video.secondTitle}" style="width: 200px;height: 25px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="secondTitleTip"></span></td>
					</tr>
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">描述:</td>
						<td width="130px" style="padding-right: 0px;" align="left">
						<input type="text" id="description" name="description" value="${video.description}" style="width: 200px;height: 25px;" class="form-control"/>
						<input type="hidden" id="backgroundImageUrl" name="backgroundImageUrl" value="${video.backgroundImageUrl}"/>
						</td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="descriptionTip"></span></td>
					</tr>
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">英文版标题:</td>
						<td width="130px" style="padding-right: 0px;" align="left"><input type="text" id="titleEn" name="titleEn" value="${video.titleEn}" style="width: 200px;height: 25px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="titleEnTip"></span></td>
					</tr>
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">英文版副标题:</td>
						<td width="130px" style="padding-right: 0px;" align="left"><input type="text" id="secondTitleEn" name="secondTitleEn" value="${video.secondTitleEn}" style="width: 200px;height: 25px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="secondTitleEnTip"></span></td>
					</tr>
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">英文版描述:</td>
						<td width="130px" style="padding-right: 0px;" align="left">
						<input type="text" id="descriptionEn" name="descriptionEn" value="${video.descriptionEn}" style="width: 200px;height: 25px;" class="form-control"/>
						</td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="descriptionEnTip"></span></td>
					</tr>
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">视频地址:</td>
						<td width="130px" style="padding-right: 0px;" align="left"><input type="text" id="url" name="url" value="${video.url}" style="width: 200px;height: 25px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="urlTip"></span></td>
					</tr>
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">图片:</td>
						<td colspan="2">
							<table class="table" style="width: 200px;margin: 0px;">
								<tr>
									<td align="right" style="vertical-align: middle;padding-left: 0px;">
										<div class="file-box">
											<div id='textfield' class='txt' style="width: 200px;vertical-align: middle;padding-top: 2px;" align="left"></div>
										</div>
										
									</td>
									<td align="left" valign="middle">
										<span class="btn fileinput-button" style="height: 25px;padding-top: 1px;vertical-align: middle;border: 1px solid #ddd;">
									        <span>浏览</span>
									        <input type="file" name="file" class="file" id="file" onchange="javascript:upload(this);"/>
									    </span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2">
							<img id="bgImg" src="${ctx}/file/image?fileName=${video.backgroundImageUrl}" width="200px"/>
						</td>
					</tr>
				</table>
			</div>
			<%	
				if(SessionUtil.checkPurview(session)) {
					%>
					<div class="form-actions">
						<button id="submit_btn" class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-save"></span>&nbsp;保存</button>&nbsp; <a id="cancel_btn" class="btn btn-primary" href="${ctx}/video"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;返回</a>
					</div>
					<%
				}
			%>
			
		</form>
	</div>
</body>
</html>
