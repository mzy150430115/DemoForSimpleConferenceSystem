<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=basePath %>images/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>images/css/css.css" />
<script type="text/javascript" src="<%=basePath %>images/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/sdmenu.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/laydate/laydate.js"></script>
</HEAD>
<%
	String username=(String)session.getAttribute("user");  String sf=(String)session.getAttribute("sf");  
	if(username==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
%>
<body>
<div class="left">
     
<script type="text/javascript">
var myMenu;
window.onload = function() {
	myMenu = new SDMenu("my_menu");
	myMenu.init();
};
</script>

<div id="my_menu" class="sdmenu">

	
	 <%if(sf.equals("管理员")){ %>
	 <div class="collapsed">
		<span>密码信息管理</span>
		<a href="<%=basePath %>admin/system/editpwd.jsp" target="MainFrame">密码信息管理</a> 
	</div> 
	<div class="collapsed">
		<span>用户信息管理</span>
		<a href="<%=basePath %>admin/system/index.jsp" target="MainFrame">用户信息管理</a> 
		<a href="<%=basePath %>admin/system/add.jsp?method=addm" target="MainFrame">增加用户信息</a> 
		 <a href="<%=basePath %>admin/system/s.jsp" target="MainFrame">用户信息查询</a>  
	</div>
	<div class="collapsed">
		<span>部门信息管理</span>
		<a href="<%=basePath %>admin/bm/index.jsp" target="MainFrame">部门信息管理</a> 
		<a href="<%=basePath %>admin/bm/add.jsp?method=addbm" target="MainFrame">增加部门信息</a> 
		 <a href="<%=basePath %>admin/bm/s.jsp" target="MainFrame">部门信息查询</a>  
	</div> 
	<div class="collapsed">
		<span>楼层信息管理</span>
		<a href="<%=basePath %>admin/fl/index.jsp" target="MainFrame">楼层信息管理</a> 
		<a href="<%=basePath %>admin/fl/add.jsp?method=addfl" target="MainFrame">增加楼层信息</a>  
	</div> 
	<div class="collapsed">
		<span>会议室管理</span>
		<a href="<%=basePath %>admin/hys/index.jsp" target="MainFrame">会议室管理</a> 
		<a href="<%=basePath %>admin/hys/add.jsp?method=addhys" target="MainFrame">增加会议室</a> 
		 <a href="<%=basePath %>admin/hys/s.jsp" target="MainFrame">会议室查询</a>  
	</div>
	
	<div class="collapsed">
		<span>用户预约管理</span>
		<a href="<%=basePath %>admin/yy/index2.jsp" target="MainFrame">用户预约管理</a>  
		<a href="<%=basePath %>admin/yy/s2.jsp" target="MainFrame">用户预约查询</a> 
	</div> 
	
	<div class="collapsed">
		<span>部门预约管理</span>
		<a href="<%=basePath %>admin/bmyy/index2.jsp" target="MainFrame">部门预约管理</a>  
		<a href="<%=basePath %>admin/bmyy/s2.jsp" target="MainFrame">部门预约查询</a>   
	</div>
	<%}else if(sf.equals("部门")){ %>
	<div class="collapsed">
		<span>密码信息管理</span>
		<a href="<%=basePath %>admin/bm/editpwd.jsp" target="MainFrame">密码信息管理</a> 
	</div> 
	<div class="collapsed">
		<span>会议室管理</span>
		<a href="<%=basePath %>admin/hys/index3.jsp" target="MainFrame">会议室管理</a>  
		 <a href="<%=basePath %>admin/hys/s3.jsp" target="MainFrame">会议室查询</a>  
	</div>
	<div class="collapsed">
		<span>部门预约管理</span>
		<a href="<%=basePath %>admin/bmyy/index.jsp" target="MainFrame">部门预约管理</a>  
		<a href="<%=basePath %>admin/bmyy/s.jsp" target="MainFrame">部门预约查询</a> 
	</div> 
	
	<%}else{ %>
	<div class="collapsed">
		<span>密码信息管理</span>
		<a href="<%=basePath %>admin/system/editpwd.jsp" target="MainFrame">密码信息管理</a> 
	</div> 
	 <div class="collapsed">
		<span>个人信息管理</span>
		<a href="<%=basePath %>admin/system/index2.jsp" target="MainFrame">个人信息管理</a> 
	</div> 
	 <div class="collapsed">
		<span>会议室管理</span>
		<a href="<%=basePath %>admin/hys/index2.jsp" target="MainFrame">会议室管理</a>  
		 <a href="<%=basePath %>admin/hys/s2.jsp" target="MainFrame">会议室查询</a>  
	</div>
	<div class="collapsed">
		<span>用户预约管理</span>
		<a href="<%=basePath %>admin/yy/index.jsp" target="MainFrame">用户预约管理</a>  
		<a href="<%=basePath %>admin/yy/s.jsp" target="MainFrame">用户预约查询</a> 
	</div> 
	 <%} %>
	 
 
 	<div class="collapsed">
		<span>注销退出系统</span>
		<a onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="<%=basePath %>AdminServlet?method=adminexit" target="_top" >注销退出系统</a>
	</div> 
</div>
     </div>
     <div class="Switch"></div>
     <script type="text/javascript">
	$(document).ready(function(e) {
    $(".Switch").click(function(){
	$(".left").toggle();
	 
		});
});
</script> 
</body>
<%} %>

</html>
