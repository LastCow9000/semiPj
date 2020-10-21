package HoH.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class FollowDAO {
	
   private static FollowDAO dao = new FollowDAO();
   private DataSource dataSource;

   private FollowDAO() {
      dataSource = DataSourceManager.getInstance().getDataSource();
   }

   public static FollowDAO getInstance() {
      return dao;
   }

   public Connection getConnection() throws SQLException {
      return dataSource.getConnection();
   }

   public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException {
      closeAll(null, pstmt, con);
   }

   public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) throws SQLException {
      if (rs != null)
         rs.close();
      if (pstmt != null)
         pstmt.close();
      if (con != null)
         con.close();
   }
   
   /**
    * 기능 : 시대 별 게시글 상세보기 기능 
    * postDetailByNo(String postNo) : PostVO
    * @throws SQLException
    */
   public void follwerAdd(String id,String nickname) throws SQLException {
	   Connection con=null;
	      PreparedStatement pstmt=null;
	      try {
	         con=dataSource.getConnection();
	         String sql="insert into follow(id,nickname) values(?,?)";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         pstmt.setString(2, nickname);
	         pstmt.executeUpdate();
	      }finally {
	         closeAll(pstmt, con);
	      }
   }

public boolean follwerCheck(String id,String nickname) throws SQLException {
	boolean flag = false;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String sql = "SELECT COUNT(*) FROM follow WHERE id=? and nickName=?";
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, nickname);
		rs =pstmt.executeQuery();

		if (rs.next() && rs.getInt(1) > 0) {
			flag = true;
		}
	}finally {
		closeAll(rs, pstmt, con);
	}
	
	return flag;
}

public ArrayList<String> follwingList(String id) throws SQLException {
	ArrayList<String> list = new ArrayList<String>();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String sql = "SELECT nickname FROM follow WHERE id=?";
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs =pstmt.executeQuery();

		while (rs.next()) {
			list.add(rs.getString(1));
		}
	}finally {
		closeAll(rs, pstmt, con);
	}
	
	return list;
}

public void followDelete(String nickname) throws SQLException {
	Connection con = null;
	PreparedStatement pstmt = null;
	try {
		String sql = "delete follow WHERE nickname=?";
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, nickname);
		pstmt.executeUpdate();
	}finally {
		closeAll(pstmt, con);
	}
}

public ArrayList<PostVO> getMyFollowPostList(String id) 
		throws SQLException {
	  ArrayList<PostVO> list = new ArrayList<PostVO>();  
	  PostVO postVO = null;
      MemberVO memberVO = null;
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         con = getConnection();
         StringBuilder sql = new StringBuilder();
         sql.append("select m.id, m.nickname, b.title,b.regDate,b.content, ");
		 sql.append("b.view_count, b.like_count, m.ageName,b.post_no ");
         sql.append("from member m, board b where m.id = b.id and m.nickname in ");
         sql.append("(select f.nickname from member m, follow f  ");
         sql.append("where m.id=f.id and m.id=?) ");
         sql.append("order by b.post_no desc ");
         pstmt = con.prepareStatement(sql.toString());
         pstmt.setString(1, id);
         rs = pstmt.executeQuery();
         while(rs.next()) {
            memberVO = new MemberVO();
            memberVO.setId(rs.getString("id"));
            memberVO.setNickName(rs.getString("nickname"));
            memberVO.setAgeName(rs.getString("ageName"));
            postVO = new PostVO();
            postVO.setTitle(rs.getString("title"));
            postVO.setRegDate(rs.getString("regDate"));
            postVO.setContent(rs.getString("content"));
            postVO.setViewCount(rs.getInt("view_count"));
            postVO.setLikeCount(rs.getInt("like_count"));
            postVO.setPostNo(rs.getString("post_no"));
            postVO.setMemberVO(memberVO);
            list.add(postVO);
         }
   
      } finally {
         closeAll(rs, pstmt, con);
      }
      
      return list;
   }//getMyScrapPostList 
	/*
	 * //페이징용 팔로잉 게시글 총 갯수 public int getTotalFollowCount(String id) throws
	 * SQLException { int totalCount = 0; Connection con = null; PreparedStatement
	 * pstmt = null; ResultSet rs = null; try { con = getConnection(); StringBuilder
	 * sql = new StringBuilder(); sql.
	 * append("SELECT COUNT(*) from member m, board b where m.id = b.id and m.nickname in "
	 * ); sql.append("(select f.nickname from member m, follow f ");
	 * sql.append("where m.id=f.id and m.id=?) ");
	 * sql.append("order by b.post_no desc ");
	 * 
	 * pstmt = con.prepareStatement(sql.toString()); pstmt.setString(1, id); rs =
	 * pstmt.executeQuery(); if (rs.next()) { totalCount = rs.getInt(1); } } finally
	 * { closeAll(rs, pstmt, con); } return totalCount; }
	 */

}


