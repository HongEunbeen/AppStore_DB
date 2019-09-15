package mirim.hs.kr;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import mirim.hs.kr.DBConnection;

public class UserDAO {
	private Connection conn = DBConnection.getConnection();
	private PreparedStatement pstmt;
	private ResultSet rs;
	 
	public int join(User user) {

		String SQL = "INSERT INTO REGISTER (NAME, COMPANY, GENDER, AGE, EMAIL, PASSWORD, PHONE, COMPHONE) VALUES (?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
		
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getCompany());
			pstmt.setString(3, user.getGender());
			pstmt.setString(4, user.getAge());
			pstmt.setString(5, user.getEmail());
			pstmt.setString(6, user.getPassword());
			pstmt.setString(7, user.getPhone());
			pstmt.setString(8, user.getComphone());
			
			
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int join_user(User user) {

		String SQL = "INSERT INTO REGISTER (NAME, COMPANY, GENDER, AGE, EMAIL, PASSWORD, PHONE, COMPHONE) VALUES (?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
		
			pstmt.setString(1, user.getName());
			pstmt.setString(2, "");
			pstmt.setString(3, user.getGender());
			pstmt.setString(4, user.getAge());
			pstmt.setString(5, user.getEmail());
			pstmt.setString(6, user.getPassword());
			pstmt.setString(7, user.getPhone());
			pstmt.setString(8,"");
			
			
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int login(String email, String password) {
		String SQL = "SELECT PASSWORD FROM REGISTER WHERE EMAIL = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(password)) {
					System.out.println("로그인 완료");
					return 1;
				} else {
					System.out.println("비밀번호 다름");
					return 0;
				}
					
			}
			return -1;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; 
	}
}
