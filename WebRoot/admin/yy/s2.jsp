<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />  
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
	if(document.form1.word.value=="" )
	{
		alert("����д��ѯ�ؼ��֣�");
		document.form1.word.focus();
		return false;
	}
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
<div class="title_right"><strong>��Ϣ��ѯ</strong></div>  
<div style="width:900px;margin:auto;">
<form action="<%=basePath %>admin/yy/s2info.jsp" method="post" name="form1">
<table class="table table-bordered">
	 
     <tr> 
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">��ѯ���ͣ�</td>
     <td><select name="lx" class="span4" required>  
    <option value="zt">��������</option> 
    <option value="mc">����������</option> 
    <option value="fl">������¥��</option> 
    <option value="yh">ԤԼ�û�</option> 
    </select></td> 
    </tr>
    <tr> 
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">��ѯ���ݣ�</td>
     <td><input type="text" name="word" class="span4" required/></td> 
     </tr>
     <tr> 
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">ԤԼ���ڣ�</td>
     <td><input type="date" name="rq" class="span4" required/></td> 
     </tr>
     <tr>
     	<td class="text-center" colspan="2"><input type="submit" value="�ύ" class="btn btn-info  " style="width:80px;" /></td>
     </tr>
     </table> 
</form>
   </div>  
 </div>  
</body>
<%} %>
 
