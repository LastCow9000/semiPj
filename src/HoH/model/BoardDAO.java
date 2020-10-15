package HoH.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	
	/**
	 * 기능 : 시대 별 게시글 상세보기 기능
	 * postDetailByNo(String postNo) : PostVO
	 * @throws SQLException 
	 */
	public PostVO postDetailByNo(String postNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PostVO postVO = null;
		
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			// 제목, 
			//select m.id, m.nickname, b.title,b.regdate,b.content,b.view_count, b.like_count 
			//from member m, board b where m.id = b.id and b.post_no='2';
			sql.append("select m.id, m.nickname, b.title,b.regDate,b.content,b.view_count, b.like_count ");
			sql.append("from member m, board b where m.id = b.id and b.post_no=? ");
			pstmt= con.prepareStatement(sql.toString());
			pstmt.setString(1, postNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				MemberVO memberVO = new MemberVO();
				memberVO.setId(rs.getString("id"));
				memberVO.setNickName(rs.getString("nickname"));
				postVO = new PostVO();
				postVO.setTitle(rs.getString("title"));
				postVO.setContent(rs.getString("content"));
				postVO.setRegDate(rs.getString("regDate"));
				postVO.setViewCount(rs.getInt("view_count"));
				postVO.setLikeCount(rs.getInt("like_count"));
				postVO.setMemberVO(memberVO);
			}
			
		} finally {
			closeAll(rs, pstmt, con);
		}
		
		return postVO;
		
	}//postDetailByNo method
	
}























