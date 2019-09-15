package mirim.hs.kr;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mirim.hs.kr.App;
import mirim.hs.kr.DBConnection;

public class AppDAO {

	private Connection conn = DBConnection.getConnection();
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ArrayList<App> getAllList(int pageNumber ,String listSort) {
		String SQL = "SELECT ROWNUM, R.* FROM (SELECT * FROM APPINFO ORDER BY ANO) R WHERE ROWNUM <= ? ORDER BY " + listSort;
		ArrayList<App> list = new ArrayList<App>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, pageNumber * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				App app = new App();
				app.setNo(rs.getInt(2));
				app.setTitle(rs.getString(3));
				app.setEmail(rs.getString(4));
				app.setCdate(rs.getString(5));
				app.setCategory(rs.getString(6));
				app.setContent(rs.getString(7));
				app.setCompany(rs.getString(8));
				app.setIcon(rs.getString(9));
				app.setDevice(rs.getString(10));
				list.add(app);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage (int pageNumber ,String listSort) {
		String SQL = "SELECT COUNT(*) FROM (SELECT * FROM APPINFO ORDER BY ANO) R WHERE ROWNUM <= ? ORDER BY " + listSort;
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, pageNumber * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getInt(1) >= (pageNumber * 10)) {
					return true;
				}else return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; 		
	}
	public int clickDown(int ano, String email) {
		String SQL = "INSERT INTO APPDOWN(ANO, ACNT, EMAIL) VALUES (?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ano);
			pstmt.setInt(2, ano);
			pstmt.setString(3, email);
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public App getApp(int ano) {
		String SQL = "SELECT ANO, TITLE, EMAIL, TO_CHAR(CDATE, 'RR/MM/DD'), CATEGORY, CONTENT, COMPANY, ICON, DEVICE FROM APPINFO WHERE ANO = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ano);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				App app = new App();
				app.setNo(rs.getInt(1));
				app.setTitle(rs.getString(2));
				app.setEmail(rs.getString(3));
				app.setCdate(rs.getString(4));
				app.setCategory(rs.getString(5));
				app.setContent(rs.getString(6));
				app.setCompany(rs.getString(7));
				app.setIcon(rs.getString(8));
				app.setDevice(rs.getString(9));
				
				return app;
			}
		}catch(Exception e ) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int enterApp(String title, String email, String category, String content, String device, String icon) { 
		String SQL = "INSERT INTO APPINFO (TITLE, EMAIL, CDATE, CATEGORY, CONTENT, COMPANY, DEVICE, ICON) VALUES"
				+ "(?,?,?,?,?,?,?,?) ";
		
		try {	
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, email);
			pstmt.setString(3, getDate());
			pstmt.setString(4, category);
			pstmt.setString(5, content);
			pstmt.setString(6, getCompany(email));
			pstmt.setString(7, device);
			pstmt.setString(8, icon);
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public String getDate() {
		String SQL = "SELECT TO_CHAR(SYSDATE,'RR/MM/DD') FROM DUAL";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	public String getCompany(String email) {
		String SQL = "SELECT COMPANY FROM REGISTER WHERE EMAIL = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}


}
