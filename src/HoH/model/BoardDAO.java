package HoH.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class BoardDAO {
	private static BoardDAO dao=new BoardDAO();	
	private DataSource dataSource;
	private BoardDAO(){
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static BoardDAO getInstance(){
		return dao;
	}
	public Connection getConnection() throws SQLException{
		return dataSource.getConnection();
	}
	public void closeAll(PreparedStatement pstmt,Connection con) throws SQLException{
		closeAll(null,pstmt,con);
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection con) throws SQLException{
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close();
	}
	
	public ArrayList<PostVO> getListByAge(String ageName) throws SQLException {
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		try {
			con = getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT  B.RNUM , B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,AGEDATE ");
			sql.append("FROM ( ");
			sql.append("SELECT ROW_NUMBER() OVER(ORDER BY POST_NO DESC) AS RNUM ,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE ");
			sql.append("FROM BOARD B, MEMBER M ");
			sql.append("WHERE B.ID=M.ID AND M.AGENAME=? ");
			sql.append(") B , MEMBER M ");
			sql.append("WHERE B.NICKNAME=M.NICKNAME");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, ageName);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				PostVO pvo=new PostVO();
				MemberVO mvo=new MemberVO();
				pvo.setPostNo(rs.getString(1));
				pvo.setTitle(rs.getString(2));
				mvo.setNickName(rs.getString(3));
				pvo.setMemberVO(mvo);
				pvo.setLikeCount(rs.getInt(4));
				pvo.setViewCount(rs.getInt(5));
				pvo.setRegDate(rs.getString(6));
				list.add(pvo);
			}
			
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}
	
}























