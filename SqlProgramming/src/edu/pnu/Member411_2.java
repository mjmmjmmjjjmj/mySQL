package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
import java.util.Scanner;

public class Member411_2 {
	public static void main(String[] args) {
		PreparedStatement psmt = null;
		PreparedStatement psmt1 = null;
		Scanner sc = new Scanner(System.in);
		
		try (Connection con = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/.h2/sqlprg", "sa", "1234")) {
			if (!createTable(con))
				return;

			psmt = con.prepareStatement("insert into Member(username,password,birthyear) values(?, ?, ?)");
			psmt1 = con.prepareStatement("insert into BOARD(title, content, id, visitcount) values(?, ?, ?, ?)");
			for (int i = 1; i <= 5; i++) {
				psmt.setString(1, "user" + i);
				psmt.setString(2, "pass" + i);
				psmt.setInt(3, (int)(Math.random()*11)+2000);
				int result = psmt.executeUpdate();
				System.out.println("Member 테이블에 " + result + "개가 입력되었습니다.");
				
				for (int j = 1; j <= 10; j++) {
					psmt1.setString(1, "title" + j);
					psmt1.setString(2, "content" + j);
					psmt1.setInt(3, i);
					psmt1.setInt(4, (int)(Math.random()*101)+0);
					int result1 = psmt1.executeUpdate();
					System.out.println("BOARD 테이블에 " + result1 + "개가 입력되었습니다.");
				}	
			}
			System.out.println("1. Board 데이터 삭제");
			System.out.println("1. Board 데이터 수정");
			int choice = sc.nextInt();
			sc.nextLine();
			
			 switch (choice) {
             case 1:
                 deleteBoardData(con, sc);
                 break;
             case 2:
                 updateBoardData(con, sc);
                 break;
			 }

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// 사용한 리소스 반환. 사용하지 않은 리소스는 null이므로 실행하지 않음.
				if (psmt != null)	psmt.close();
				if (psmt1 != null)	psmt1.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}			
		System.out.println("Done");
	}

	private static void deleteBoardData(Connection con, Scanner sc) {
		// TODO Auto-generated method stub
		System.out.println("type data's num to delete");
		int num = sc.nextInt();
		try (PreparedStatement psmt1 = con.prepareStatement("DELETE FROM BOARD WHERE num = ?")) {
			psmt1.setInt(1, num);
			int result = psmt1.executeUpdate();
			System.out.println(result + "have deleted");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private static void updateBoardData(Connection con, Scanner sc) {
		// TODO Auto-generated method stub
		System.out.println("type data's num to update");
		int num = sc.nextInt();
		sc.nextLine();
		
		System.out.println("type new title");
		String title = sc.nextLine();
		
		System.out.println("type new content");
		String content = sc.nextLine();
	}


	public static boolean createTable(Connection con) {
		Statement st = null;
		try {
			st = con.createStatement();
			st.execute("DROP TABLE Member IF EXISTS");
			st.execute("CREATE TABLE Member (" 
					+ "id INT NOT NULL AUTO_INCREMENT PRIMARY KEY," 
					+ "username varchar(10),"
					+ "password varchar(10)," 
					+ "birthyear int not null,"
					+ "regidate date NOT NULL default(curdate()))");
			
			st.execute("DROP TABLE BOARD IF EXISTS");
			st.execute("CREATE TABLE BOARD (" 
					+ "num INT NOT NULL AUTO_INCREMENT PRIMARY KEY," 
					+ "title varchar(200),"
					+ "content varchar(2000)," 
					+ "id int not null,"
					+ "postdate date NOT NULL default(curdate()),"
					+ "visitcount int DEFAULT 0)");
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (st != null)
					st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

}
