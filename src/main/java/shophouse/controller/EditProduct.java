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
import shophouse.dto.Product;

@WebServlet("/edit")
public class EditProduct extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String val = req.getParameter("id");
		if(val!=null)
		{
			Dao dao = new Dao();
			try 
			{
				Product product = dao.finById(Integer.valueOf(val));
				req.setAttribute("product", product);
				RequestDispatcher rd = req.getRequestDispatcher("editproduct.jsp");
				rd.include(req, resp);
				
			} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			
		}
		
	}

}
