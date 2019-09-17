package mirim.hs.kr;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
	public int update_user(User user) {
		String SQL = "UPDATE REGISTER SET NAME = ?, COMPANY = ?, GENDER = ?, AGE = ?, PASSWORD = ?, PHONE = ?, COMPHONE =? WHERE EMAIL = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
		
			pstmt.setString(1, user.getName());
			pstmt.setString(2, "");
			pstmt.setString(3, user.getGender());
			pstmt.setString(4, user.getAge());
			pstmt.setString(5, user.getPassword());
			pstmt.setString(6, user.getPhone());
			pstmt.setString(7,"");
			pstmt.setString(8, user.getEmail());
			
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int updateCom(String com, String phone) {
		String SQL = "UPDATE VIEW_COMPHONE SET COMPHONE = ? WHERE COMPANY = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, com);
			pstmt.setString(2, phone);
	
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
	public int delete(String email) {
		String SQL = "DELETE FROM REGISTER WHERE EMAIL = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, email);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	public boolean checkCom(String email) {
		String SQL = "SELECT COMPANY FROM REGISTER WHERE EMAIL = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}else return false;
		}catch(Exception e ) {
			e.printStackTrace();
		}
		return false;
	}
	public User getUser(String email) {
		String SQL = "SELECT * FROM REGISTER WHERE EMAIL = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				User user = new User();
				user.setName(rs.getString(1));
				user.setCompany(rs.getString(2));
				user.setGender(rs.getString(3));
				user.setAge(String.valueOf(rs.getInt(4)));
				user.setEmail(rs.getString(5));
				user.setPassword(rs.getString(6));
				user.setPhone(String.valueOf(rs.getInt(7)));
				user.setComphone(String.valueOf(rs.getInt(8)));
				return user;
			}
		}catch(Exception e ) {
			e.printStackTrace();
		}
		return null;
	}
	public User getUser_Com(String email) {
		String SQL = "SELECT * FROM REGISTER WHERE EMAIL = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				User user = new User();
				user.setName(rs.getString(1));
				user.setGender(rs.getString(2));
				user.setAge(String.valueOf(rs.getInt(3)));
				user.setEmail(rs.getString(4));
				user.setPassword(rs.getString(5));
				user.setPhone(String.valueOf(rs.getInt(6)));
				return user;
			}
		}catch(Exception e ) {
			e.printStackTrace();
		}
		return null;
	}
	public ArrayList<User> getComPeople(String com) {
		String SQL = "SELECT NAME, EMAIL, PHONE FROM REGISTER WHERE COMPANY = ?";
		ArrayList<User> userList = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, com);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setName(rs.getString(1));
				user.setEmail(rs.getString(2));
				user.setPhone(String.valueOf(rs.getInt(3)));
				userList.add(user);
			}
		}catch(Exception e ) {
			e.printStackTrace();
		}
		return userList;
	}
	public ArrayList<String>  getComApp(String com) {
		String SQL = "SELECT TITLE FROM APPINFO WHERE EMAIL IN (SELECT EMAIL FROM REGISTER WHERE COMPANY = ?)";
		ArrayList<String> comAppList = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, com);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				comAppList.add(rs.getString(1));
			}
		}catch(Exception e ) {
			e.printStackTrace();
		}
		return comAppList;
	}
}
