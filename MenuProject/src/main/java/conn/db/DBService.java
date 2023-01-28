package conn.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBService {
	private static Connection conn=null;
	static {
		try {
			String url="jdbc:mysql://localhost:3306/cdacjan";
			String user="root";
			String password="shubhamojha098";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(url,user,password);
			if(conn!=null) {
				System.out.println("Connenction is done");
			}else {
				System.out.println("Connection Not done");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error"+e.getMessage());
		}
    
    }
	public static Connection  getConnection() {
		return conn;
		
	}
	

}
