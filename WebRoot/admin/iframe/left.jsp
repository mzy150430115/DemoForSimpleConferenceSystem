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

	
	 <%if(sf.equals("����Ա")){ %>
	 <div class="collapsed">
		<span>������Ϣ����</span>
		<a href="<%=basePath %>admin/system/editpwd.jsp" target="MainFrame">������Ϣ����</a> 
	</div> 
	<div class="collapsed">
		<span>�û���Ϣ����</span>
		<a href="<%=basePath %>admin/system/index.jsp" target="MainFrame">�û���Ϣ����</a> 
		<a href="<%=basePath %>admin/system/add.jsp?method=addm" target="MainFrame">�����û���Ϣ</a> 
		 <a href="<%=basePath %>admin/system/s.jsp" target="MainFrame">�û���Ϣ��ѯ</a>  
	</div>
	<div class="collapsed">
		<span>������Ϣ����</span>
		<a href="<%=basePath %>admin/bm/index.jsp" target="MainFrame">������Ϣ����</a> 
		<a href="<%=basePath %>admin/bm/add.jsp?method=addbm" target="MainFrame">���Ӳ�����Ϣ</a> 
		 <a href="<%=basePath %>admin/bm/s.jsp" target="MainFrame">������Ϣ��ѯ</a>  
	</div> 
	<div class="collapsed">
		<span>¥����Ϣ����</span>
		<a href="<%=basePath %>admin/fl/index.jsp" target="MainFrame">¥����Ϣ����</a> 
		<a href="<%=basePath %>admin/fl/add.jsp?method=addfl" target="MainFrame">����¥����Ϣ</a>  
	</div> 
	<div class="collapsed">
		<span>�����ҹ���</span>
		<a href="<%=basePath %>admin/hys/index.jsp" target="MainFrame">�����ҹ���</a> 
		<a href="<%=basePath %>admin/hys/add.jsp?method=addhys" target="MainFrame">���ӻ�����</a> 
		 <a href="<%=basePath %>admin/hys/s.jsp" target="MainFrame">�����Ҳ�ѯ</a>  
	</div>
	
	<div class="collapsed">
		<span>�û�ԤԼ����</span>
		<a href="<%=basePath %>admin/yy/index2.jsp" target="MainFrame">�û�ԤԼ����</a>  
		<a href="<%=basePath %>admin/yy/s2.jsp" target="MainFrame">�û�ԤԼ��ѯ</a> 
	</div> 
	
	<div class="collapsed">
		<span>����ԤԼ����</span>
		<a href="<%=basePath %>admin/bmyy/index2.jsp" target="MainFrame">����ԤԼ����</a>  
		<a href="<%=basePath %>admin/bmyy/s2.jsp" target="MainFrame">����ԤԼ��ѯ</a>   
	</div>
	<%}else if(sf.equals("����")){ %>
	<div class="collapsed">
		<span>������Ϣ����</span>
		<a href="<%=basePath %>admin/bm/editpwd.jsp" target="MainFrame">������Ϣ����</a> 
	</div> 
	<div class="collapsed">
		<span>�����ҹ���</span>
		<a href="<%=basePath %>admin/hys/index3.jsp" target="MainFrame">�����ҹ���</a>  
		 <a href="<%=basePath %>admin/hys/s3.jsp" target="MainFrame">�����Ҳ�ѯ</a>  
	</div>
	<div class="collapsed">
		<span>����ԤԼ����</span>
		<a href="<%=basePath %>admin/bmyy/index.jsp" target="MainFrame">����ԤԼ����</a>  
		<a href="<%=basePath %>admin/bmyy/s.jsp" target="MainFrame">����ԤԼ��ѯ</a> 
	</div> 
	
	<%}else{ %>
	<div class="collapsed">
		<span>������Ϣ����</span>
		<a href="<%=basePath %>admin/system/editpwd.jsp" target="MainFrame">������Ϣ����</a> 
	</div> 
	 <div class="collapsed">
		<span>������Ϣ����</span>
		<a href="<%=basePath %>admin/system/index2.jsp" target="MainFrame">������Ϣ����</a> 
	</div> 
	 <div class="collapsed">
		<span>�����ҹ���</span>
		<a href="<%=basePath %>admin/hys/index2.jsp" target="MainFrame">�����ҹ���</a>  
		 <a href="<%=basePath %>admin/hys/s2.jsp" target="MainFrame">�����Ҳ�ѯ</a>  
	</div>
	<div class="collapsed">
		<span>�û�ԤԼ����</span>
		<a href="<%=basePath %>admin/yy/index.jsp" target="MainFrame">�û�ԤԼ����</a>  
		<a href="<%=basePath %>admin/yy/s.jsp" target="MainFrame">�û�ԤԼ��ѯ</a> 
	</div> 
	 <%} %>
	 
 
 	<div class="collapsed">
		<span>ע���˳�ϵͳ</span>
		<a onclick="if (confirm('ȷ��Ҫ�˳���')) return true; else return false;" href="<%=basePath %>AdminServlet?method=adminexit" target="_top" >ע���˳�ϵͳ</a>
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
