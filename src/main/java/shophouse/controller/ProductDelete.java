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

@WebServlet("/delete")
public class ProductDelete extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String val = req.getParameter("id");
		Dao dao = new Dao();
		try 
		{
			int check = dao.deleteProduct(Integer.valueOf(val));
			if(check==1)
			{
				RequestDispatcher rd= req.getRequestDispatcher("/listproducts.jsp");
				rd.include(req, resp);
			}
			
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) 
		{
			e.printStackTrace();
		}
	}

}
