package HoH.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
			String sql = "SELECT id, password, ageName, nickName "
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
			String sql = "";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.executeUpdate();
		}finally {
			closeAll(rs, pstmt, con);
		}
	}
	//회원정보수정
	public void update(MemberVO memberVO) throws SQLException {
		Connection con=null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.executeUpdate();
		}finally {
			closeAll(rs, pstmt, con);
		}
	}
}















