package mirim.hs.kr;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import mirim.hs.kr.App;
import mirim.hs.kr.DBConnection;

public class AppDAO {
	private Connection conn = DBConnection.getConnection();
	private PreparedStatement pstmt;
	private ResultSet rs;
	public App setAllList() {
		String SQL = "SELECT * FROM APPINFO";
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return new App(rs.getInt(0), rs.getString(1), rs.getString(2),
						rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
