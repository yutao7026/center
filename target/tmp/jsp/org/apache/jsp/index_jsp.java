/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: jetty/9.3.6.v20151106
 * Generated at: 2016-03-04 00:51:46 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.novel.osp.manager.util.IConstants;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\n');
      out.write('\n');
      out.write('\n');
      if (_jspx_meth_c_005fset_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title>登录</title>\n");
      out.write("<meta name=\"renderer\" content=\"webkit\">\n");
      out.write("<link rel=\"shortcut icon\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/static/images/logo.png\" type=\"image/x-icon\"/>\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/static/js/dist/css/bootstrap.css\" />\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/static/style/common.css\">\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/static/js/jquery.min.js\"></script>\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/static/js/placeholder.js\" type=\"text/javascript\"></script>\n");
      out.write("<script type=\"text/javascript\"> \n");
      out.write("\t$(function() {\n");
      out.write("\t\tvar userAgent = window.navigator.userAgent.toLowerCase();\n");
      out.write("\t\t\n");
      out.write("\t\tvar ieVer;\n");
      out.write("\t\tif(/msie 7\\.0/i.test(userAgent)){\n");
      out.write("\t\t\tieVer = \"IE7\";\n");
      out.write("\t\t\t$(\"#loginForm\").css({\"display\":\"none\"});\n");
      out.write("\t\t\t$(\".info\").html(\"<h1>请使用ie9或chrome访问 </h1><br/>\" + userAgent + \" \" + ieVer);\n");
      out.write("\t\t}\n");
      out.write("\t\tif(/msie 8\\.0/i.test(userAgent)){\n");
      out.write("\t\t\tieVer = \"IE8\";\n");
      out.write("\t\t\t$(\"#loginForm\").css({\"display\":\"none\"});\n");
      out.write("\t\t\t$(\".info\").html(\"<h1>请使用ie9或chrome访问 </h1><br/>\" + userAgent + \" \" + ieVer);\n");
      out.write("\t\t}\n");
      out.write("\t\tif(/msie 9\\.0/i.test(userAgent)){\n");
      out.write("\t\t\tieVer = \"IE9\";\n");
      out.write("\t\t}\n");
      out.write("\t\tif(/rv:11\\.0/i.test(userAgent)){\n");
      out.write("\t\t\tieVer = \"IE11\";\n");
      out.write("\t\t}\n");
      out.write("\t\tif(/chrome\\/33\\.0/i.test(userAgent)){\n");
      out.write("\t\t\tieVer = \"chrome33\";\n");
      out.write("\t\t}\n");
      out.write("\t\tvar o = $(window).height();\n");
      out.write("\t\to = (o < 600 ? 600 : o);\n");
      out.write("\t\t$(\"#loginDiv\").css({\"height\":o});\n");
      out.write("\t\t$(\"#loginForm\").css({\"margin-top\":(o - 400)/2});\n");
      out.write("\t\t$(\"#loginForm\").css({\"margin-bottom\":(o - 400)/2});\n");
      out.write("\t\t\n");
      out.write("\t});\n");
      out.write("\t\n");
      out.write("\tfunction login(){\n");
      out.write("\t\tvar username = $.trim($(\"#username\").val());\n");
      out.write("\t\tvar password = $.trim($(\"#password\").val());\n");
      out.write("\t\tif((username == \"\" && password == \"\") || (username == \"请输入用户名\" && password == \"请输入密码\")){\n");
      out.write("\t\t\t$(\"#usernameTip\").text(\"用户名不能为空\");\n");
      out.write("\t\t\t$(\"#passwordTip\").text(\"密码不能为空\");\n");
      out.write("\t\t\treturn;\n");
      out.write("\t\t}\n");
      out.write("\t\tif(username == \"\" || username == \"请输入用户名\"){\n");
      out.write("\t\t\t$(\"#usernameTip\").text(\"用户名不能为空\");\n");
      out.write("\t\t\t$(\"#passwordTip\").text(\"\");\n");
      out.write("\t\t\treturn;\n");
      out.write("\t\t}\n");
      out.write("\t\tif(password == \"\" || password == \"请输入密码\"){\n");
      out.write("\t\t\t$(\"#usernameTip\").text(\"\");\n");
      out.write("\t\t\t$(\"#passwordTip\").text(\"密码不能为空\");\n");
      out.write("\t\t\treturn;\n");
      out.write("\t\t}\n");
      out.write("\t\t$.post(\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/login\", {\"username\":username,\"password\":password},   function(data){\n");
      out.write("\t\t\td = data.split(\",\");\n");
      out.write("\t\t\tif(d[0] == \"1\"){\n");
      out.write("\t\t\t\twindow.location.href = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/\" + d[1];\n");
      out.write("\t\t\t}\n");
      out.write("\t\t\tif(d[0] == \"2\"){\n");
      out.write("\t\t\t\t$(\"#usernameTip\").text(\"\");\n");
      out.write("\t\t\t\t$(\"#passwordTip\").text(\"密码错误\");\n");
      out.write("\t\t\t}\n");
      out.write("\t\t\tif(d[0] == \"3\"){\n");
      out.write("\t\t\t\t$(\"#usernameTip\").text(\"用户名不存在\");\n");
      out.write("\t\t\t\t$(\"#passwordTip\").text(\"\");\n");
      out.write("\t\t\t}\n");
      out.write("\t\t\tif(d[0] == \"7\"){\n");
      out.write("\t\t\t\t$(\"#usernameTip\").text(\"用户被禁用\");\n");
      out.write("\t\t\t\t$(\"#passwordTip\").text(\"\");\n");
      out.write("\t\t\t}\n");
      out.write("\t\t});\n");
      out.write("\t}\n");
      out.write("\t\n");
      out.write("\t function enterSumbit(){  \n");
      out.write("\t\tvar event=arguments.callee.caller.arguments[0]||window.event;\n");
      out.write("\t\tif (event.keyCode == 13){  \n");
      out.write("\t\t\tlogin();  \n");
      out.write("\t\t}  \n");
      out.write("\t }  \n");
      out.write("\t\n");
      out.write("\t</script>\n");
      out.write("\t<style>\n");
      out.write("\t\n");
      out.write("\t.shadow {\n");
      out.write("    box-shadow:\n");
      out.write("        0 2px 2px rgba(0,0,0,0),        \n");
      out.write("        0 1px 5px rgba(0,0,0,0),        \n");
      out.write("        0 0 0 12px rgba(33,33,33,0.1); \n");
      out.write("\t}\n");
      out.write("</style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\t<div align=\"center\" id=\"loginDiv\" style=\"padding-bottom: 0px;\">\n");
      out.write("\t<nav class=\"navbar navbar-default\">\n");
      out.write("\t\t<div class=\"navbar-header\">\n");
      out.write("\t\t\t<button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#bs1\">\n");
      out.write("\t\t\t\t<span class=\"sr-only\">Toggle navigation</span> <span class=\"icon-bar\"></span> <span class=\"icon-bar\"></span> <span class=\"icon-bar\"></span>\n");
      out.write("\t\t\t</button>\n");
      out.write("\t\t\t<a class=\"navbar-brand\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/\"><img alt=\"\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/static/images/logo.png\" height=\"22px\" style=\"float: left;\">&nbsp;&nbsp;中心服务器</a>\n");
      out.write("\t\t</div>\n");
      out.write("\t</nav>\n");
      out.write("\t<div style=\"width: 90%\" align=\"center\">\n");
      out.write("\t");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\t</div>\n");
      out.write("\t<div class=\"panel panel-default\" id=\"loginForm\" style=\"width: 500px;height: 280px;\" >\n");
      out.write("\t\t\t\t\t<br />\n");
      out.write("\t\t\t\t\t<div><h4></h4></div>\n");
      out.write("\t\t\t\t\t<br /><br />\n");
      out.write("\t\t\t\t\t<table class=\"table\">\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"right\" width=\"150px\" style=\"vertical-align: middle;\" class=\"control-label\"></td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"left\" width=\"220px\">\n");
      out.write("\t\t\t\t\t\t    <span class=\"input-group-addon\" style=\"background-color: #fff;width:40px;height:30px;float: left;\"><span class=\"glyphicon glyphicon-user\"></span></span>\n");
      out.write("\t\t\t\t\t\t    <input type=\"text\" class=\"form-control\" id=\"username\" name=\"username\" placeholder=\"请输入用户名\" autocomplete=\"off\" style=\"height: 30px;width: 160px;border: 1px solid #ddd;font-size: 14px;color: #969EA1;\">\n");
      out.write("\t\t\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t\t\t\t<td width=\"150px\" style=\"padding-top: 13px;\"><span id=\"usernameTip\" style=\"color: red;font: bold;\"></span></td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"right\" style=\"vertical-align: middle;border-top: 0px;\" class=\"control-label\"></td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"left\" style=\"border-top: 0px;\">\n");
      out.write("\t\t\t\t\t\t\t<span class=\"input-group-addon\" style=\"background-color: #fff;width:40px;height:30px;float: left;\"><span class=\"glyphicon glyphicon-lock\"></span></span>\n");
      out.write("\t\t\t\t\t\t\t<input type=\"password\" class=\"form-control\" id=\"password\" name=\"password\" placeholder=\"请输入密码\" onkeydown=\"javascript:enterSumbit();\" style=\"height: 30px;width: 160px;border: 1px solid #ddd;font-size: 14px;color: #969EA1;padding-left: 12px;\">\n");
      out.write("\t\t\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t\t\t\t<td style=\"padding-top: 13px;border-top: 0px;\"><span id=\"passwordTip\" style=\"color: red;font: bold;\"></span></td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"2\" align=\"right\" style=\"border-top: 0px;\"><button type=\"button\" class=\"btn btn-primary\" onclick=\"javascript:login();\" style=\"width:200px;text-align: left;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"glyphicon glyphicon-log-in\"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录</button></td>\n");
      out.write("\t\t\t\t\t\t\t<td style=\"border-top: 0px;\"></td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t</table>\n");
      out.write("\t</div>\n");
      out.write("\t<div class=\"info\"></div>\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/WEB-INF/layouts/footer.jsp", out, false);
      out.write("\n");
      out.write("\t</div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
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
    // /index.jsp(4,0) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f0.setVar("ctx");
    // /index.jsp(4,0) name = value type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f0.setValue(new org.apache.jasper.el.JspValueExpression("/index.jsp(4,0) '${pageContext.request.contextPath}'",_jsp_getExpressionFactory().createValueExpression(_jspx_page_context.getELContext(),"${pageContext.request.contextPath}",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
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
    // /index.jsp(114,1) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${not empty message}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
    if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("\t\t<div id=\"message\" class=\"alert alert-success\"><button data-dismiss=\"alert\" class=\"close\">×</button>");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${message}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
        out.write("</div>\n");
        out.write("\t");
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