package HoH.model;

public class PostVO {
	private String postNo;
	private String rnum;
	private String title;
	private String content;
	private int viewCount;
	private int likeCount;
	private String regDate;
	private String scrapedDate;

	private MemberVO memberVO;
	
	public PostVO() {
		super();		
	}
	public String getPostNo() {
		return postNo;
	}
	
	public String getScrapedDate() {
		return scrapedDate;
	}
	public void setScrapedDate(String scrapedDate) {
		this.scrapedDate = scrapedDate;
	}
	
	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}
	
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public PostVO(String postNo, String rnum, String title, String content, int viewCount, int likeCount,
			String regDate, MemberVO memberVO) {
		super();
		this.postNo = postNo;
		this.rnum = rnum;
		this.title = title;
		this.content = content;
		this.viewCount = viewCount;
		this.likeCount = likeCount;
		this.regDate = regDate;
		this.memberVO = memberVO;
	}
	@Override
	public String toString() {
		return "PostVO [postNo=" + postNo + ", rnum=" + rnum + ", title=" + title + ", content=" + content
				+ ", viewCount=" + viewCount + ", likeCount=" + likeCount + ", regDate=" + regDate + ", memberVO="
				+ memberVO + "]";
	}
	
	
	
	
}
