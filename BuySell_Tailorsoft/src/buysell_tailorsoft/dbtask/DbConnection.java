package buysell_tailorsoft.dbtask;
import java.sql.*;
import java.util.ResourceBundle;

public class DbConnection {
	
	private static Connection con;
	private static ResourceBundle rb;
	public static PreparedStatement ps;
	public static ResultSet rs;
	
	public static ResultSet getData(String query,String id) {
		try {
			con=createConnection();
			ps=con.prepareStatement(query);
			ps.setString(1, id);
			rs=ps.executeQuery();
		}
		catch(SQLException se) {
			System.out.println(se);
		}
		return rs;
	}
	
	public static ResultSet getData(String sql) {
		try {
			con=createConnection();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
		}
		catch(SQLException se) {
			System.out.println(se);
		}
		return rs;
	}
	
	public static Connection createConnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //Mysql Driver
			
			rb=ResourceBundle.getBundle("buysell_tailorsoft/dbtask/dbinfo");
		String dbUserid=rb.getString("db.Userid");
		String dbPassword=rb.getString("db.Password");
		String dburl=rb.getString("db.url");
			
			con=DriverManager.getConnection(dburl,dbUserid,dbPassword);  //Line1
			
		}
		catch (Exception cse) {
		System.out.println(cse);	//  handle exception
		}
		
		return con;
	}
	
	 public static void main(String[] args) { Connection cn=createConnection();
	  System.out.println(cn); }
	 
	 public static void closeConnection() {
			System.out.println(con);
			
		}
	 
	 
}