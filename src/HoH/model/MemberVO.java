package HoH.model;

public class MemberVO {
	private String id;
	private String password;
	private String nickName;
	private String ageName;
	private int point;
	public MemberVO() {
		super();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getAgeName() {
		return ageName;
	}
	public void setAgeName(String ageName) {
		this.ageName = ageName;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public MemberVO(String id, String password, String nickName, String ageName, int point) {
		super();
		this.id = id;
		this.password = password;
		this.nickName = nickName;
		this.ageName = ageName;
		this.point = point;
	}
	
	//로그인기능 사용시 혹시 몰라서 넣었습니다.
	public MemberVO(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "[id=" + id + ", password=" + password + ", nickName=" + nickName + ", ageName=" + ageName
				+ ", point=" + point + "]";
	}
	
	
}
