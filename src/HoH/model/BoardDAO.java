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
	// -> postNo도 넘어오게 query문 수정
      public ArrayList<PostVO> getListByLike() throws SQLException{
         ArrayList<PostVO> list=new ArrayList<PostVO>();
         Connection con=null;
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         try {
            con=dataSource.getConnection();
            String sql="SELECT b.title, m.nickName, m.ageName, b.post_no "
            		+ "FROM board b, member m "
            		+ "WHERE b.id=m.id ORDER BY like_count DESC, view_count DESC";
            pstmt=con.prepareStatement(sql);
            rs=pstmt.executeQuery();
            while(rs.next()) {
               PostVO pvo=new PostVO();
               pvo.setPostNo(rs.getString(4));
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
         // select m.id, m.nickname, b.title,b.regdate,b.content,b.view_count,
         // b.like_count
         // from member m, board b where m.id = b.id and b.post_no='2';
         sql.append("SELECT m.id, m.nickname, b.title, b.regDate,b.content, ");
		 sql.append("b.view_count, b.like_count, m.ageName ");
         sql.append("FROM member m, board b ");
         sql.append("WHERE m.id = b.id AND b.post_no=? ");
         pstmt = con.prepareStatement(sql.toString());
         pstmt.setString(1, postNo);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            MemberVO memberVO = new MemberVO();
            memberVO.setId(rs.getString("id"));
            memberVO.setNickName(rs.getString("nickname"));
            memberVO.setAgeName(rs.getString("ageName"));
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

   //작성자,제목별 전체 검색 세희
   public ArrayList<PostVO> getListByOption(String option, String word,PagingBean pb) throws SQLException {
	ArrayList<PostVO> list=new ArrayList<PostVO>();
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try {
		con=getConnection();
		StringBuilder sql=new StringBuilder();
		   sql.append("SELECT  B.RNUM ,B.POST_NO, B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,AGEDATE ");
	       sql.append("FROM (SELECT ROW_NUMBER() OVER(ORDER BY POST_NO DESC) AS RNUM , ");
	       sql.append("B.POST_NO,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE ");
	       sql.append("FROM BOARD B, MEMBER M ");
	       sql.append("WHERE B.ID=M.ID and ");
	       sql.append(option);
	       sql.append(" like '%' || ? || '%' ");
	       sql.append(")B , MEMBER M ");
	       sql.append("WHERE B.NICKNAME=M.NICKNAME AND RNUM BETWEEN ?  AND ? ");
	       pstmt = con.prepareStatement(sql.toString());
	       pstmt.setString(1, word);
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
   
//totalpostcount 가져오는 dao 세희
public int getListCountByWriter(String option, String word) throws SQLException {
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int totalpostcount=0;
	try {
		con=getConnection();
		StringBuilder sql=new StringBuilder();
		sql.append("SELECT  count(*) ");
        sql.append("FROM ( ");
        sql.append("SELECT ROW_NUMBER() OVER(ORDER BY POST_NO desc) AS RNUM ,b.post_no,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE ");
        sql.append("FROM BOARD B, MEMBER M ");
        sql.append("WHERE B.ID=M.ID ");
        sql.append(") B , MEMBER M ");
        sql.append("WHERE B.NICKNAME=M.NICKNAME and ");
        sql.append(option);
        //sql.append("m.nickname ");
        sql.append(" like '%' || ? || '%'");
        pstmt = con.prepareStatement(sql.toString());
         pstmt.setString(1, word);
	     rs=pstmt.executeQuery();
	     if(rs.next()) {
	    	 totalpostcount=rs.getInt(1);
	     }
	}finally {
		closeAll(rs, pstmt, con);
	}
	return totalpostcount;
}


   
   // 좋아요 체크 메서드
   public int likeCheck(String loginId, String postNo) throws SQLException {
	   	  int resultCount=-1;
	      Connection con=null;
	      PreparedStatement pstmt = null;
	      ResultSet rs=null;
	      try {
	         con = getConnection();
	         String sql="select count(*) from like_post where id=? and post_no=?";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, loginId);
	         pstmt.setString(2, postNo);
	         rs= pstmt.executeQuery();
	         if(rs.next()) {
	        	 resultCount = rs.getInt(1);
	         }
	      } finally {
	    	  closeAll(rs, pstmt, con);
	      }
	   return resultCount;
   }
   // 좋아요 테이블에 저장하기
   public void likePlus(String loginId, String postNo) throws SQLException {
	   	  Connection con=null;
	      PreparedStatement pstmt = null;
	      try {
	         con = getConnection();
	         String sql="INSERT INTO like_post VALUES(?, ?)";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, postNo);
	         pstmt.setString(2, loginId);
	         pstmt.executeUpdate();
	      } finally {
			closeAll(pstmt, con);
		}
   }
   // board 테이블에 좋아요+1 메서드 
   public void boardLikePlusUpdate(String postNo) throws SQLException {
	   	  Connection con=null;
	      PreparedStatement pstmt = null;
	      try {
	         con = getConnection();
	         String sql="update board set like_count = like_count+1  where post_no=?";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, postNo);
	         pstmt.executeUpdate();
	      } finally {
			closeAll(pstmt, con);
		}
}
   // 좋아요를 누를경우 게시물 작성자에게 포인트 전달 메서드
   public void memberUpdatePlusPoint(String postId) throws SQLException {
	   	  Connection con=null;
	      PreparedStatement pstmt = null;
	      try {
	         con = getConnection();
	         String sql="update member set point = point+10  where id=?";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, postId);
	         pstmt.executeUpdate();
	      } finally {
			closeAll(pstmt, con);
		}
}
// 좋아요 테이블에서 삭제하기
   public void likeMinus(String loginId, String postNo) throws SQLException {
	   	  Connection con=null;
	      PreparedStatement pstmt = null;
	      try {
	         con = getConnection();
	         String sql="delete from LIKE_POST  where id=? and post_no=?";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, loginId);
	         pstmt.setString(2, postNo);
	         pstmt.executeUpdate();
	      } finally {
			closeAll(pstmt, con);
		}
   }
   // board 테이블에 좋아요-1 메서드 
   public void boardLikeMinusUpdate(String postNo) throws SQLException {
	   	  Connection con=null;
	      PreparedStatement pstmt = null;
	      try {
	         con = getConnection();
	         String sql="update board set like_count = like_count-1  where post_no=?";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, postNo);
	         pstmt.executeUpdate();
	      } finally {
			closeAll(pstmt, con);
		}
}
   // 좋아요를 취소할 경우 게시물 작성자에게 포인트 빼는메서드
   public void memberUpdateMinusPoint(String postId) throws SQLException {
	   	  Connection con=null;
	      PreparedStatement pstmt = null;
	      try {
	         con = getConnection();
	         String sql="update member set point = point-10  where id=?";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, postId);
	         pstmt.executeUpdate();
	      } finally {
			closeAll(pstmt, con);
		}
}
   // 시대별 검색 총게시물
   public int totalAgePostCount(String ageName, String option, String word) throws SQLException {
	   Connection con=null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   int totalAgePostCount = -1;
	   try {
		   con = getConnection();
	         StringBuilder sql = new StringBuilder();
	         sql.append("SELECT  count(*) ");
	         sql.append("FROM ( ");
	         sql.append(
	               "SELECT ROW_NUMBER() OVER(ORDER BY POST_NO desc) AS RNUM ,b.post_no,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE ");
	         sql.append("FROM BOARD B, MEMBER M ");
	         sql.append("WHERE B.ID=M.ID AND M.AGENAME=? ");
	         sql.append(") B , MEMBER M ");
	         sql.append("WHERE B.NICKNAME=M.NICKNAME and ");
	         sql.append(option);
	         //sql.append("m.nickname ");
	         sql.append(" like '%' || ? || '%'");
	         pstmt = con.prepareStatement(sql.toString()); 
	         pstmt.setString(1, ageName);
	         pstmt.setString(2, word);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	        	 totalAgePostCount = rs.getInt(1);
	         }
	   } finally {
		closeAll(rs, pstmt, con);
	}
	   return totalAgePostCount;
   }
// 
public ArrayList<PostVO> getSearchListByAge(String ageName, PagingBean pagingBean, String option, String word) throws SQLException {
	 ArrayList<PostVO> list = new ArrayList<PostVO>();
     Connection con = null;
     PreparedStatement pstmt = null;
     ResultSet rs = null;
     try {
        con = getConnection();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT  B.RNUM ,B.POST_NO, B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,AGEDATE ");
        sql.append("FROM ( ");
        sql.append("SELECT ROW_NUMBER() OVER(ORDER BY POST_NO desc) AS RNUM ,b.post_no,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE ");
        sql.append("FROM BOARD B, MEMBER M ");
        sql.append("WHERE B.ID=M.ID AND M.AGENAME=? and ");
        sql.append(option);
        sql.append(" like '%' || ? || '%' ");
        sql.append(") B , MEMBER M ");
        sql.append("WHERE B.NICKNAME=M.NICKNAME and rnum between ? and ? ");
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, ageName);
        pstmt.setString(2, word);
        pstmt.setInt(3, pagingBean.getStartRowNumber());
        pstmt.setInt(4, pagingBean.getEndRowNumber());
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
}// class