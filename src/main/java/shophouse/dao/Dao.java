package shophouse.dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import shophouse.dto.Admin;
import shophouse.dto.Product;

public class Dao 
{
	public static Connection getConnection() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/shophouse","root","vedesh");
	}
	
	
	public int saveAdmin(Admin admin) throws ClassNotFoundException, SQLException 
	{
		if(getCount()<2)
		{
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("insert into admin value(?,?,?,?,?)");
			
			pst.setInt(1, admin.getAdminId());
			pst.setString(2, admin.getAdminName());
			pst.setLong(3, admin.getAdminContact());
			pst.setString(4, admin.getAdminEmail());
			pst.setString(5, admin.getAdminPassword());
			
			return pst.executeUpdate();
		}
		else
			return -1;
	}
	
	public Admin adminLogin(String email, String password) throws SQLException, ClassNotFoundException 
	{
		
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("select * from admin where email=?");
		pst.setString(1, email);
		ResultSet rs=pst.executeQuery();
		Admin admin = new Admin();
		
		if(rs.next())
		{

			admin.setAdminId(rs.getInt(1));
			admin.setAdminName(rs.getString(2));
			admin.setAdminContact(rs.getLong(3));
			admin.setAdminEmail(rs.getString(4));
			admin.setAdminPassword(rs.getString(5));
			
		}
		
		if(password.equals(admin.getAdminPassword()))
		{
			return admin;
		}
		return null;	
	}
	
	public int addProduct(Product product) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("insert into product value(?,?,?,?,?,?)");
		
		pst.setInt(1, product.getProductId());
		pst.setString(2, product.getProductName());
		pst.setString(3, product.getProductBrand());
		pst.setDouble(4, product.getProductPrize());
		pst.setDouble(5, product.getProductDiscount());
		Blob img = new SerialBlob(product.getProductImage());
		pst.setBlob(6,img);
		int res = pst.executeUpdate();
		con.close();
		
		return res;
	}
	
	public int updateProduct(Product product) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("update product set Name=?, Brand=?, Prize=?, Discount=?, Image=? where Id=?");
		
		pst.setInt(6, product.getProductId());
		pst.setString(1, product.getProductName());
		pst.setString(2, product.getProductBrand());
		pst.setDouble(3, product.getProductPrize());
		pst.setDouble(4, product.getProductDiscount());
		Blob img = new SerialBlob(product.getProductImage());
		pst.setBlob(5,img);
		int res = pst.executeUpdate();
		con.close();
		
		return res;
	}
		
	public int deleteProduct(int id) throws SQLException, ClassNotFoundException
	{
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("delete from product where Id = ? ");
		pst.setInt(1, id);
		
		int res = pst.executeUpdate();
		con.close();
		
		return res;
		
	}
 
	public Product finById(int id) throws SQLException, ClassNotFoundException
	{
		
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("select * from product where Id=?");
		pst.setInt(1, id);
		
		ResultSet rs=pst.executeQuery();
		rs.next();
		
		Product product = new Product();
		product.setProductId(rs.getInt(1));
		product.setProductName(rs.getString(2));
		product.setProductBrand(rs.getString(3));
		product.setProductPrize(rs.getDouble(4));
		product.setProductDiscount(rs.getDouble(5));
		Blob blobimg = rs.getBlob(6);
		byte []img = blobimg.getBytes(1, (int)blobimg.length());
		product.setProductImage(img);
		con.close();
		
		return product;
		
	}
	
	
	public List<Product> findAll() throws SQLException, ClassNotFoundException
	{
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("select * from product");
		ResultSet rs=pst.executeQuery();
		List<Product> li = new ArrayList<Product>();
		while(rs.next())
		{
			Product product = new Product();
			product.setProductId(rs.getInt(1));
			product.setProductName(rs.getString(2));
			product.setProductBrand(rs.getString(3));
			product.setProductPrize(rs.getDouble(4));
			product.setProductDiscount(rs.getDouble(5));
			Blob blobimg = rs.getBlob(6);
			byte []img = blobimg.getBytes(1, (int)blobimg.length());
			product.setProductImage(img);
			
			li.add(product);
		}
		
		con.close();
		
		return li;	
	}
	
	public int getCount() throws ClassNotFoundException, SQLException
	{
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("select count(*) from admin");
		ResultSet rs=pst.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		con.close();
		return count;
		
	}
	
	
	
}
