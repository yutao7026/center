<%@page import="com.novel.osp.manager.util.SessionUtil"%>
<%@page import="com.novel.osp.manager.util.IConstants"%>
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
		url:'${ctx}/product/upload',
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

function upload1(obj){
	$("#imageUrl1").val("");
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
	
	$.ajaxFileUpload({
		url:'${ctx}/product/upload',
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
				document.getElementById("bgImg1").src = "${ctx}/file/image?fileName=" + d[1];
			}else if(d[0] == "2"){
				$("#msgText").text("图片上传失败");
				$("#message").attr("class", "alert alert-danger");
				$("#message").css({"display":""});  
			} 
		},
		error: function (data, status, e){
			$("#textfield1").text("");
			alert(e);
		}
	});
}

function upload2(obj){
	$("#imageUrl2").val("");
	document.getElementById('textfield2').innerText=obj.value.split('\\')[obj.value.split('\\').length - 1]
	var file = $("#file2").val();
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
		url:'${ctx}/product/upload',
		secureuri:false,
		fileElementId:'file2',
		dataType: 'text',
		async:false,
		success: function (data, status){
			var d = data.split(":");
			if(d[0] == "1"){
				//$("#uDiv").css({"display":""});
				//$("#message").attr("class", "alert alert-success");
				//$("#message").css({"display":""}); 
				//$("#msgText").text("添加产品成功");
				$("#imageUrl2").val(d[1]);
				document.getElementById("bgImg2").src = "${ctx}/file/image?fileName=" + d[1];
			}else if(d[0] == "2"){
				$("#msgText").text("图片上传失败");
				$("#message").attr("class", "alert alert-danger");
				$("#message").css({"display":""});  
			} 
		},
		error: function (data, status, e){
			$("#textfield2").text("");
			alert(e);
		}
	});
}

function upload3(obj){
	$("#imageUrl3").val("");
	document.getElementById('textfield3').innerText=obj.value.split('\\')[obj.value.split('\\').length - 1]
	var file = $("#file3").val();
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
		url:'${ctx}/product/upload',
		secureuri:false,
		fileElementId:'file3',
		dataType: 'text',
		async:false,
		success: function (data, status){
			var d = data.split(":");
			if(d[0] == "1"){
				//$("#uDiv").css({"display":""});
				//$("#message").attr("class", "alert alert-success");
				//$("#message").css({"display":""}); 
				//$("#msgText").text("添加产品成功");
				$("#imageUrl3").val(d[1]);
				document.getElementById("bgImg3").src = "${ctx}/file/image?fileName=" + d[1];
			}else if(d[0] == "2"){
				$("#msgText").text("图片上传失败");
				$("#message").attr("class", "alert alert-danger");
				$("#message").css({"display":""});  
			} 
		},
		error: function (data, status, e){
			$("#textfield3").text("");
			alert(e);
		}
	});
}

function upload4(obj){
	$("#imageUrl4").val("");
	document.getElementById('textfield4').innerText=obj.value.split('\\')[obj.value.split('\\').length - 1]
	var file = $("#file4").val();
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
		url:'${ctx}/product/upload',
		secureuri:false,
		fileElementId:'file4',
		dataType: 'text',
		async:false,
		success: function (data, status){
			var d = data.split(":");
			if(d[0] == "1"){
				//$("#uDiv").css({"display":""});
				//$("#message").attr("class", "alert alert-success");
				//$("#message").css({"display":""}); 
				//$("#msgText").text("添加产品成功");
				$("#imageUrl4").val(d[1]);
				document.getElementById("bgImg4").src = "${ctx}/file/image?fileName=" + d[1];
			}else if(d[0] == "2"){
				$("#msgText").text("图片上传失败");
				$("#message").attr("class", "alert alert-danger");
				$("#message").css({"display":""});  
			} 
		},
		error: function (data, status, e){
			$("#textfield4").text("");
			alert(e);
		}
	});
}

function upload5(obj){
	$("#imageUrl5").val("");
	document.getElementById('textfield5').innerText=obj.value.split('\\')[obj.value.split('\\').length - 1]
	var file = $("#file5").val();
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
		url:'${ctx}/product/upload',
		secureuri:false,
		fileElementId:'file5',
		dataType: 'text',
		async:false,
		success: function (data, status){
			var d = data.split(":");
			if(d[0] == "1"){
				//$("#uDiv").css({"display":""});
				//$("#message").attr("class", "alert alert-success");
				//$("#message").css({"display":""}); 
				//$("#msgText").text("添加产品成功");
				$("#imageUrl5").val(d[1]);
				document.getElementById("bgImg5").src = "${ctx}/file/image?fileName=" + d[1];
			}else if(d[0] == "2"){
				$("#msgText").text("图片上传失败");
				$("#message").attr("class", "alert alert-danger");
				$("#message").css({"display":""});  
			} 
		},
		error: function (data, status, e){
			$("#textfield5").text("");
			alert(e);
		}
	});
}




function upload1En(obj){
	$("#imageUrl1En").val("");
	document.getElementById('textfield1En').innerText=obj.value.split('\\')[obj.value.split('\\').length - 1]
	var file = $("#file1En").val();
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
		url:'${ctx}/product/upload',
		secureuri:false,
		fileElementId:'file1En',
		dataType: 'text',
		async:false,
		success: function (data, status){
			var d = data.split(":");
			if(d[0] == "1"){
				//$("#uDiv").css({"display":""});
				//$("#message").attr("class", "alert alert-success");
				//$("#message").css({"display":""}); 
				//$("#msgText").text("添加产品成功");
				$("#imageUrl1En").val(d[1]);
				document.getElementById("bgImg1En").src = "${ctx}/file/image?fileName=" + d[1];
			}else if(d[0] == "2"){
				$("#msgText").text("图片上传失败");
				$("#message").attr("class", "alert alert-danger");
				$("#message").css({"display":""});  
			} 
		},
		error: function (data, status, e){
			$("#textfield1En").text("");
			alert(e);
		}
	});
}

function upload2En(obj){
	$("#imageUrl2En").val("");
	document.getElementById('textfield2En').innerText=obj.value.split('\\')[obj.value.split('\\').length - 1]
	var file = $("#file2En").val();
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
		url:'${ctx}/product/upload',
		secureuri:false,
		fileElementId:'file2En',
		dataType: 'text',
		async:false,
		success: function (data, status){
			var d = data.split(":");
			if(d[0] == "1"){
				//$("#uDiv").css({"display":""});
				//$("#message").attr("class", "alert alert-success");
				//$("#message").css({"display":""}); 
				//$("#msgText").text("添加产品成功");
				$("#imageUrl2En").val(d[1]);
				document.getElementById("bgImg2En").src = "${ctx}/file/image?fileName=" + d[1];
			}else if(d[0] == "2"){
				$("#msgText").text("图片上传失败");
				$("#message").attr("class", "alert alert-danger");
				$("#message").css({"display":""});  
			} 
		},
		error: function (data, status, e){
			$("#textfield2En").text("");
			alert(e);
		}
	});
}

function upload3En(obj){
	$("#imageUrl3En").val("");
	document.getElementById('textfield3En').innerText=obj.value.split('\\')[obj.value.split('\\').length - 1]
	var file = $("#file3En").val();
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
		url:'${ctx}/product/upload',
		secureuri:false,
		fileElementId:'file3En',
		dataType: 'text',
		async:false,
		success: function (data, status){
			var d = data.split(":");
			if(d[0] == "1"){
				//$("#uDiv").css({"display":""});
				//$("#message").attr("class", "alert alert-success");
				//$("#message").css({"display":""}); 
				//$("#msgText").text("添加产品成功");
				$("#imageUrl3En").val(d[1]);
				document.getElementById("bgImg3En").src = "${ctx}/file/image?fileName=" + d[1];
			}else if(d[0] == "2"){
				$("#msgText").text("图片上传失败");
				$("#message").attr("class", "alert alert-danger");
				$("#message").css({"display":""});  
			} 
		},
		error: function (data, status, e){
			$("#textfield3En").text("");
			alert(e);
		}
	});
}

function upload4En(obj){
	$("#imageUrl4En").val("");
	document.getElementById('textfield4En').innerText=obj.value.split('\\')[obj.value.split('\\').length - 1]
	var file = $("#file4En").val();
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
		url:'${ctx}/product/upload',
		secureuri:false,
		fileElementId:'file4En',
		dataType: 'text',
		async:false,
		success: function (data, status){
			var d = data.split(":");
			if(d[0] == "1"){
				//$("#uDiv").css({"display":""});
				//$("#message").attr("class", "alert alert-success");
				//$("#message").css({"display":""}); 
				//$("#msgText").text("添加产品成功");
				$("#imageUrl4En").val(d[1]);
				document.getElementById("bgImg4En").src = "${ctx}/file/image?fileName=" + d[1];
			}else if(d[0] == "2"){
				$("#msgText").text("图片上传失败");
				$("#message").attr("class", "alert alert-danger");
				$("#message").css({"display":""});  
			} 
		},
		error: function (data, status, e){
			$("#textfield4En").text("");
			alert(e);
		}
	});
}

function upload5En(obj){
	$("#imageUrl5En").val("");
	document.getElementById('textfield5En').innerText=obj.value.split('\\')[obj.value.split('\\').length - 1]
	var file = $("#file5En").val();
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
		url:'${ctx}/product/upload',
		secureuri:false,
		fileElementId:'file5En',
		dataType: 'text',
		async:false,
		success: function (data, status){
			var d = data.split(":");
			if(d[0] == "1"){
				//$("#uDiv").css({"display":""});
				//$("#message").attr("class", "alert alert-success");
				//$("#message").css({"display":""}); 
				//$("#msgText").text("添加产品成功");
				$("#imageUrl5En").val(d[1]);
				document.getElementById("bgImg5En").src = "${ctx}/file/image?fileName=" + d[1];
			}else if(d[0] == "2"){
				$("#msgText").text("图片上传失败");
				$("#message").attr("class", "alert alert-danger");
				$("#message").css({"display":""});  
			} 
		},
		error: function (data, status, e){
			$("#textfield5En").text("");
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
					<li><a href="${ctx}/product" style="width: 60px;font-size: 12px;">产品管理</a></li>
					<li><span style="width: 30px;font-size: 12px;"><c:if test="${product.id == null}">增加</c:if><c:if test="${product.id != null}">编辑</c:if></span></li>
				</ul>
			</div>
		</div>
		<br />
		<form id="inputForm" name="inputForm" action="${ctx}/product/${action}" method="post" class="form-horizontal">
		<c:if test="${not empty message}">
			<div id="message" class="alert alert-${msgType}" style="width: 90%;"><button data-dismiss="alert" class="close">×</button>${message}</div>
			
		</c:if>
		<div id="message" style="width: 90%;display: none;"><a class="close" href="#">×</a><span id="msgText"></span></div>
			<div class="panel panel-default" style="width: 90%;">
				<div class="panel-heading"><strong>产品管理</strong></div>
				<input type="hidden" id="id" name="id" value="${product.id}"/>
				<table class="table">
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">标题:</td>
						<td width="130px" style="padding-right: 0px;" align="left"><input type="text" id="title" name="title" value="${product.title}" style="width: 200px;height: 25px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="titleTip"></span></td>
					</tr>
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">副标题:</td>
						<td width="130px" style="padding-right: 0px;" align="left"><input type="text" id="secondTitle" name="secondTitle" value="${product.secondTitle}" style="width: 200px;height: 25px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="secondTitleTip"></span></td>
					</tr>
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">描述:</td>
						<td width="130px" style="padding-right: 0px;" align="left">
						<input type="text" id="description" name="description" value="${product.description}" style="width: 200px;height: 25px;" class="form-control"/>
						<input type="hidden" id="backgroundImageUrl" name="backgroundImageUrl" value="${product.backgroundImageUrl}"/>
						</td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="descriptionTip"></span></td>
					</tr>
					
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">详细描述:</td>
						<td width="130px" style="padding-right: 0px;" align="left">
						<textarea  rows="10" id="content" name="content" style="width: 200px;" class="form-control">${product.content}</textarea>
						</td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;</font><span id="contentTip"></span></td>
					</tr>
					
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">英文版标题:</td>
						<td width="130px" style="padding-right: 0px;" align="left"><input type="text" id="titleEn" name="titleEn" value="${product.titleEn}" style="width: 200px;height: 25px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="titleEnTip"></span></td>
					</tr>
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">英文版副标题:</td>
						<td width="130px" style="padding-right: 0px;" align="left"><input type="text" id="secondTitleEn" name="secondTitleEn" value="${product.secondTitleEn}" style="width: 200px;height: 25px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="secondTitleEnTip"></span></td>
					</tr>
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">英文版描述:</td>
						<td width="130px" style="padding-right: 0px;" align="left">
						<input type="text" id="descriptionEn" name="descriptionEn" value="${product.descriptionEn}" style="width: 200px;height: 25px;" class="form-control"/>
						</td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="descriptionEnTip"></span></td>
					</tr>
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">详细描述英文:</td>
						<td width="130px" style="padding-right: 0px;" align="left">
						<textarea  rows="10" id="contentEn" name="contentEn" style="width: 200px;" class="form-control">${product.contentEn}</textarea>
						</td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;</font><span id="contentEnTip"></span></td>
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
							<img id="bgImg" src="${ctx}/file/image?fileName=${product.backgroundImageUrl}" width="200px"/>
						</td>
					</tr>
					
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">概览图片1:</td>
						<td colspan="2">
							<table class="table" style="width: 200px;margin: 0px;">
								<tr>
									<td align="right" style="vertical-align: middle;padding-left: 0px;">
										<input type="hidden" id="imageUrl1" name="imageUrl1" value="${product.imageUrl1}"/>
										<div class="file-box">
											<div id='textfield1' class='txt' style="width: 200px;vertical-align: middle;padding-top: 2px;" align="left"></div>
										</div>
										
									</td>
									<td align="left" valign="middle">
										<span class="btn fileinput-button" style="height: 25px;padding-top: 1px;vertical-align: middle;border: 1px solid #ddd;">
									        <span>浏览</span>
									        <input type="file" name="file" class="file" id="file1" onchange="javascript:upload1(this);"/>
									    </span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2">
							<img id="bgImg1" src="${ctx}/file/image?fileName=${product.imageUrl1}" width="200px"/>
						</td>
					</tr>
					
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">概览图片2:</td>
						<td colspan="2">
							<table class="table" style="width: 200px;margin: 0px;">
								<tr>
									<td align="right" style="vertical-align: middle;padding-left: 0px;">
										<input type="hidden" id="imageUrl2" name="imageUrl2" value="${product.imageUrl2}"/>
										<div class="file-box">
											<div id='textfield2' class='txt' style="width: 200px;vertical-align: middle;padding-top: 2px;" align="left"></div>
										</div>
										
									</td>
									<td align="left" valign="middle">
										<span class="btn fileinput-button" style="height: 25px;padding-top: 1px;vertical-align: middle;border: 1px solid #ddd;">
									        <span>浏览</span>
									        <input type="file" name="file" class="file" id="file2" onchange="javascript:upload2(this);"/>
									    </span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2">
							<img id="bgImg2" src="${ctx}/file/image?fileName=${product.imageUrl2}" width="200px"/>
						</td>
					</tr>
					
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">概览图片3:</td>
						<td colspan="2">
							<table class="table" style="width: 200px;margin: 0px;">
								<tr>
									<td align="right" style="vertical-align: middle;padding-left: 0px;">
										<input type="hidden" id="imageUrl3" name="imageUrl3" value="${product.imageUrl3}"/>
										<div class="file-box">
											<div id='textfield3' class='txt' style="width: 200px;vertical-align: middle;padding-top: 2px;" align="left"></div>
										</div>
										
									</td>
									<td align="left" valign="middle">
										<span class="btn fileinput-button" style="height: 25px;padding-top: 1px;vertical-align: middle;border: 1px solid #ddd;">
									        <span>浏览</span>
									        <input type="file" name="file" class="file" id="file3" onchange="javascript:upload3(this);"/>
									    </span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2">
							<img id="bgImg3" src="${ctx}/file/image?fileName=${product.imageUrl3}" width="200px"/>
						</td>
					</tr>
					
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">概览图片4:</td>
						<td colspan="2">
							<table class="table" style="width: 200px;margin: 0px;">
								<tr>
									<td align="right" style="vertical-align: middle;padding-left: 0px;">
										<input type="hidden" id="imageUrl4" name="imageUrl4" value="${product.imageUrl4}"/>
										<div class="file-box">
											<div id='textfield4' class='txt' style="width: 200px;vertical-align: middle;padding-top: 2px;" align="left"></div>
										</div>
										
									</td>
									<td align="left" valign="middle">
										<span class="btn fileinput-button" style="height: 25px;padding-top: 1px;vertical-align: middle;border: 1px solid #ddd;">
									        <span>浏览</span>
									        <input type="file" name="file" class="file" id="file4" onchange="javascript:upload4(this);"/>
									    </span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2">
							<img id="bgImg4" src="${ctx}/file/image?fileName=${product.imageUrl4}" width="200px"/>
						</td>
					</tr>
					
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">概览图片5:</td>
						<td colspan="2">
							<table class="table" style="width: 200px;margin: 0px;">
								<tr>
									<td align="right" style="vertical-align: middle;padding-left: 0px;">
										<input type="hidden" id="imageUrl5" name="imageUrl5" value="${product.imageUrl5}"/>
										<div class="file-box">
											<div id='textfield5' class='txt' style="width: 200px;vertical-align: middle;padding-top: 2px;" align="left"></div>
										</div>
										
									</td>
									<td align="left" valign="middle">
										<span class="btn fileinput-button" style="height: 25px;padding-top: 1px;vertical-align: middle;border: 1px solid #ddd;">
									        <span>浏览</span>
									        <input type="file" name="file" class="file" id="file5" onchange="javascript:upload5(this);"/>
									    </span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2">
							<img id="bgImg5" src="${ctx}/file/image?fileName=${product.imageUrl5}" width="200px"/>
						</td>
					</tr>
					
					
					
					
					
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">概览图片1英文:</td>
						<td colspan="2">
							<table class="table" style="width: 200px;margin: 0px;">
								<tr>
									<td align="right" style="vertical-align: middle;padding-left: 0px;">
										<input type="hidden" id="imageUrl1En" name="imageUrl1En" value="${product.imageUrl1En}"/>
										<div class="file-box">
											<div id='textfield1En' class='txt' style="width: 200px;vertical-align: middle;padding-top: 2px;" align="left"></div>
										</div>
										
									</td>
									<td align="left" valign="middle">
										<span class="btn fileinput-button" style="height: 25px;padding-top: 1px;vertical-align: middle;border: 1px solid #ddd;">
									        <span>浏览</span>
									        <input type="file" name="file" class="file" id="file1En" onchange="javascript:upload1En(this);"/>
									    </span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2">
							<img id="bgImg1En" src="${ctx}/file/image?fileName=${product.imageUrl1En}" width="200px"/>
						</td>
					</tr>
					
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">概览图片2英文:</td>
						<td colspan="2">
							<table class="table" style="width: 200px;margin: 0px;">
								<tr>
									<td align="right" style="vertical-align: middle;padding-left: 0px;">
										<input type="hidden" id="imageUrl2En" name="imageUrl2En" value="${product.imageUrl2En}"/>
										<div class="file-box">
											<div id='textfield2En' class='txt' style="width: 200px;vertical-align: middle;padding-top: 2px;" align="left"></div>
										</div>
										
									</td>
									<td align="left" valign="middle">
										<span class="btn fileinput-button" style="height: 25px;padding-top: 1px;vertical-align: middle;border: 1px solid #ddd;">
									        <span>浏览</span>
									        <input type="file" name="file" class="file" id="file2En" onchange="javascript:upload2En(this);"/>
									    </span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2">
							<img id="bgImg2En" src="${ctx}/file/image?fileName=${product.imageUrl2En}" width="200px"/>
						</td>
					</tr>
					
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">概览图片3英文:</td>
						<td colspan="2">
							<table class="table" style="width: 200px;margin: 0px;">
								<tr>
									<td align="right" style="vertical-align: middle;padding-left: 0px;">
										<input type="hidden" id="imageUrl3En" name="imageUrl3En" value="${product.imageUrl3En}"/>
										<div class="file-box">
											<div id='textfield3En' class='txt' style="width: 200px;vertical-align: middle;padding-top: 2px;" align="left"></div>
										</div>
										
									</td>
									<td align="left" valign="middle">
										<span class="btn fileinput-button" style="height: 25px;padding-top: 1px;vertical-align: middle;border: 1px solid #ddd;">
									        <span>浏览</span>
									        <input type="file" name="file" class="file" id="file3En" onchange="javascript:upload3En(this);"/>
									    </span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2">
							<img id="bgImg3En" src="${ctx}/file/image?fileName=${product.imageUrl3En}" width="200px"/>
						</td>
					</tr>
					
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">概览图片4英文:</td>
						<td colspan="2">
							<table class="table" style="width: 200px;margin: 0px;">
								<tr>
									<td align="right" style="vertical-align: middle;padding-left: 0px;">
										<input type="hidden" id="imageUrl4En" name="imageUrl4En" value="${product.imageUrl4En}"/>
										<div class="file-box">
											<div id='textfield4En' class='txt' style="width: 200px;vertical-align: middle;padding-top: 2px;" align="left"></div>
										</div>
										
									</td>
									<td align="left" valign="middle">
										<span class="btn fileinput-button" style="height: 25px;padding-top: 1px;vertical-align: middle;border: 1px solid #ddd;">
									        <span>浏览</span>
									        <input type="file" name="file" class="file" id="file4En" onchange="javascript:upload4En(this);"/>
									    </span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2">
							<img id="bgImg4En" src="${ctx}/file/image?fileName=${product.imageUrl4En}" width="200px"/>
						</td>
					</tr>
					
					<tr>
						<td class="control-label" width="45%;" style="vertical-align: middle;">概览图片5英文:</td>
						<td colspan="2">
							<table class="table" style="width: 200px;margin: 0px;">
								<tr>
									<td align="right" style="vertical-align: middle;padding-left: 0px;">
										<input type="hidden" id="imageUrl5En" name="imageUrl5En" value="${product.imageUrl5En}"/>
										<div class="file-box">
											<div id='textfield5En' class='txt' style="width: 200px;vertical-align: middle;padding-top: 2px;" align="left"></div>
										</div>
										
									</td>
									<td align="left" valign="middle">
										<span class="btn fileinput-button" style="height: 25px;padding-top: 1px;vertical-align: middle;border: 1px solid #ddd;">
									        <span>浏览</span>
									        <input type="file" name="file" class="file" id="file5En" onchange="javascript:upload5En(this);"/>
									    </span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2">
							<img id="bgImg5En" src="${ctx}/file/image?fileName=${product.imageUrl5En}" width="200px"/>
						</td>
					</tr>
				</table>
			</div>
			<%	
				if(SessionUtil.checkPurview(session)) {
					%>
					<div class="form-actions">
						<button id="submit_btn" class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-save"></span>&nbsp;保存</button>&nbsp; <a id="cancel_btn" class="btn btn-primary" href="${ctx}/product"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;返回</a>
					</div>
					<%
				}
			%>
			
		</form>
	</div>
</body>
</html>
