package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class QueryByPreparedStatement0409 {
	
	
	public static void main(String[] args) {
		Connection con = null;
		try {
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/world";
			String username = "scott";
			String password = "tiger";
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			
			PreparedStatement pt = con.prepareStatement("select id, name, countrycode, district, population from city where name=?");
					pt.setString(1,  "Seoul");
			ResultSet rs = pt.executeQuery();
			
			while (rs.next()) {
				System.out.print(rs.getString("id")+", ");
				System.out.print(rs.getString("name")+", ");
				System.out.print(rs.getString("countrycode")+", ");
				System.out.print(rs.getString("district")+", ");
				System.out.print(rs.getString("population")+"\n");
			}
			rs.close();
			pt.close();
			con.close();
		} catch(Exception e) {
			System.out.println("연결실패 : "+ e.getMessage());
		}
	}
}
