package native_jdbc_programing.ch01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import native_jdbc_programing.dto.Department;

/**JDBC
 * 2021.2.15
 */

public class JdbcConEx2 {

	public static void main(String[] args) {
		Connection con = null;	// 참조변수는 null로 초기화
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		ArrayList<Department> list = null;
		try {
			// 1. JDBC 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// 2. 데이터베이스 커넥션 생성
			String url = "jdbc:mysql://localhost:3306/mysql_study?useSSL=false";
			String user = "user_mysql_study";
			String password = "rootroot";
			con = DriverManager.getConnection(url, user, password);
			System.out.println("con >" + con);
			
			// 3. statement 생성
			String sql = "insert into department values(?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			System.out.println("stmt >" + pstmt);
			
			Department newDept = new Department(7, "회계", 11);
			
			pstmt.setInt(1, newDept.getDeptNo());
			pstmt.setString(2, newDept.getDeptName());
			pstmt.setInt(3, newDept.getFloor());
			System.out.println("pstmt2 >" + pstmt);
			
			//4. pstmt 실행
			int res = pstmt.executeUpdate();
			if (res == 1) {
				System.out.println("추가 성공");
			}else {
				System.out.println("추가 실패");
			}
		} catch (ClassNotFoundException e) {
			System.err.println("JDBC Driver Not Found");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 6. 커넥션 종료
			try { pstmt.close(); } catch (SQLException e) { }
			try { con.close();  } catch (SQLException e) { }		
		}
		
	}

}
