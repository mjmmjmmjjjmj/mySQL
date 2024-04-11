package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class QueryByStatement {
	public static void main(String[] args) {
		Connection con = null;
		try { 
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/world";
			String username = "scott";
			String password = "tiger";
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select id, name, countrycode, district, population from city limit 10");
			
			while(rs.next()) {//커서 시프트 어쩌구
				System.out.print(rs.getString("id")+", ");
				System.out.print(rs.getString("name")+", ");
				System.out.print(rs.getString("countrycode")+", ");
				System.out.print(rs.getString("district")+", ");
				System.out.print(rs.getString("population")+"\n");
			}
			rs.close();
			st.close();
			con.close();
			
		} catch(Exception e) {
			System.out.println("연결실패:" + e.getMessage());
		}
		
	}
}
