package mirim.hs.kr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReviewDAO {

	private Connection conn = DBConnection.getConnection();
	private PreparedStatement pstmt;
	private ResultSet rs;

	public int enterReview(String rtitle, String email, String rcontent, int ano, int star) { 
		String SQL = "INSERT INTO REVIEW (ANO, EMAIL, RTITLE, RCONTENT, STAR) VALUES (?,?,?,?,?)";
		try {	
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ano);
			pstmt.setString(2, email);
			pstmt.setString(3, rtitle);
			pstmt.setString(4, rcontent);
			pstmt.setInt(5, star);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public ArrayList<String> getReviewEmail(String email){
		String SQL = "SELECT A.TITLE, R.RTITLE, R.STAR FROM APPINFO A, REVIEW R WHERE A.ANO = R.ANO AND R.EMAIL = ?";
		ArrayList<String> list = new ArrayList<String>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getString(1) +"/"+ rs.getString(2) +"/"+ rs.getString(3));
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<Review> getReviewList(int ano) {
		String SQL = "SELECT * FROM REVIEW WHERE ANO = ?";
		ArrayList<Review> list = new ArrayList<Review>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ano);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Review review = new Review();
				review.setRno(rs.getInt(1));
				review.setAno(rs.getInt(2));
				review.setEmail(rs.getString(3));
				review.setRtitle(rs.getString(4));
				review.setRcontent(rs.getString(5));
				review.setStar(rs.getInt(6));
				list.add(review);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public Review getReview(int rno) {
		String SQL = "SELECT * FROM REVIEW WHERE RNO = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, rno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Review review = new Review();
				review.setAno(rs.getInt(1));
				review.setRno(rs.getInt(2));
				review.setEmail(rs.getString(3));
				review.setRtitle(rs.getString(4));
				review.setRcontent(rs.getString(5));
				review.setStar(rs.getInt(6));
				return review;
			}
		}catch(Exception e ) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int delete(int rno) {
		String SQL = "DELETE FROM REVIEW WHERE RNO = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);   
			pstmt.setInt(1, rno);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}
