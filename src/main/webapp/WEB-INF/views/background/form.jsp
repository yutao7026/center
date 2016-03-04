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
<title>背景管理</title>
<script type="text/javascript">
$(function(){
	/*
	$.formValidator.initConfig({formID:"inputForm",theme:"SolidBox",submitOnce:true,
		onError:function(msg,obj,errorlist){
			//$("#errorlist").empty();
			//$.map(errorlist,function(msg){
			//	$("#errorlist").append("<li>" + msg + "</li>")
			//});
		},
		ajaxPrompt : '正在验证，请稍等...'
	});
	
	$("#loginName").formValidator({onShow:"",onFocus:"长度1-20"}).inputValidator({min:1,max:20,onError:"长度1-20",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}}).regexValidator({regExp:"username",dataType:"enum",onError:"输入英文数字下划线，不能数字开头"});
	$("#userName").formValidator({onShow:"",onFocus:"长度1-32"}).inputValidator({min:1,max:32,onError:"长度1-32",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#phone").formValidator({onShow:"",onFocus:"请输入11位手机号",onEmpty:"",empty:true}).inputValidator({min:11,max:11,onError:"请输入11位手机号"}).regexValidator({regExp:"intege1",dataType:"enum",onError:"请输入11位手机号"});
	$("#email").formValidator({onShow:"",onFocus:"请输入邮箱",onEmpty:"",empty:true}).inputValidator({min:1,max:32,onError:"长度1-32"}).regexValidator({regExp:"email",dataType:"enum",onError:"邮箱格式错误"});
	*/
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
	}else if(file.substring(file.lastIndexOf(".")) != ".png"){
		$("#message").attr("class", "alert alert-danger");
		$("#message").css({"display":""});  
		$("#msgText").text("请上传png文件！");
		return;
	}
	$("#message").css({"display":"none"});  
	$("#backgroundImageUrl").val("");
	var btn = $("#submit_btn");
    btn.button('loading');
	$.ajaxFileUpload({
		url:'${ctx}/background/upload',
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
					<li><a href="${ctx}/background" style="width: 60px;font-size: 12px;">背景管理</a></li>
					<li><span style="width: 30px;font-size: 12px;">编辑</span></li>
				</ul>
			</div>
		</div>
		<br />
		<form id="inputForm" action="${ctx}/background/${action}" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${background.id}" />
		<input type="hidden" name="pageLevel.id" value="${background.pageLevel.id}" />
			<div id="message" style="width: 90%;display: none;"><span id="msgText"></span></div>
			<div class="panel panel-default" style="width:90%;">
			  <div class="panel-heading"><strong>${background.pageLevel.name}</strong></div>
			  <input type="hidden" id="backgroundImageUrl" name="url" value="${background.url}"/>
			  <table class="table">
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
			  </table>
			  <img id="bgImg" width="100%" alt="" src="${imgResPath}${background.url}">
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
