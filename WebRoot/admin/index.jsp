<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%> 
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
 
<META http-equiv=Content-Type content="text/html; charset=gb2312">
 
</HEAD>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/index.jsp");
	}
	else{ 		
%>
<FRAMESET border=0 frameSpacing=0 rows="60, *" frameBorder=0>
<FRAME name=header src="<%=basePath %>admin/iframe/top.jsp" frameBorder=0 noResize scrolling=no>
<FRAMESET cols="200, *">
<FRAME name=menu src="<%=basePath %>admin/iframe/left.jsp" frameBorder=0 noResize>
<FRAME name=MainFrame src="<%=basePath %>admin/iframe/main.jsp" frameBorder=0 noResize scrolling=yes>
</FRAMESET>
</FRAMESET>
<noframes>
</noframes>
<%} %> 
