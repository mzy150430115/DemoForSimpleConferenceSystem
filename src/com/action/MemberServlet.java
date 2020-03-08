package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;

public class MemberServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public MemberServlet() {
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
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		 if(method.equals("mlogin")){//用户登录 代码都有注释的哦 
			String username = request.getParameter("username"); 
			String password = request.getParameter("password");  
			String sf = request.getParameter("sf");  
			if(sf.equals("部门")){
				String str=cBean.getString("select id from bm where mc='"+username+"' and  mm='"+password+"' ");
				if(str==null){
					request.setAttribute("message", "登录信息错误！");
					request.getRequestDispatcher("index.jsp").forward(request, response); 
				}
				else{
					session.setAttribute("user", username); session.setAttribute("sf", sf);
					request.getRequestDispatcher("admin/index.jsp").forward(request, response); 
				}  
			}
			else{
				String str=cBean.getString("select realname from admin where username='"+username+"' and  password='"+password+"' and  sf='"+sf+"' ");
				if(str==null){
					request.setAttribute("message", "登录信息错误！");
					request.getRequestDispatcher("index.jsp").forward(request, response); 
				}
				else{
					session.setAttribute("user", username); session.setAttribute("sf", sf);
					request.getRequestDispatcher("admin/index.jsp").forward(request, response); 
				}  
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
