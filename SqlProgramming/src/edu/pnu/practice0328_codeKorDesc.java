package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

//1. world 데이터베이스에는 테이블이 3개가 있다.
//각각의 테이블에 저장된 데이터를 모두 읽어서 화면에 출력하세요.
//city
//country
//countrylanguage

public class practice0328_codeKorDesc {
	public static void main(String[] args) {
		try (Scanner sc = new Scanner(System.in)) {
			System.out.print("Table name: ");
			String tblname = sc.next();
			test(tblname);
		}
	}

	private static void test(String tblname) {
		// TODO Auto-generated method stub
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "scott", "tiger");
			String sql = "SELECT name, countrycode, population "+"from city where countrycode = 'KOR'";

			st = con.createStatement();
//			rs = st.executeQuery("select * from " + tblname + " limit 10");
			rs = st.executeQuery(sql);
			////////////////////////////
			ResultSetMetaData meta = rs.getMetaData();
			int count = meta.getColumnCount();

			while (rs.next()) {
				for (int i = 1; i <= count; i++) {
					System.out.print(rs.getString(i) + ((i == count) ? "" : ", "));
				}
				System.out.println();
			}
		} catch (Exception e) {
			System.out.println("실패 : " + e.getMessage());
		} finally {
			try {
			if(rs != null) rs.close();
			if(st != null) st.close();
			if(con != null)con.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}

	}

}