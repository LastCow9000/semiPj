package HoH.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class ScrapDAO {

	private static ScrapDAO dao = new ScrapDAO();
	private DataSource dataSource;

	private ScrapDAO() {
		dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static ScrapDAO getInstance() {
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
	 * 기능 : 시대 별 게시글 상세보기 기능 postDetailByNo(String postNo) : PostVO
	 * 
	 * @throws SQLException
	 */
	public PostVO ScrapPostDetailByNo(String postNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PostVO postVO = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT m.id, m.nickname, b.title,b.regDate,b.content, b.");
			sql.append("b.view_count, b.like_count, m.ageName, s.scraped_regdate ");
			sql.append("FROM member m, board b, scrap_post s ");
			sql.append("WHERE m.id = b.id AND s.post_no = b.post_no AND b.post_no=? ");
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
				postVO.setScrapedDate(rs.getString("scraped_regdate"));
				postVO.setMemberVO(memberVO);
			}

		} finally {
			closeAll(rs, pstmt, con);
		}

		return postVO;

	}// postDetailByNo method

	// 스크랩 게시물 중복확인 : isCheckScrapPost
	// 스크랩 게시물이 중복이면 : true / 중복아니면 : false
	public boolean isCheckScrapPost(String id, String postNo) throws SQLException {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			String sql = "SELECT COUNT(*) FROM scrap_post " + "WHERE  id=? AND post_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, postNo);
			rs = pstmt.executeQuery();
			if (rs.next() && rs.getInt(1) > 0) {
				flag = true;
			}
		} finally {
			closeAll(rs, pstmt, con);
		}

		return flag;
	}// isCheckScrapPost method

	// 게시물 스크랩 진행 : scrapPost
	// return : true - 잘 작동 / return :false - 잘 작동 X
	public boolean scrapPost(String postNo, String id) throws SQLException {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			String sql = "INSERT INTO scrap_post VALUES(?, ?, sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, postNo);
			pstmt.setString(2, id);
			int affectedRow = pstmt.executeUpdate();
			// 영향을 준 row가 있다면 affectedRow은 양수
			if (affectedRow > 0) {
				flag = true;
			}
		} finally {
			closeAll(pstmt, con);
		}

		return flag;

	}// scrapPost method

	/**
	 * 마이 스크랩 리스트에 들어갈 postNo 뽑아오기 getMyScrapPostList(id) : ArrayList<String>
	 */
	public ArrayList<String> getMyScrapPostList(String id) throws SQLException {
		ArrayList<String> postNoList = new ArrayList<String>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "SELECT post_no, scraped_regdate " + "FROM scrap_post WHERE id=? "
					+ "ORDER BY scraped_regdate desc";
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				postNoList.add(rs.getString(1));
			}

		} finally {
			closeAll(rs, pstmt, con);
		}

		return postNoList;

	}// getMyScrapPostList

	/**
	 * 마이 스크랩 리스트에 있는 postNo 삭제하기 getMyScrapPostList(postNo, id) : boolean
	 */
	public boolean deleteScrapPostByPostNo(String postNo, String id) throws SQLException {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = getConnection();
			String sql = "DELETE FROM scrap_post WHERE post_no=? AND id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, postNo);
			pstmt.setString(2, id);
			int affectedRow = pstmt.executeUpdate();

			// 영향을 준 row가 있다면 affectedRow은 양수
			if (affectedRow > 0) {
				flag = true;
			}

		} finally {
			closeAll(pstmt, con);
		}

		return flag;
	}// deleteScrapPostByPostNo

	public int getTotalScrapCount(String id) throws SQLException {
		int totalCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT count(*) FROM scrap_post WHERE id=?");
			sql.append("ORDER BY scraped_regdate desc ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return totalCount;
	}

	public ArrayList<PostVO> getMyScrapPostingList(String id, PagingBean pagingBean) throws SQLException {
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		PostVO postVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(
					"select b.rnum, b.post_no, b.scraped_regdate,b.agename, b.title,b.LIKE_COUNT,b.VIEW_COUNT,b.nickname,b.id,b.content, b.rep_count ");
			sql.append("from ( select ROW_NUMBER() OVER(ORDER BY sp.scraped_regdate desc) AS RNUM, m.id, ");
			sql.append("b.post_no, sp.scraped_regdate,m.agename, b.title,b.LIKE_COUNT,b.VIEW_COUNT,m.nickname,b.content, b.rep_count ");
			sql.append("from  scrap_post sp, member m, board b WHERE m.id=? and m.id=sp.id and sp.post_no = b.post_no) b ");
			sql.append("where b.rnum between ? and ? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2, pagingBean.getStartRowNumber());
			pstmt.setInt(3, pagingBean.getEndRowNumber());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO memberVO = new MemberVO();
				memberVO.setId(rs.getString("id"));//9
				memberVO.setNickName(rs.getString("nickname"));//8
				memberVO.setAgeName(rs.getString("agename"));//4
				
				postVO = new PostVO();
				postVO.setTitle(rs.getString("title"));//5
				postVO.setContent(rs.getString("content"));//10
				postVO.setViewCount(rs.getInt("view_count"));//7
				postVO.setLikeCount(rs.getInt("like_count"));//6
				postVO.setScrapedDate(rs.getString("scraped_regdate"));//3
				postVO.setRnum(rs.getString("rnum"));//1
				postVO.setPostNo(rs.getString("post_no"));//2
				postVO.setReplyCount(rs.getInt("rep_count"));
				postVO.setMemberVO(memberVO);
				list.add(postVO);
			}

		} finally {
			closeAll(rs, pstmt, con);
		}

		return list;
	}// getMyScrapPostList
}
