package HoH.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;


public class MemberDAO {
	private static MemberDAO dao=new MemberDAO();
	private DataSource dataSource;
	private MemberDAO(){
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static MemberDAO getInstance(){		
		return dao;
	}	
	public void closeAll(PreparedStatement pstmt,Connection con) throws SQLException{
		closeAll(null,pstmt,con);
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt,
			Connection con) throws SQLException{
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close();
	}
	
	//로그인 
	   public MemberVO login(String id,String password) throws SQLException{
	      MemberVO memberVO = null;
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      try{
	         String sql = "SELECT id, password, ageName, nickName, point, rank "
	               + "FROM member "
	               + "WHERE id=? AND password=?";
	         con = dataSource.getConnection();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         pstmt.setString(2, password);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            memberVO = new MemberVO();
	            memberVO.setId(rs.getString(1));
	            memberVO.setPassword(rs.getString(2));
	            memberVO.setAgeName(rs.getString(3));
	            memberVO.setNickName(rs.getString(4));
	            memberVO.setPoint(rs.getInt(5));
	            memberVO.setRank(rs.getString(6));
	         }
	      }finally{
	         closeAll(rs, pstmt,con);
	      }
	      return memberVO;
	   }
	
	//회원가입
	   public void registerMember(MemberVO memberVO) throws SQLException {
	      Connection con=null;
	      ResultSet rs = null;
	      PreparedStatement pstmt = null;
	      try {
	         StringBuilder sql = new StringBuilder();
	         sql.append("insert into member(id,password,nickname,agename) ");
	         sql.append("values(?,?,?,?) ");
	         con = dataSource.getConnection();
	         pstmt = con.prepareStatement(sql.toString());
	         pstmt.setString(1, memberVO.getId());
	         pstmt.setString(2, memberVO.getPassword());
	         pstmt.setString(3, memberVO.getNickName());
	         pstmt.setString(4, memberVO.getAgeName());
	         pstmt.executeUpdate();
	      }finally {
	         closeAll(rs, pstmt, con);
	      }
	   }
	   
	//회원정보수정
	public void update(MemberVO memberVO) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE member "
					+ "SET nickName=?, password=? "
					+ "WHERE id=? ";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberVO.getNickName());
			pstmt.setString(2, memberVO.getPassword());
			pstmt.setString(3, memberVO.getId());
			pstmt.executeUpdate();
			
		} finally {
			closeAll(pstmt, con);
		}
	}
	
	//아이디 중복 확인
	// 아이디가 중복이면 : true / 중복아니면 : false
	public boolean checkId(String id) throws SQLException {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(*) FROM member WHERE id=?";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs =pstmt.executeQuery();

			if (rs.next() && rs.getInt(1) > 0) {
				flag = true;
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		
		return flag;
	}
	
	//닉네임 중복 확인
	// 닉네임이 중복이면 : true / 중복아니면 : false
	public boolean checkNick(String nickname) throws SQLException {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(*) FROM member WHERE nickName=?";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rs =pstmt.executeQuery();

			if (rs.next() && rs.getInt(1) > 0) {
				flag = true;
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		
		return flag;
	}
	public MemberVO findPasswordById(String id,String nickname) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		MemberVO vo=null;
		try {
			String sql  = "SELECT password,nickname from member where id=? and nickname=?";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, nickname);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo=new MemberVO();
				vo.setPassword(rs.getString(1));
				vo.setNickName(nickname);			
				}
			
		} finally {
			closeAll(rs, pstmt, con);
		}
		
		return vo;
	}
	
	//역대 핳게시글
	public ArrayList<MemberVO> ranking() throws SQLException{
	      ArrayList<MemberVO> list = new ArrayList<MemberVO>();
	     
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      try{
	    	  StringBuilder sql = new StringBuilder();
	          sql.append("select id,nickname,point ");
	          sql.append("from member ");
	          sql.append("order by point desc ");
	          //sql.append(" ");
	         con = dataSource.getConnection();
	         pstmt = con.prepareStatement(sql.toString());
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	        	 MemberVO memberVO = new MemberVO();
	            memberVO.setId(rs.getString(1));
	            memberVO.setNickName(rs.getString(2));
	            memberVO.setPoint(rs.getInt(3));
	            list.add(memberVO);
	         }
	      }finally{
	         closeAll(rs, pstmt,con);
	      }
	      return list;
	   }

	
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
	
 	// return : true - 잘 작동 / return :false - 잘 작동 X
	public boolean DeleteMember(String sessionid, String password) throws SQLException {
 		boolean flag = false;
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			String sql="delete FROM MEMBER WHERE ID=? AND PASSWORD=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sessionid);
			pstmt.setString(2, password);
			int affectedRow = pstmt.executeUpdate();
 			//영향을 준 row가 있다면 affectedRow은 양수
 			if (affectedRow > 0) 
 				flag = true;
		} finally {
			closeAll(pstmt, con);
		}
		
		return flag;
	}
	
	//등급조회
	public String getRank(String id) throws SQLException {
		String rank=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT rank FROM member WHERE id=?";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs =pstmt.executeQuery();
			if (rs.next()) {
				rank=rs.getString(1);
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return rank;
	}
	
	//등급업
	public void rankUp(String rank ,String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "UPDATE member SET rank=? WHERE id=?";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rank);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}
	
	//포인트 올리는 메서드
	public void UpdatePlusPoint(String postId, int point) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "update member set point = point+?  where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setString(2, postId);
			pstmt.executeUpdate();

		} finally {
			closeAll(pstmt, con);
		}
	}
	
	//포인트 내리는 메서드
	public void UpdateMinusPoint(String postId, int point) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "update member set point = point-?  where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setString(2, postId);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}
	
	//nickname으로 id를 받아오는 메서드
	public String findIdbyNickName(String nickName) throws SQLException {
		String id=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			String sql="SELECT id FROM member WHERE nickname=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs=pstmt.executeQuery();
			if(rs.next())
				id=rs.getString(1);
		}finally {
			closeAll(rs, pstmt, con);
		}
		return id;
	}
	
}//class















