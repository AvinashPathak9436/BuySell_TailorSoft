package buysell_tailorsoft.commontask;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import buysell_tailorsoft.beans.*;
import buysell_tailorsoft.dbtask.*;
import buysell_tailorsoft.dbtask.DbConnection;
import buysell_tailorsoft.commontask.*;

public class LoginTask {
	
	
	private static LoginTask task;
	
	
	public static LoginTask getInstance()
	{
		
		
		if(task==null)
		{
			
			
			synchronized (LoginTask.class) 
			{
				if(task==null)
				task=new LoginTask();
			}
		}
		return task;
	}
	
	
	public String  authenticateUser(UsersLogin u)
	{
		
		PreparedStatement ps=null;
		ResultSet rs=null;
		Connection con=DbConnection.createConnection();
		String utype_status=null;
		
		try {
			String strsql="SELECT * FROM usercredentials where userid=? and userpass=?";
			ps=con.prepareStatement(strsql);
			ps.setString(1, u.getId());
			ps.setString(2, u.getPass());
			rs=ps.executeQuery();
			if(rs.next())
			{
			String ut=rs.getString("usertype");
			String status=rs.getString("status");
			utype_status=ut+","+status;
			
			System.out.println(ut+status+"   "+utype_status);
			}
			
				
			
		}
		catch(SQLException se)
		{
			se.printStackTrace();
						
		}
		
		finally {
			
			
			
			if(ps!=null)
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(rs!=null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//con.close();
		}
		
		
		
		return utype_status;
		
		
		
	}
	
	public boolean checkUserId(String id)
	{
		PreparedStatement ps=null;
		ResultSet rs=null;
		Connection con=DbConnection.createConnection();
		
		
		try {
			String strsql="select * from usercredentials where userid=?";
			ps=con.prepareStatement(strsql);
			ps.setString(1, id);
			System.out.println(ps);
			
			rs=ps.executeQuery();
			if(rs.next())
			{
			return  true;
			}
			
				
			
		}
		catch(SQLException se)
		{
			se.printStackTrace();
						
		}
		
		finally {
			
			
			
			if(ps!=null)
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(rs!=null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//con.close();
		}
		
		
		
		return false;
		
	}
	
	
	
}
