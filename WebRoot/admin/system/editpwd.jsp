<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=basePath %>images/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>images/css/css.css" />
<script type="text/javascript" src="<%=basePath %>images/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/sdmenu.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/laydate/laydate.js"></script>
</head>
<script type="text/javascript">
function check()
{
	if(document.form1.oldpwd.value=="")
	{
		alert("����������룡");
		document.form1.oldpwd.focus();
		return false;
	}
	if(document.form1.newpwd.value=="")
	{
		alert("�����������룡");
		document.form1.newpwd.focus();
		return false;
	} 
	if(document.form1.repwd.value=="")
	{
		alert("��ȷ�����룡");
		document.form1.repwd.focus();
		return false;
	}
	if(document.form1.repwd.value!=document.form1.newpwd.value)
	{
		alert("�Բ���������������벻��ͬ����ȷ�����룡");
		document.form1.repwd.focus();
		return false;
	}
}
function checkPasswords() {
        var pass1 = document.getElementById("newpwd");
        var pass2 = document.getElementById("repwd");
 
        if (pass2.value != pass1.value)
            pass2.setCustomValidity("������������벻ƥ��");
        else
            pass2.setCustomValidity("");
}
</script>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
			message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(basePath+"/error.jsp");
	}
	else{ 
%>
<body>
<div class="right_cont">
<div class="title_right"><strong>������Ϣ����</strong></div>  
<div style="width:900px;margin:auto;">
<form action="<%=basePath %>AdminServlet?method=uppwd" method="post" name="form1">
<table class="table table-bordered">
	 <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">��&nbsp;&nbsp;��&nbsp;&nbsp;�룺</td>
     <td><input type="password" name="oldpwd" class="span3" required/></td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">��&nbsp;&nbsp;��&nbsp;&nbsp;�룺</td>
     <td><input type="password" name="newpwd" id="newpwd" onchange="checkPasswords()" class="span3" required/></td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">ȷ�����룺</td>
     <td><input type="password" name="repwd" id="repwd" onchange="checkPasswords()" class="span3" required/></td> 
     </tr>
     <tr>
     	<td class="text-center" colspan="2"><input type="submit" value="ȷ��" class="btn btn-info  " style="width:80px;" /></td>
     </tr>
     </table> 
</form>
   </div>  
 </div>  
</body>
<%} %>
 
