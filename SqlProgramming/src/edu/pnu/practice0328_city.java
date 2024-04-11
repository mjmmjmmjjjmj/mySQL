package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

//1. world 데이터베이스에는 테이블이 3개가 있다.
//각각의 테이블에 저장된 데이터를 모두 읽어서 화면에 출력하세요.
//city
//country
//countrylanguage

public class practice0328_city {
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
			ResultSet rs = st.executeQuery("select id, name, countrycode, district, population from city limit 5000");

			while (rs.next()) {
				System.out.print(rs.getString("id") + ", ");
				System.out.print(rs.getString("name") + ", ");
				System.out.print(rs.getString("countrycode") + ", ");
				System.out.print(rs.getString("district") + ", ");
				System.out.print(rs.getString("population") + "\n");
			}

			rs.close();
			st.close();
			con.close();

		} catch (Exception e) {
			System.out.println("실패 : " + e.getMessage());
		}
	}
}