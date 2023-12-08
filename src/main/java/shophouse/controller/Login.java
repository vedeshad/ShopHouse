package shophouse.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shophouse.dao.Dao;
import shophouse.dto.Admin;

@WebServlet("/login")
public class Login extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String msg="";
		Dao dao = new Dao();
		try 
		{
			Admin admin = dao.adminLogin(email, password);
			if(admin!=null)
			{
				RequestDispatcher rd1= req.getRequestDispatcher("/admindash.jsp");
				req.getSession().setAttribute("admin", admin);
				req.getSession().setAttribute("dao", dao);
				rd1.include(req, resp);
			}
			else
			{
				RequestDispatcher rd2= req.getRequestDispatcher("/login.jsp");
				msg="Invalid credentials1";
				req.setAttribute("msg", msg);
				rd2.forward(req, resp);
				
			}
			
		} catch (ClassNotFoundException | SQLException e) 
		{
			
			e.printStackTrace();
		}	
		
	}

}
