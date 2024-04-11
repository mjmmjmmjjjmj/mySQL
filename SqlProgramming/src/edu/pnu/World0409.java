package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;


public class World0409 {
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.print("Code: ");
		String code = sc.next();
		
		Statement st = null;
		ResultSet rs =  null;
		
		try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "scott", "tiger")) { 
			st = con.createStatement();
			st.executeQuery("SELECT name, population from city where countrycode = ' code ' order by population desc");
			while (rs.next()) {
				System.out.println(rs.getString("Name") + "," + rs.getInt("Population"));
			}
		} catch(Exception e) { 
			try {
				st.close();
				rs.close();
			} catch(SQLException e1) {
				e1.printStackTrace();
			}
		}
		sc.close();
	}
}
