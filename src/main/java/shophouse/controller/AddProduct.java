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
@WebServlet("/addproduct")
public class AddProduct extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		Product product = new Product();
		product.setProductId(Integer.parseInt(req.getParameter("product_id")));
		product.setProductName(req.getParameter("product_name"));
		product.setProductBrand(req.getParameter("product_brand"));
		product.setProductPrize(Double.parseDouble(req.getParameter("product_price")));
		product.setProductDiscount(Double.parseDouble(req.getParameter("product_discount")));
		Part img = req.getPart("product_image");
		InputStream inputstream = img.getInputStream();
		product.setProductImage(inputstream.readAllBytes());
		
		Dao d = new Dao();
		try 
		{
			int productcheck = d.addProduct(product);
			if(productcheck==1)
			{
				RequestDispatcher rd = req.getRequestDispatcher("admindash.jsp");
				rd.include(req, resp);
			}
			else
			{
				
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
