package controller;
import java.util.*;
import model.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginDataCollection
 */
@WebServlet("/loginDataCollection")
public class loginDataCollection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginDataCollection() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out=response.getWriter();
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String customerId = request.getParameter("customerID");
		String Password = request.getParameter("password");
		
		final String jdbc_driver="com.mysql.cj.jdbc.Driver";
	    final String db_url = "jdbc:mysql://127.0.0.1:3306/apnabank";
	    final String user="root";
	    final String pass="Mudasser@123";
	      {
	   	  Connection conn = null;
	   	  Statement stmt = null;
	     
	     try {
	   	  Class.forName(jdbc_driver);
	   	  conn = DriverManager.getConnection(db_url,user,pass);
	   	  stmt = conn.createStatement();
	   	  
	   	  String sql ="select pass from customers where customerId="+customerId;
	           
	   	  ResultSet rs=stmt.executeQuery(sql);
	   	  rs.next();
	   	  String passw=rs.getString(1);
	   	  System.out.println(passw);
	   	  stmt.close();
	   	  conn.close();
	   	 System.out.println(passw.equals(Password));
	     if(passw.equals(Password)) {
	    	 logindataModeling m = new logindataModeling();
				m.setcustId(customerId);
				m.setpassWord(Password);
				System.out.println(m.getcustId());
				System.out.println(m.getpassWord());
				
				HttpSession session = request.getSession();
				session.setAttribute("custId", customerId);
				session.setAttribute("password", Password);
				
		     response.sendRedirect(request.getContextPath() + "/websites/Homepage.jsp"); 
	     }
	     
	     else {
	    	 response.sendRedirect(request.getContextPath() + "/websites/login.jsp");
	     }
	     }
	     catch(SQLException e) {
	      	  e.printStackTrace();
	        }catch(Exception e) {
	      	  e.printStackTrace();
	        }
	      	  finally {
	        }
	      }
	}
}


		
	


