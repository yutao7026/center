/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: jetty/9.3.6.v20151106
 * Generated at: 2016-03-04 00:52:03 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.monitor;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.novel.osp.manager.util.IConstants;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("file:/D:/repo/javax/servlet/jstl/1.2/jstl-1.2.jar", Long.valueOf(1449826394344L));
    _jspx_dependants.put("jar:file:/D:/repo/javax/servlet/jstl/1.2/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153356282000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("com.novel.osp.manager.util.IConstants");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.release();
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      if (_jspx_meth_c_005fset_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"zh-CN\">\r\n");
      out.write("<head>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/WEB-INF/layouts/common.jsp", out, false);
      out.write("\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/static/js/common.js\" type=\"text/javascript\" charset=\"UTF-8\"></script>\r\n");
      out.write("<title>地图监测</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/static/style/zTreeStyle.css\" type=\"text/css\">\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/static/js/jquery.ztree.core-3.5.min.js\"></script>\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/static/js/leaflet/leaflet.css\" />\r\n");
      out.write("\t<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/static/js/leaflet/leaflet.js\"></script>\r\n");
      out.write("\t<style>\r\n");
      out.write("\t\t#map { \r\n");
      out.write("\t\t\theight: 700px;\r\n");
      out.write("\t\t\twidth:100%;\r\n");
      out.write("\t\t\t }\r\n");
      out.write("\t\t\t \r\n");
      out.write("\t\t.hf *{\r\n");
      out.write("\t\t\tpadding:0; margin:0; font-size:12px; font-family: Verdana, Arial, Helvetica, AppleGothic, sans-serif;\r\n");
      out.write("\t\t\tfont: normal #333;\r\n");
      out.write("\t\t}\t\r\n");
      out.write("\t</style>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\t\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\tfunction getTextByStatus(status){\r\n");
      out.write("\t\tvar obj = new Object();\r\n");
      out.write("\t\tif(status == \"0\"){\r\n");
      out.write("\t\t\tobj.text = \"隔供模式\";\r\n");
      out.write("\t\t\tobj.color = \"#339900\";\r\n");
      out.write("\t\t}else if(status == \"1\"){\r\n");
      out.write("\t\t\tobj.text = \"市电停电\";\r\n");
      out.write("\t\t\tobj.color = \"#FF0000\";\r\n");
      out.write("\t\t}else if(status == \"2\"){\r\n");
      out.write("\t\t\tobj.text = \"浮充模式\";\r\n");
      out.write("\t\t\tobj.color = \"#33ccff\";\r\n");
      out.write("\t\t}else if(status == \"3\"){\r\n");
      out.write("\t\t\tobj.text = \"直供模式\";\r\n");
      out.write("\t\t\tobj.color = \"#0000FF\";\r\n");
      out.write("\t\t}else if(status == \"4\"){\r\n");
      out.write("\t\t\tobj.text = \"充电故障\";\r\n");
      out.write("\t\t\tobj.color = \"#FFC0CB\";\r\n");
      out.write("\t\t}else if(status == \"5\"){\r\n");
      out.write("\t\t\tobj.text = \"索数未回\";\r\n");
      out.write("\t\t\tobj.color = \"#33ff33\";\r\n");
      out.write("\t\t}else if(status == \"6\"){\r\n");
      out.write("\t\t\tobj.text = \"通信中断\";\r\n");
      out.write("\t\t\tobj.color = \"#ff992a\";\r\n");
      out.write("\t\t}else if(status == \"7\"){\r\n");
      out.write("\t\t\tobj.text = \"回数异常\";\r\n");
      out.write("\t\t\tobj.color = \"#a52a2a\";\r\n");
      out.write("\t\t}else if(status == \"8\"){\r\n");
      out.write("\t\t\tobj.text = \"工作端口连接不成功\";\r\n");
      out.write("\t\t\tobj.color = \"#000000\";\r\n");
      out.write("\t\t}else if(status == \"9\"){\r\n");
      out.write("\t\t\tobj.text = \"正在获取电源信息...\";\r\n");
      out.write("\t\t\tobj.color = \"#FFDEAD\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\treturn obj;\r\n");
      out.write("\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction chargesourceText(type){\r\n");
      out.write("\t\tif(type == \"A\"){\r\n");
      out.write("\t\t\treturn \"AC充电\";\r\n");
      out.write("\t\t}else if(type == \"B\"){\r\n");
      out.write("\t\t\treturn \"太阳能充电\";\r\n");
      out.write("\t\t}else if(type == \"Z\"){\r\n");
      out.write("\t\t\treturn \"未充电\";\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\treturn \"\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction supplyceelText(type){\r\n");
      out.write("\t\tif(type == \"C\"){\r\n");
      out.write("\t\t\treturn \"A组电池\";\r\n");
      out.write("\t\t}else if(type == \"D\"){\r\n");
      out.write("\t\t\treturn \"B组电池\";\r\n");
      out.write("\t\t}else if(type == \"Y\"){\r\n");
      out.write("\t\t\treturn \"电池未接入\";\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\treturn \"\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction statusText(type){\r\n");
      out.write("\t\tif(type == \"Y\"){\r\n");
      out.write("\t\t\treturn \"正常状态\";\r\n");
      out.write("\t\t}else if(type == \"N\"){\r\n");
      out.write("\t\t\treturn \"报警状态\";\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\treturn \"\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction sdText(type){\r\n");
      out.write("\t\tif(type == \"Y\"){\r\n");
      out.write("\t\t\treturn \"已插入\";\r\n");
      out.write("\t\t}else if(type == \"N\"){\r\n");
      out.write("\t\t\treturn \"未插入\";\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\treturn \"\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction getData(){\r\n");
      out.write("\t\tvar url = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/monitor/powerData?time=\" + new Date().getTime();\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\ttype : \"post\",\r\n");
      out.write("\t\t\tasync : true, \r\n");
      out.write("\t\t\turl : url,\r\n");
      out.write("\t\t\tdata : {},\r\n");
      out.write("\t\t\tdataType : \"json\", \r\n");
      out.write("\t\t\tsuccess : function(result) {\r\n");
      out.write("\t\t\t\tif (result) {\r\n");
      out.write("\t\t\t\t\t//var tr = \"\";\r\n");
      out.write("\t\t\t\t\tvar marqueeStr = \"\";\r\n");
      out.write("\t\t\t\t\tfor(var i = 0; i < result.length; i ++){\r\n");
      out.write("\t\t\t\t\t\tvar random = Math.floor(Math.random() * 10);\r\n");
      out.write("\t\t\t\t\t\t//result[i].powerstatus = random;\r\n");
      out.write("\t\t\t\t\t\tif(result[i].powerstatus == \"0\" || result[i].powerstatus == \"2\" || result[i].powerstatus == \"3\" || result[i].powerstatus == \"9\"){\r\n");
      out.write("\t\t\t\t\t\t\tcontinue;\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\tvar obj = getTextByStatus(result[i].powerstatus);\r\n");
      out.write("\t\t\t\t\t\ttry{\r\n");
      out.write("\t\t\t\t\t\t\tmarqueeStr += \"<span style='color:\"+ obj.color +\";'>\"+ (result[i].recvdatatime == null? \"\" : result[i].recvdatatime) + \"&nbsp;\" + result[i].station.id + \"&nbsp;\" + result[i].station.name + \"&nbsp;\" + obj.text +\"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\";\r\n");
      out.write("\t\t\t\t\t\t}catch(e){}\r\n");
      out.write("\t\t\t\t\t\t//tr += \"<tr height='30px' style='color:\"+ obj.color +\"'>\";\r\n");
      out.write("\t\t\t\t\t\t//tr += \"<td class='textCenter' style='vertical-align: middle;'>\"+ (result[i].recvdatatime == null? \"\" : result[i].recvdatatime) +\"</td>\";\r\n");
      out.write("\t\t\t\t\t\t//tr += \"<td class='textCenter' style='vertical-align: middle;'>\"+ result[i].station.id +\"</td>\";\r\n");
      out.write("\t\t\t\t\t\t//tr += \"<td class='textCenter' style='vertical-align: middle;'>\"+ result[i].station.name +\"</td>\";\r\n");
      out.write("\t\t\t\t\t\t//tr += \"<td class='textCenter' style='vertical-align: middle;'>\"+ obj.text +\"</td>\";\r\n");
      out.write("\t\t\t\t\t\t//tr += \"</tr>\"; \r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t//document.getElementById(\"tbody1\").innerHTML = tr;\r\n");
      out.write("\t\t\t\t\tdocument.getElementById(\"marquee\").innerHTML = marqueeStr;\r\n");
      out.write("\t\t\t\t\tupdateMap(result);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\terror : function(errorMsg) {\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction updateMap(result){\r\n");
      out.write("\t\tfor(var i = 0; i < result.length; i ++){\r\n");
      out.write("\t\t\tfor(var j = 0; j < objs.length; j ++){\r\n");
      out.write("\t\t\t\ttry{\r\n");
      out.write("\t\t\t\tif(result[i].station.id == objs[j].stationId){\r\n");
      out.write("\t\t\t\t\tvar random = Math.floor(Math.random() * 10);\r\n");
      out.write("\t\t\t\t\t//result[i].powerstatus = random;\r\n");
      out.write("\t\t\t\t\tvar obj = getTextByStatus(result[i].powerstatus);\r\n");
      out.write("\t\t\t\t\tobjs[j].setStyle({\r\n");
      out.write("\t\t\t\t\t     color: obj.color,\r\n");
      out.write("\t\t\t\t\t     fillColor: obj.color\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\tvar popupText = \"台站编号：\" + result[i].station.id + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"台站名称：\" + result[i].station.name + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"设备温度：\" + result[i].devtemp + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"环境温度：\" + result[i].envtemp + \", \" + \"环境湿度：\" + result[i].envhum + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"运行模式：\" + obj.text + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"供电源：\" + chargesourceText(result[i].chargesource) + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"供电电池组：\" + supplyceelText(result[i].supplyceel) + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"供电：电压：\" + (result[i].supplyvoltage == null? \"\" : result[i].supplyvoltage);\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"，电流：\" + (result[i].supplycurrent == null? \"\" : result[i].supplycurrent) + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"充电：电压：\" + (result[i].chargevoltage == null? \"\" : result[i].chargevoltage);\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"，电流：\" + (result[i].chargecurrent == null? \"\" : result[i].chargecurrent) + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"负载1：电压\" + (result[i].loadvoltage1 == null? \"\" : result[i].loadvoltage1);\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"，电流：\" + (result[i].loadcurrent1 == null? \"\" : result[i].loadcurrent1) + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"负载2：电压\" + (result[i].loadvoltage2 == null? \"\" : result[i].loadvoltage2);\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"，电流：\" + (result[i].loadcurrent2 == null? \"\" : result[i].loadcurrent2) + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"负载3：电压\" + (result[i].loadvoltage3 == null? \"\" : result[i].loadvoltage3);\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"，电流：\" + (result[i].loadcurrent3 == null? \"\" : result[i].loadcurrent3) + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"负载4：电压\" + (result[i].loadvoltage4 == null? \"\" : result[i].loadvoltage4);\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"，电流：\" + (result[i].loadcurrent4 == null? \"\" : result[i].loadcurrent4) + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"负载5：电压\" + (result[i].loadvoltage5 == null? \"\" : result[i].loadvoltage5);\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"，电流：\" + (result[i].loadcurrent5 == null? \"\" : result[i].loadcurrent5) + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"内阻A：\" + result[i].innerstatus1 + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"内阻B：\" + result[i].innerstatus2 + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"内阻C：\" + result[i].innerstatus3 + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"内阻D：\" + result[i].innerstatus4 + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"门磁：\" + statusText(result[i].flagdoor) + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"红外：\" + statusText(result[i].flagIR) + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"浸水：\" + statusText(result[i].flagwater) + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"雷击：\" + statusText(result[i].flaglight) + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"SD卡：\" + sdText(result[i].flagSD) + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"最近更新时间：\" + (result[i].recvdatatime == null? \"\" : result[i].recvdatatime) + \"<br />\";\r\n");
      out.write("\t\t\t\t\t\tpopupText += \"当前状态持续时间：\" + (result[i].d == null? \"\" : result[i].d) + \"秒<br />\";\r\n");
      out.write("\t\t\t\t\tobjs[j].popupText = popupText;\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t}catch(e){}\r\n");
      out.write("\t\t\t}\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/WEB-INF/layouts/header.jsp", out, false);
      out.write("\r\n");
      out.write("\t<div align=\"center\" style=\"width: 100%\">\r\n");
      out.write("\t\t<div class=\"breadcrumbholder module\" style=\"width: 90%;\">\r\n");
      out.write("\t\t\t<div id=\"breadcrumb\" class=\"breadcrumb module\" style=\"width: 100%; height: 33px;\">\r\n");
      out.write("\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write('/');
      out.print((String)session.getAttribute(IConstants.HOME));
      out.write("\"></a></li>\r\n");
      out.write("\t\t\t\t\t<li><span style=\"width: 60px; font-size: 12px;\">地图监测</span></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<br />\r\n");
      out.write("\t\t<div style=\"width: 90%\" align=\"center\">\r\n");
      out.write("\t\t\t");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t<table style=\"width: 100%;\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"100%\" style=\"vertical-align:top;\">\r\n");
      out.write("\t\t\t\t\t<div id=\"map\" style=\"border: 1px solid #ddd;\"></div>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<td style=\"vertical-align:top;padding-left: 1px;height: 100%;position:relative;\">\r\n");
      out.write("\t\t\t\t\t<div id=\"treeDiv\" style=\"margin-top:0px; height:100%;overflow: auto;border: 1px solid #ddd;width:200px;position:relative;\">\r\n");
      out.write("\t\t\t\t\t\t<ul id=\"tree\" class=\"ztree\"></ul>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div id=\"cd\" style=\"width: 35px;height: 35px;background: #fff;border: 1px solid #BEBEBE;position:absolute;top: 0px; right:0px;z-index:10; -webkit-border-radius: 4px;-moz-border-radius: 4px;-ms-border-radius: 4px;border-radius: 4px;\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t<span id=\"iconSpan\" class=\"glyphicon glyphicon-resize-small\" style=\"margin-top: 9px;\"></span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<!-- \r\n");
      out.write("\t\t\t\t\t<div style=\"margin-top:0px; height:300px;overflow: auto;border: 1px solid #ddd; width: 350px;\">\r\n");
      out.write("\t\t\t\t\t\t<table class=\"table hf\" id=\"table1\" style=\"width: 100%;\">\r\n");
      out.write("\t\t\t\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"textCenter\" style=\"vertical-align: middle;\" width=\"90px\">时间</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"textCenter\" style=\"vertical-align: middle;\" width=\"70px\">台站编号</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"textCenter\" style=\"vertical-align: middle;\" width=\"70px\">台站名称</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<th class=\"textCenter\" style=\"vertical-align: middle;\">台站状态</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t\t\t\t<tbody id=\"tbody1\"></tbody>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t -->\r\n");
      out.write("\t\t\t</td>\t\r\n");
      out.write("\t\t</tr>\t\r\n");
      out.write("\t</table>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<marquee id=\"marquee\" scrollAmount=5 direction=left onmouseover=\"this.stop();\" onmouseout=\"this.start();\"></marquee>\r\n");
      out.write("<script>\r\n");
      out.write("var resizeSmall = \"glyphicon glyphicon-resize-small\"\r\n");
      out.write("var resizeFull = \"glyphicon glyphicon-resize-full\";\r\n");
      out.write("$(\"#cd\").click(function(){\r\n");
      out.write("\t  var classAttr = $(\"#iconSpan\").attr(\"class\");\r\n");
      out.write("\t  if(classAttr == resizeSmall){\r\n");
      out.write("\t\t  $(\"#iconSpan\").attr(\"class\", resizeFull);\r\n");
      out.write("\t  }else if(classAttr == resizeFull){\r\n");
      out.write("\t\t  $(\"#iconSpan\").attr(\"class\", resizeSmall);\r\n");
      out.write("\t  }\r\n");
      out.write("\t  $(\"#treeDiv\").toggle();\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("var mapCenter = new L.LatLng(35.5323, 107.5063); \r\n");
      out.write("var map = new L.Map('map', {\r\n");
      out.write("    center : mapCenter,\r\n");
      out.write("    zoom : 5,\r\n");
      out.write("    maxZoom : 9,\r\n");
      out.write("    minZoom : 5,\r\n");
      out.write("    inertia : false,\r\n");
      out.write("    dragging : true,\r\n");
      out.write("    maxBounds: [[60.58351256610522, 73.920234375], [17.145311187950925, 135.3421875]]\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("var popup1 = new L.popup({autoPan:true, keepInView:false, zoomAnimation:true,offset:L.point(0, -2) ,autoPanPaddingBottomRight:L.point(10, 10)});\r\n");
      out.write("var popup2 = new L.popup({autoPan:true, keepInView:false, zoomAnimation:true,offset:L.point(0, -2) ,autoPanPaddingBottomRight:L.point(10, 10)});\r\n");
      out.write("var wmsLayer = L.tileLayer.wms(\"http://localhost:8081/geowebcache/service/wms\", {\r\n");
      out.write("        layers: 'ARCGIS',\r\n");
      out.write("        format: 'image/png',\r\n");
      out.write("        maxZoom: 9\r\n");
      out.write("});\r\n");
      out.write("wmsLayer.addTo(map);\r\n");
      out.write("var city = ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${citysJson}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write(";\r\n");
      out.write("var stations = ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${stationsJson}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write(";\r\n");
      out.write("\r\n");
      out.write("for(var i = 0; i < city.length; i ++){\r\n");
      out.write("\t(function(){      \r\n");
      out.write("    //var marker = L.marker([city[i].lat, city[i].lng]);\r\n");
      out.write("    var marker = L.circleMarker([city[i].lat, city[i].lng], {\r\n");
      out.write("\t     color: '#ddd',\r\n");
      out.write("\t     fillColor: '#ddd',\r\n");
      out.write("\t     weight: 1,\r\n");
      out.write("\t     fillOpacity: 0.5,\r\n");
      out.write("\t     radius: 1\r\n");
      out.write("\t    });\r\n");
      out.write("\t\tvar lat = city[i].lat;\r\n");
      out.write("\t\tvar lng = city[i].lng;\r\n");
      out.write("\t\tvar name = city[i].name;\r\n");
      out.write("\t\tmarker.on('mouseover', function(e) {\r\n");
      out.write("\t\t    popup1.setLatLng([lat,lng]).setContent(name).openOn(map);\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tmarker.on('mouseout', function(e) {\r\n");
      out.write("\t\t    //map.closePopup();\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\r\n");
      out.write("\t\tmarker.addTo(map);\r\n");
      out.write("  })();  \r\n");
      out.write("}\r\n");
      out.write("var objs = new Array();\r\n");
      out.write("for(var i = 0; i < stations.length; i ++){\r\n");
      out.write("\t(function(){   \r\n");
      out.write("\tvar circle = L.circleMarker([stations[i].lat, stations[i].lng], {\r\n");
      out.write("\t     color: '#ddd',\r\n");
      out.write("\t     fillColor: '#ddd',\r\n");
      out.write("\t     weight: 1,\r\n");
      out.write("\t     fillOpacity: 0.5,\r\n");
      out.write("\t     radius: 5 \r\n");
      out.write("\t    }); \r\n");
      out.write("\t\tcircle.stationId = stations[i].id;\r\n");
      out.write("\t\tvar stationId = stations[i].id;\r\n");
      out.write("\t\tvar lat = stations[i].lat;\r\n");
      out.write("\t\tvar lng = stations[i].lng;\r\n");
      out.write("\t\tvar name = stations[i].name;\r\n");
      out.write("\t\tcircle.on('click', function(e) {\r\n");
      out.write("\t\t\tif(!circle.popupText){\r\n");
      out.write("\t\t\t\tvar popupText = \"台站编号：\" + stationId + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"台站名称：\" + name + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"设备温度：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"环境温度：\" + \"\" + \", \" + \"环境湿度：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"运行模式：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"供电源：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"供电电池组：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"供电电压：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"充电电压：\" + \"\" + \"<br />\"; \r\n");
      out.write("\t\t\t\tpopupText += \"负载1：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"负载2：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"负载3：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"负载4：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"负载5：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"内阻A：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"内阻B：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"内阻C：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"内阻D：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"门磁：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"红外：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"浸水：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"雷击：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"SD卡：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"最近更新时间：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tpopupText += \"当前状态持续时间：\" + \"\" + \"<br />\";\r\n");
      out.write("\t\t\t\tcircle.popupText = popupText;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tpopup1.setLatLng([lat,lng]).setContent(circle.popupText).openOn(map);\r\n");
      out.write("\t\t\t//popup1.update();\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\tfunction mo(e) {\r\n");
      out.write("\t\t\tif(!circle.popupText1){\r\n");
      out.write("\t\t\t\tvar popupText1 = \"台站名称：\" + name;\r\n");
      out.write("\t\t\t\tcircle.popupText1 = popupText1;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tpopup2.setLatLng([lat,lng]).setContent(circle.popupText1).openOn(map);\r\n");
      out.write("\t\t\tcircle.off('mouseover', mo);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tcircle.on('mouseover', mo);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tcircle.on('mouseout', function(e) {\r\n");
      out.write("\t\t\tcircle.on('mouseover', mo);\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\r\n");
      out.write("\t\tcircle.addTo(map);\r\n");
      out.write("\t\tobjs.push(circle);\r\n");
      out.write("  })();  \r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("var setting = {\r\n");
      out.write("\tview: {\r\n");
      out.write("\t\tshowIcon: false\r\n");
      out.write("\t},\r\n");
      out.write("\tdata: {\r\n");
      out.write("\t\tsimpleData: {\r\n");
      out.write("\t\t\tenable: true,\r\n");
      out.write("\t\t\tidKey: \"id\",\r\n");
      out.write("\t\t\tpIdKey: \"pId\",\r\n");
      out.write("\t\t\trootPId: null\r\n");
      out.write("\t\t}\r\n");
      out.write("\t},\r\n");
      out.write("\tcallback: {\r\n");
      out.write("\t\tonClick: onClick\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("};\r\n");
      out.write("\r\n");
      out.write("function onClick(event, treeId, treeNode, clickFlag) {\r\n");
      out.write("\tif(treeNode.id == -1){\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\tvar center = new L.LatLng(treeNode.lat, treeNode.lng);\r\n");
      out.write("\tvar zoom = (treeNode.pId == -1 ? treeNode.zoom : 9);\r\n");
      out.write("\tmap.setView(center, zoom);\r\n");
      out.write("}\t\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("$(document).ready(function(){\r\n");
      out.write("\tvar qg =[{ id:-1, pId:null, name:\"全国\", open:true}];\r\n");
      out.write("\t$.fn.zTree.init($(\"#tree\"), setting, qg.concat(city).concat(stations));\r\n");
      out.write("\t$(\"#breadcrumb\").jBreadCrumb();\r\n");
      out.write("\tsetInterval(getData, 60000);\r\n");
      out.write("\tgetData();\r\n");
      out.write("}); \r\n");
      out.write("</script>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/WEB-INF/layouts/footer.jsp", out, false);
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fset_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_005fset_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fset_005f0.setParent(null);
    // /WEB-INF/views/monitor/list.jsp(4,0) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f0.setVar("ctx");
    // /WEB-INF/views/monitor/list.jsp(4,0) name = value type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f0.setValue(new org.apache.jasper.el.JspValueExpression("/WEB-INF/views/monitor/list.jsp(4,0) '${pageContext.request.contextPath}'",_jsp_getExpressionFactory().createValueExpression(_jspx_page_context.getELContext(),"${pageContext.request.contextPath}",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
    int _jspx_eval_c_005fset_005f0 = _jspx_th_c_005fset_005f0.doStartTag();
    if (_jspx_th_c_005fset_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f0);
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f0.setParent(null);
    // /WEB-INF/views/monitor/list.jsp(222,3) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${not empty message}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
    if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t\t\t<div id=\"message\" class=\"alert alert-");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${msgType}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
        out.write("\"><button data-dismiss=\"alert\" class=\"close\">×</button>");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${message}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
        out.write("</div>\r\n");
        out.write("\t\t\t");
        int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
    return false;
  }
}