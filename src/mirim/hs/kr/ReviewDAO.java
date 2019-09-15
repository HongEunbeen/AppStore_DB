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
}
