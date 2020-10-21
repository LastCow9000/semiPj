package HoH.model;

public class MemberVO {
	public static final int likePoint=20;
	public static final int scrapPoint=30;
	public static final int followPoint=40;
	public static final int postPoint=60;
	private String id;
	private String password;
	private String nickName;
	private String ageName;
	private int point;
	private String rank;
	public MemberVO() {
		super();
	}
	public MemberVO(String id, String password, String nickName, String ageName, int point, String rank) {
		super();
		this.id = id;
		this.password = password;
		this.nickName = nickName;
		this.ageName = ageName;
		this.point = point;
		this.rank = rank;
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
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", nickName=" + nickName + ", ageName=" + ageName
				+ ", point=" + point + ", rank=" + rank + "]";
	}
}
