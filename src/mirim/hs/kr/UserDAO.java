package mirim.hs.kr;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import mirim.hs.kr.DBConnection;

public class UserDAO {
	private Connection conn = DBConnection.getConnection();
	private PreparedStatement pstmt;
	private ResultSet rs;
	 
	//회원가입
	public int join(User user) {
		String SQL = "INSERT INTO REGISTER(NAME, COMPANY, GENDER, EMAIL, PASSWORD, PHONE, COMPHONE, AGE) VALUES (?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getCompany());
			pstmt.setString(3, user.getGender());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getPassword());
			pstmt.setString(6, user.getPhone());
			pstmt.setString(7, user.getComphone());
			pstmt.setString(8, user.getAge());
			
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
	
	//로그인
	public int login(String email, String password) {
		String SQL = "SELECT PASSWORD FROM REGISTER WHERE EMAIL = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(password)) {
					return 1; // 로그인 성공
				} else {
					return 0; // 비밀번호 불일치
				}
					
			}
			return -1; // 아이디 없음

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류를 의미
	}
}
