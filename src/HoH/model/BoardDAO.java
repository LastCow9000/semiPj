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
	
	//핳게시물 받아오기
	   public ArrayList<PostVO> getListByLike() throws SQLException{
	      ArrayList<PostVO> list=new ArrayList<PostVO>();
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      try {
	         con=dataSource.getConnection();
	         String sql="SELECT b.title, m.nickName, m.ageName FROM board b, member m WHERE b.id=m.id ORDER BY like_count, view_count DESC";
	         pstmt=con.prepareStatement(sql);
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            PostVO pvo=new PostVO();
	            MemberVO mvo=new MemberVO();
	            pvo.setTitle(rs.getString(1));
	            mvo.setNickName(rs.getString(2));
	            mvo.setAgeName(rs.getString(3));
	            pvo.setMemberVO(mvo);
	            list.add(pvo);
	         }
	      }finally {
	         closeAll(rs, pstmt, con);
	      }
	      return list; 
	   }
	
	//시대별글 리스트불러오기
	public ArrayList<PostVO> getListByAge(String ageName) throws SQLException {
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		try {
			con = getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT B.TITLE,M.NICKNAME,B.LIKE_COUNT, ");
			sql.append("B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE, ");
			sql.append("m.ageName, b.post_no, b.id, b.content ");
			sql.append("FROM BOARD B, MEMBER M ");
			sql.append("WHERE B.ID=M.ID AND M.AGENAME=? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, ageName);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				PostVO pvo=new PostVO();
				MemberVO mvo=new MemberVO();
				mvo.setAgeName(rs.getString(6));
				mvo.setNickName(rs.getString(2));
				mvo.setId(rs.getString(8));
				pvo.setMemberVO(mvo);
				pvo.setPostNo(rs.getString(7));
				pvo.setTitle(rs.getString(1));
				pvo.setContent(rs.getString(9));
				pvo.setLikeCount(rs.getInt(3));
				pvo.setViewCount(rs.getInt(4));
				pvo.setRegDate(rs.getString(5));
				list.add(pvo);
			}
			
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
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
	
	
	
	
	
}//class























