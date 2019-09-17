package mirim.hs.kr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CountDAO {

	private Connection conn = DBConnection.getConnection();
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public Count getCount(String tbl) {
		String SQL = "SELECT * FROM COUNT WHERE TBL = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, tbl);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Count count = new Count();
				count.setTbl(rs.getString(1));
				count.setCnt(rs.getInt(2));
				return count;
			}
		}catch(Exception e ) {
			e.printStackTrace();
		}
		return null;
	}
	
}
