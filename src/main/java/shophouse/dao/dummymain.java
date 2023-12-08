package shophouse.dao;

import java.sql.SQLException;

import shophouse.dto.Admin;

public class dummymain 
{
	public static void main(String[] args) 
	{

		Dao d = new Dao();
		try {
			Admin a = d.adminLogin("vedeshad20020@gmai1l.com", "vedesh");
			
			
			if(a.getAdminEmail() == null )
			{
				System.out.println(a.getAdminEmail());
				System.out.println("email is correct");
			}
			else if(a.getAdminPassword()!= null )
			{
				System.out.println("pass is correct");
			}
			else
			{
				System.out.println(a.getAdminEmail());
				System.out.println(a.getAdminPassword());
				System.out.println("Both");
			}
		} 
		catch (ClassNotFoundException | SQLException e) 
		{
			
			e.printStackTrace();
		}
		
	}

}
