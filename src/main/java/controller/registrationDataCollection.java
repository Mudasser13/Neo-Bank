package controller;
import model.*;
import java.io.IOException;

import javax.servlet.Registration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class registrationDataCollection
 */
@WebServlet("/registrationDataCollection")
public class registrationDataCollection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registrationDataCollection() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String First_name = request.getParameter("first_name");
		String Middile_name = request.getParameter("middle_name");
		String Last_name = request.getParameter("last_name");
		String Pass=request.getParameter("password");
		String PhNo = request.getParameter("phno");
		String EmailId = request.getParameter("emailId");
		String dob = request.getParameter("Dob");
		String Gender = request.getParameter("gender");
		String FatherName = request.getParameter("father_name");
		String MotherName = request.getParameter("Mother_name");
		String aadhar = request.getParameter("aadhar");
		String PanCard = request.getParameter("PanCard");
		String Maritalststus = request.getParameter("Maritalstatus");
		String occupation = request.getParameter("occupation");
		String annualIncome = request.getParameter("AnnualIncome");
		String Pwd = request.getParameter("pwd");
	Registr s = new Registr();
	s.setFirstName(First_name);
	s.setMiddleName(Middile_name);
	s.setLastName(Last_name);
	s.setpass(Pass);
	s.setPhNo(PhNo);
	s.setEmailId(EmailId);
	s.setdob(dob);
	s.setGender(Gender);
	s.setFatherName(FatherName);
	s.setMotherName(MotherName);
	s.setaadhar(aadhar);
	s.setPanCard(PanCard);
	s.setMaritalststus(Maritalststus);
	s.setoccupation(occupation);
	s.setannualIncome(annualIncome);
	s.setPwd(Pwd);
	RegistrationdataModeling f = new RegistrationdataModeling();
	f.insertFeedbackData(s);
		
	response.sendRedirect(request.getContextPath() + "/websites/login.jsp");
		
	}

}
