package shophouse.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shophouse.dao.Dao;
import shophouse.dto.Admin;

@WebServlet("/signup")
public class Signup extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String email = req.getParameter("email");
		long number = Long.parseLong(req.getParameter("contact"));
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		
		Admin admin = new Admin();
		admin.setAdminName(name);
		admin.setAdminPassword(password);
		admin.setAdminEmail(email);
		admin.setAdminContact(number);
		admin.setAdminId(3);
		
		
		Dao dao = new Dao();
		
		try
		{	
			int check = dao.saveAdmin(admin);
			if(check==1)
			{
				System.out.println(check);
				req.setAttribute("message", name+" Your id registered sucessfully");
				RequestDispatcher rd = req.getRequestDispatcher("/signup.jsp");
				rd.include(req, resp);
			}
			else
			{
				req.setAttribute("message", name+" Your id is not-registered");
				RequestDispatcher rd = req.getRequestDispatcher("/signup.jsp");
				rd.forward(req, resp);
			}
				
		} 
		catch (ClassNotFoundException | SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
