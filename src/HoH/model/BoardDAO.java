package HoH.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class BoardDAO {
   private static BoardDAO dao = new BoardDAO();
   private DataSource dataSource;

   private BoardDAO() {
      dataSource = DataSourceManager.getInstance().getDataSource();
   }

   public static BoardDAO getInstance() {
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
   //핳게시물 받아오기
      public ArrayList<PostVO> getListByLike() throws SQLException{
         ArrayList<PostVO> list=new ArrayList<PostVO>();
         Connection con=null;
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         try {
            con=dataSource.getConnection();
            String sql="SELECT b.title, m.nickName, m.ageName FROM board b, member m WHERE b.id=m.id ORDER BY like_count DESC, view_count DESC";
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
   public ArrayList<PostVO> getListByAge(String ageName,PagingBean pb) throws SQLException {
      ArrayList<PostVO> list = new ArrayList<PostVO>();
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         con = getConnection();
         StringBuilder sql = new StringBuilder();
         sql.append("SELECT  B.RNUM ,B.POST_NO, B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,AGEDATE ");
         sql.append("FROM ( ");
         sql.append(
               "SELECT ROW_NUMBER() OVER(ORDER BY POST_NO desc) AS RNUM ,b.post_no,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE ");
         sql.append("FROM BOARD B, MEMBER M ");
         sql.append("WHERE B.ID=M.ID AND M.AGENAME=? ");
         sql.append(") B , MEMBER M ");
         sql.append("WHERE B.NICKNAME=M.NICKNAME and rnum between ? and ? ");
         pstmt = con.prepareStatement(sql.toString());
         pstmt.setString(1, ageName);
         pstmt.setInt(2, pb.getStartRowNumber());
         pstmt.setInt(3, pb.getEndRowNumber());
         rs=pstmt.executeQuery();
         while(rs.next()) {
            PostVO pvo=new PostVO();
            MemberVO mvo=new MemberVO();
            pvo.setRnum(rs.getString(1));
            pvo.setPostNo(rs.getString(2));
            pvo.setTitle(rs.getString(3));
            mvo.setNickName(rs.getString(4));
            pvo.setMemberVO(mvo);
            pvo.setLikeCount(rs.getInt(5));
            pvo.setViewCount(rs.getInt(6));
            pvo.setRegDate(rs.getString(7));
            list.add(pvo);
         }

      } finally {
         closeAll(rs, pstmt, con);
      }
      return list;
   }

   /**
    * 기능 : 시대 별 게시글 상세보기 기능 postDetailByNo(String postNo) : PostVO
    * 
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
         // select m.id, m.nickname, b.title,b.regdate,b.content,b.view_count,
         // b.like_count
         // from member m, board b where m.id = b.id and b.post_no='2';
         sql.append("select m.id, m.nickname, b.title,b.regDate,b.content,b.view_count, b.like_count ");
         sql.append("from member m, board b where m.id = b.id and b.post_no=? ");
         pstmt = con.prepareStatement(sql.toString());
         pstmt.setString(1, postNo);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            MemberVO memberVO = new MemberVO();
            memberVO.setId(rs.getString("id"));
            memberVO.setNickName(rs.getString("nickname"));
            postVO = new PostVO();
            postVO.setPostNo(postNo);
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

   }// postDetailByNo method

   //게시물 쓰기
   public int writePost(PostVO vo) throws SQLException {
      int latestPostNo = 0;
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         con = dataSource.getConnection();
         String sql = "INSERT INTO board(post_no, id, title, content, regdate) VALUES (board_seq.nextval, ?, ?, ?, sysdate)";
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, vo.getMemberVO().getId());
         pstmt.setString(2, vo.getTitle());
         pstmt.setString(3, vo.getContent());
         pstmt.executeUpdate();
         pstmt.close();

         sql = "SELECT board_seq.currval FROM dual";
         pstmt = con.prepareStatement(sql);
         rs = pstmt.executeQuery();
         if (rs.next())
            latestPostNo = rs.getInt(1);
      } finally {
         closeAll(rs, pstmt, con);
      }

      return latestPostNo;
   }
   
   //페이징용 시대별 게시글 총 갯수      
   public int getTotalPostCount(String ageName) throws SQLException {
      int totalCount=0;
      Connection con=null;
      PreparedStatement pstmt = null;
      ResultSet rs=null;
      try {
         con = getConnection();
         String sql="SELECT COUNT(*)FROM BOARD B,MEMBER M WHERE M.ID=B.ID AND M.AGENAME=?";
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1,ageName);
         rs= pstmt.executeQuery();
         if(rs.next()) {
            totalCount = rs.getInt(1);
         }
      }finally {
         closeAll(rs, pstmt, con);
      }
      return totalCount;
   }
   
   //조회수 증가
   public void updateview_count(String postNo) throws SQLException {
      Connection con = null;
      PreparedStatement pstmt=null;
      try {
         con=getConnection();
         String sql="update board set view_count=view_count+1 where post_no=? ";
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, postNo);
         pstmt.executeUpdate();
         } finally {
         closeAll(pstmt, con);
      }
      
   }
   
   //게시물 삭제
   public void deletePost(String postNo) throws SQLException {
      Connection con=null;
      PreparedStatement pstmt=null;
      try {
         con=dataSource.getConnection();
         String sql="DELETE FROM board WHERE post_No=?";
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, postNo);
         pstmt.executeUpdate();
      }finally {
         closeAll(pstmt, con);
      }
   }
   //게시물 수정
   public void updatePost(PostVO postVO) throws SQLException {
      Connection con=null;
      PreparedStatement pstmt=null;
      try {
         con=dataSource.getConnection();
         String sql="UPDATE board set title=?, content=? WHERE post_No=?";
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, postVO.getTitle());
         pstmt.setString(2, postVO.getContent());
         pstmt.setString(3, postVO.getPostNo());
         pstmt.executeUpdate();
      }finally {
         closeAll(pstmt, con);
      }
   }
}// class