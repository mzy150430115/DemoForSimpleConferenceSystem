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
<script  language="javascript" >
function top2(){
   	form3.action="<%=basePath%>admin/hys/index2.jsp?page=1";
    form3.submit();
}
function last2(){
    if(form3.pageCount.value==0){//�����ҳ��Ϊ0����ô���һҳΪ1��Ҳ���ǵ�һҳ�������ǵ�0ҳ
    form3.action="<%=basePath%>admin/hys/index2.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>admin/hys/index2.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre2(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("������һҳ");
  }else{
    form3.action="<%=basePath%>admin/hys/index2.jsp?page="+(page-1);
    form3.submit();
  }
}

function next2(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("�������һҳ");
  }else{
    form3.action="<%=basePath%>admin/mb/index.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump2(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("��ת�ı�����ֻ����������!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//�����ת�ı����������ҳ���������һҳ���������������һҳ
	  if(pageCount==0){	
	  form3.action="<%=basePath%>admin/hys/index2.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>admin/hys/index2.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//������������0����ô����������1
      form3.action="<%=basePath%>admin/hys/index2.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>admin/hys/index2.jsp?page="+page;
      form3.submit();
   }

}

}
//****�ж��Ƿ���Number.
function fIsNumber (sV,sR){
var sTmp;
if(sV.length==0){ return (false);}
for (var i=0; i < sV.length; i++){
sTmp= sV.substring (i, i+1);
if (sR.indexOf (sTmp, 0)==-1) {return (false);}
}
return (true);
}
function del()
{
	pageform.submit();
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
	
	String username=(String)session.getAttribute("user"); String sf=(String)session.getAttribute("sf"); 
	if(username==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{  
%>
<body>
<div class="right_cont">
<div class="title_right"><strong>�����ҹ���</strong></div>  
<div style="width:100%;margin:auto;">
<form action="" method="post" name="form3">	
<table class="table table-bordered table-striped table-hover">
     <tbody>
       <tr align="center">
         <td nowrap="nowrap"><strong>���</strong></td>
         <td nowrap="nowrap"><strong>��������</strong></td> 
         <td nowrap="nowrap"><strong>��������</strong></td> 
         <td nowrap="nowrap"><strong>����¥��</strong></td>
         <td nowrap="nowrap"><strong>��ý���豸</strong></td>
         <td nowrap="nowrap"><strong>��ϸ˵��</strong></td>
         <td nowrap="nowrap"><strong>ʹ��״̬</strong></td>
         <td width="80" nowrap="nowrap"><strong>����</strong></td>
       </tr>
<%   
	cb.setEVERYPAGENUM(12);
	int cou = cb.getMessageCount("select count(*) from hys ");//�õ���Ϣ����			        
	String page1=request.getParameter("page");
	if(page1==null){
		page1="1";
	}
	session.setAttribute("busMessageCount", cou + "");
	session.setAttribute("busPage", page1);
	List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from hys order by id desc",7);
	session.setAttribute("qqq", pagelist1);
	int pageCount = cb.getPageCount(); //�õ�ҳ��  
	session.setAttribute("busPageCount", pageCount + ""); 
	List pagelist3=(ArrayList)session.getAttribute("qqq");
		if(!pagelist3.isEmpty()){
		for(int i=0;i<pagelist3.size();i++){
			List pagelist2 =(ArrayList)pagelist3.get(i);
%>       
       <tr align="center">
         <td nowrap="nowrap"><%=i+1 %></td>
         <td nowrap="nowrap"><%=pagelist2.get(1).toString() %></td>   
         <td nowrap="nowrap"><%=pagelist2.get(2).toString() %></td>   
         <td nowrap="nowrap"><%=pagelist2.get(3).toString() %></td>   
         <td nowrap="nowrap"><%=pagelist2.get(4).toString() %></td>   
         <td nowrap="nowrap"><%=pagelist2.get(5).toString() %></td>   
         <td nowrap="nowrap"><%=pagelist2.get(6).toString() %></td>   
         <td nowrap="nowrap">
         <%if(pagelist2.get(6).toString().equals("����")){ %>
         <a href="<%=basePath%>admin/hys/yy.jsp?method=yyhys&id=<%=pagelist2.get(0).toString()%>">ԤԼ</a>  
         <%} %>
         </td>
       </tr>
<% }} %>
       <tr align="center">
         <td nowrap="nowrap" colspan="9"> 
         <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//���ڸ�����javascript��ֵ-->
	 <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//���ڸ�����javascript��ֵ-->         
					<a href="#" onClick="top2()">��ҳ</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="pre2()">��һҳ</a>&nbsp;&nbsp;&nbsp;
		 ��<%=session.getAttribute("busMessageCount").toString()%>����¼,����<%=session.getAttribute("busPageCount").toString()%>ҳ,��ǰ��<%=session.getAttribute("busPage").toString()%>ҳ&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="next2()">��һҳ</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="last2()">βҳ</a>
	 ��<input name="busjump" type="text" class="span1" />ҳ <a href="#" onClick="bjump2()">ת��</a>&nbsp;&nbsp;&nbsp; 
         </td>
       </tr>        
     </tbody>
   </table>
   </form>
   </div>  
 </div>  
</body>
<%} %>
