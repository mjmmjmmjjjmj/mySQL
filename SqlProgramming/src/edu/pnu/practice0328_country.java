package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

//1. world 데이터베이스에는 테이블이 3개가 있다.
//각각의 테이블에 저장된 데이터를 모두 읽어서 화면에 출력하세요.
//city
//country
//countrylanguage

public class practice0328_country {
	public static void main(String[] args) {

		Connection con = null;
		try {
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/world";
			String username = "scott";
			String password = "tiger";

			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);

			String sql = "select * from country";

			Statement st = con.createStatement();
//			ResultSet rs = st.executeQuery("select code, name, continent, region, surfacearea, indepyear, population, governmentform from country limit 250");
			ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData meta = rs.getMetaData();
			int count = meta.getColumnCount();

			while (rs.next()) {
				for(int i = 1; i<= count; i++) {
					
				System.out.print(rs.getString(i)+((i==count)?"" : ", "));
				}
				System.out.println();
			}

//				System.out.print(rs.getString("code") + ", ");
//				System.out.print(rs.getString("name") + ", ");
//				System.out.print(rs.getString("continent") + ", ");
//				System.out.print(rs.getString("region") + ", ");
//				System.out.print(rs.getString("surfacearea") + ", ");
//				System.out.print(rs.getString("indepyear") + ", ");
//				System.out.print(rs.getString("population") + ", ");
//				System.out.print(rs.getString("governmentform") + "\n");
			rs.close();
			st.close();
			con.close();

		} catch (Exception e) {
			System.out.println("실패 : " + e.getMessage());
		}
	}
}