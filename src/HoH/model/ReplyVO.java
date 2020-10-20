package HoH.model;

public class ReplyVO {
	private String comNo;
	private String nick;
	private String password;
	private String content;
	private PostVO postVO;
	public ReplyVO() {
		super();
	}
	public ReplyVO(String comNo, String nick, String password, String content, PostVO postVO) {
		super();
		this.comNo = comNo;
		this.nick = nick;
		this.password = password;
		this.content = content;
		this.postVO = postVO;
	}
	public String getComNo() {
		return comNo;
	}
	public void setComNo(String comNo) {
		this.comNo = comNo;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public PostVO getPostVO() {
		return postVO;
	}
	public void setPostVO(PostVO postVO) {
		this.postVO = postVO;
	}
	@Override
	public String toString() {
		return "ReplyVO [comNo=" + comNo + ", nick=" + nick + ", password=" + password + ", content=" + content
				+ ", postVO=" + postVO + "]";
	}
}
