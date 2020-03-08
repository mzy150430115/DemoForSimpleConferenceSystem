package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;

public class ComServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ComServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
		String date=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		
		
		if(method.equals("addbm")){  //������Ϣ   ***********����ע��  
			String mc = request.getParameter("mc");  
			String mm = request.getParameter("mm");  
			String str=cBean.getString("select id from bm where mc='"+mc+"'");
			if(str==null){
				int flag = cBean.comUp("insert into bm(mc,mm )  values('"+mc+"','"+mm+"' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/bm/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/bm/index.jsp").forward(request, response);
				} 
			}
			else{
				request.setAttribute("message", "��Ϣ�ظ���");
				request.getRequestDispatcher("admin/bm/index.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("upbm")){ //�޸Ĳ�����Ϣ 
			String id=request.getParameter("id");
			String mc = request.getParameter("mc");   
			String mm = request.getParameter("mm"); 
			String str=cBean.getString("select id from bm where mc='"+mc+"' and id!='"+id+"'");
			if(str==null){
				int flag = cBean.comUp("update bm set mc='"+mc+"',mm='"+mm+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/bm/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/bm/index.jsp").forward(request, response);
				}  
			}
			else{
				request.setAttribute("message", "��Ϣ�ظ���");
				request.getRequestDispatcher("admin/bm/index.jsp").forward(request, response);
			}  
		} 
		else if(method.equals("delbm")){//ɾ��������Ϣ
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from bm where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/bm/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "ϵͳά���У����Ժ����ԣ�");
				request.getRequestDispatcher("admin/bm/index.jsp").forward(request, response);
			}
		}  
		
		else if(method.equals("addfl")){  //¥��   ***********����ע��  
			String mc = request.getParameter("mc");  
			String str=cBean.getString("select id from fl where mc='"+mc+"'");
			if(str==null){
				int flag = cBean.comUp("insert into fl(mc)  values('"+mc+"' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/fl/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/fl/index.jsp").forward(request, response);
				} 
			}
			else{
				request.setAttribute("message", "��Ϣ�ظ�");
				request.getRequestDispatcher("admin/fl/index.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("delfl")){//ɾ��¥��
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from fl where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/fl/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "ϵͳά���У����Ժ����ԣ�");
				request.getRequestDispatcher("admin/fl/index.jsp").forward(request, response);
			}
		} 
		 
		
		else if(method.equals("addhys")){  //������   String mc="";String rs="";String fl="";String sb="";String xx=""; 
			String mc = request.getParameter("mc"); 
			String rs = request.getParameter("rs"); 
			String fl = request.getParameter("fl");  
			String sb = request.getParameter("sb"); 
			String xx = request.getParameter("xx");  
			String zt = request.getParameter("zt"); 
			String str=cBean.getString("select id from hys where mc='"+mc+"'");
			if(str==null){
				int flag = cBean.comUp("insert into hys(mc,rs,fl,sb,xx,zt) values('"+mc+"','"+rs+"','"+fl+"','"+sb+"','"+xx+"','"+zt+"' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/hys/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/hys/index.jsp").forward(request, response);
				} 
			}
			else{
				request.setAttribute("message", "��Ϣ�ظ���");
				request.getRequestDispatcher("admin/hys/index.jsp").forward(request, response);
			}   
		} 
		else if(method.equals("uphys")){ //�޸Ļ����� 
			String id=request.getParameter("id");
			String mc = request.getParameter("mc"); 
			String rs = request.getParameter("rs"); 
			String fl = request.getParameter("fl");  
			String sb = request.getParameter("sb"); 
			String xx = request.getParameter("xx"); 
			String zt = request.getParameter("zt"); 
			String str=cBean.getString("select id from hys where mc='"+mc+"' and id!='"+id+"'");
			if(str==null){
				int flag = cBean.comUp("update hys set mc='"+mc+"',rs='"+rs+"',fl='"+fl+"',sb='"+sb+"',xx='"+xx+"',zt='"+zt+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/hys/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/hys/index.jsp").forward(request, response);
				}  
			}
			else{
				request.setAttribute("message", "��Ϣ�ظ���");
				request.getRequestDispatcher("admin/hys/index.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("delhys")){//ɾ��������
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from hys where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/hys/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "ϵͳά���У����Ժ����ԣ�");
				request.getRequestDispatcher("admin/hys/index.jsp").forward(request, response);
			}
		} 
		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		 
		
		else if(method.equals("yyhys")){  //�û�ԤԼ   ***********����ע��  
			String id = request.getParameter("id"); 
			String zt = request.getParameter("zt");  
			String rq = request.getParameter("rq"); 
			String cyr = request.getParameter("cyr"); 
			String zcr = request.getParameter("zcr");  
			String lx = request.getParameter("lx");  
			String str=cBean.getString("select id from yy where hysid='"+id+"' and rq='"+rq+"' and sh='��ͨ��'");
			if(str==null){
				String mc = cBean.getString("select mc from hys where id='"+id+"'  ");
				String rs = cBean.getString("select rs from hys where id='"+id+"'  ");
				String fl = cBean.getString("select fl from hys where id='"+id+"'  ");
				String sb = cBean.getString("select sb from hys where id='"+id+"'  ");
				String username=(String)session.getAttribute("user"); 
				String xm = cBean.getString("select realname from admin where username='"+username+"'  ");
				int flag = cBean.comUp("insert into yy(zt,rq,cyr,zcr,lx,hysid,mc,rs,fl,sb,yh,xm,sh)  " +
						"values('"+zt+"','"+rq+"','"+cyr+"','"+zcr+"','"+lx+"','"+id+"','"+mc+"','"+rs+"','"+fl+"','"+sb+"','"+username+"','"+xm+"','δ���' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/yy/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/yy/index.jsp").forward(request, response);
				} 
			}
			else{
				request.setAttribute("message", "�������Ѿ���ԤԼ��");
				request.getRequestDispatcher("admin/hys/index2.jsp").forward(request, response);
			} 
		}  
		else if(method.equals("delyy")){//ɾ���û�ԤԼ
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from yy where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/yy/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "ϵͳά���У����Ժ����ԣ�");
				request.getRequestDispatcher("admin/yy/index.jsp").forward(request, response);
			}
		} 
		
		else if(method.equals("shyy")){  
			String id=request.getParameter("id");
			String sh = request.getParameter("sh");  
			int flag = cBean.comUp("update yy set sh='"+sh+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/yy/index2.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/yy/index2.jsp").forward(request, response);
			}   
		} 
		else if(method.equals("delyy2")){//ɾ���û�ԤԼ
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from yy where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/yy/index2.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "ϵͳά���У����Ժ����ԣ�");
				request.getRequestDispatcher("admin/yy/index2.jsp").forward(request, response);
			}
		} 
		
		
		
		
		else if(method.equals("bmyy")){  //����ԤԼ   ***********����ע��  
			String id = request.getParameter("id"); 
			String zt = request.getParameter("zt");  
			String rq = request.getParameter("rq"); 
			String cyr = request.getParameter("cyr"); 
			String zcr = request.getParameter("zcr");  
			String lx = request.getParameter("lx");  
			String str=cBean.getString("select id from bmyy where hysid='"+id+"' and rq='"+rq+"' and sh='��ͨ��'");
			if(str==null){
				String mc = cBean.getString("select mc from hys where id='"+id+"'  ");
				String rs = cBean.getString("select rs from hys where id='"+id+"'  ");
				String fl = cBean.getString("select fl from hys where id='"+id+"'  ");
				String sb = cBean.getString("select sb from hys where id='"+id+"'  ");
				String username=(String)session.getAttribute("user"); 
				String xm = "����ԤԼ";
				int flag = cBean.comUp("insert into bmyy(zt,rq,cyr,zcr,lx,hysid,mc,rs,fl,sb,yh,xm,sh)  " +
						"values('"+zt+"','"+rq+"','"+cyr+"','"+zcr+"','"+lx+"','"+id+"','"+mc+"','"+rs+"','"+fl+"','"+sb+"','"+username+"','"+xm+"','δ���' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/bmyy/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/bmyy/index.jsp").forward(request, response);
				} 
			}
			else{
				request.setAttribute("message", "�������Ѿ���ԤԼ��");
				request.getRequestDispatcher("admin/hys/index3.jsp").forward(request, response);
			} 
		}  
		else if(method.equals("delbmyy")){//ɾ������ԤԼ
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from bmyy where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/bmyy/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "ϵͳά���У����Ժ����ԣ�");
				request.getRequestDispatcher("admin/bmyy/index.jsp").forward(request, response);
			}
		} 
		
		else if(method.equals("shbmyy")){  
			String id=request.getParameter("id");
			String sh = request.getParameter("sh");  
			int flag = cBean.comUp("update bmyy set sh='"+sh+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/bmyy/index2.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/bmyy/index2.jsp").forward(request, response);
			}   
		} 
		else if(method.equals("delbmyy2")){//ɾ������ԤԼ
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from bmyy where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/bmyy/index2.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "ϵͳά���У����Ժ����ԣ�");
				request.getRequestDispatcher("admin/bmyy/index2.jsp").forward(request, response);
			}
		}  
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
