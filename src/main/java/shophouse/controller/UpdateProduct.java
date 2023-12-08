package shophouse.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import shophouse.dao.Dao;
import shophouse.dto.Product;
@MultipartConfig(maxFileSize = 16177216)
@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		String val = req.getParameter("product_id");
		Dao dao = new Dao();
		
		try 
		{
			Product product = (Product)req.getSession().getAttribute("product1");
			product.setProductId(Integer.parseInt(req.getParameter("product_id")));
			product.setProductName(req.getParameter("product_name"));
			product.setProductBrand(req.getParameter("product_brand"));
			product.setProductPrize(Double.parseDouble(req.getParameter("product_price")));
			product.setProductDiscount(Double.parseDouble(req.getParameter("product_discount")));
			
			Part img = req.getPart("product_image");
			
			if(img.getSize()>1)
			{
				InputStream inputstream = img.getInputStream();
				product.setProductImage(inputstream.readAllBytes());
			}
			
	
			int updatecheck = dao.updateProduct(product);
			if(updatecheck==1)
			{
				RequestDispatcher rd = req.getRequestDispatcher("admindash.jsp");
				rd.include(req, resp);
			}
			else
			{
				
			}
			
			
			
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
	}
	

}
