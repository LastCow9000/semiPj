package HoH.model;

public class PagingBean {
	// 현재 페이지 
	private int nowPage=1;
	// 페이지당 게시물 수 
	private int postCountPerPage=16;
	// 페이징 밑에 있는 1~4까지 있는거
	private int pageCountPerPageGroup=4;
	// 총 게시물 수
	private int totalPostCount;
	//생성자 생성
	public PagingBean(int totalPostCount) {
		super();
		this.totalPostCount = totalPostCount;
	}
	public PagingBean(int totalPostCount, int nowPage) {
		super();
		this.nowPage = nowPage;
		this.totalPostCount = totalPostCount;
	}
	
	// 현재페이지를 받아오는 메서드
	public int getNowPage() {
		return nowPage;
	}
	//페이지당 게시물 갯수 받아오는 메서드
	public int getPostCountPerPage() {
		return postCountPerPage;
	}
	//
	public int getStartRowNumber() {
		return (nowPage-1)*postCountPerPage+1;
	}
	
	public int getEndRowNumber() {
		int endRowNumber = nowPage*postCountPerPage;
		if(totalPostCount<endRowNumber)
			endRowNumber = totalPostCount;
		return endRowNumber;
	}
	private int getTotalPage() {
		int num = totalPostCount%postCountPerPage;
		int totalPage = 0;
		if(num==0) {
			totalPage = totalPostCount/postCountPerPage;
		} else {
			totalPage = totalPostCount/postCountPerPage+1;
		}
		return totalPage;
	}
	private int getTotalPageGroup() {
		int num = getTotalPage()%pageCountPerPageGroup;
		int totalPageGroup=0;
		if(num==0) {
			totalPageGroup = getTotalPage()/pageCountPerPageGroup;
		}else {
			totalPageGroup= getTotalPage()/pageCountPerPageGroup+1;
		}
		return totalPageGroup;
	}
	private int getNowPageGroup() {
		int num=nowPage%pageCountPerPageGroup;
		int nowPageGroup=0;
		if(num==0) {
			nowPageGroup = nowPage/pageCountPerPageGroup;
		} else {
			nowPageGroup = nowPage/pageCountPerPageGroup+1;
		}
		return nowPageGroup;
	}
	public int getStartOfPageGroup() {
		return pageCountPerPageGroup*(getNowPageGroup()-1)+1;
	}
	public int getEndOfPageGroup() {
		int num =getNowPageGroup()*pageCountPerPageGroup;
		if(num>getTotalPage()) {
			num=getTotalPage();
		}
		return num;
	}
	public boolean isPreviousPageGroup() {
		boolean flag= false;
		if(getNowPageGroup()>1)
			flag=true;
		return flag;
	}
	public boolean isNextPageGroup() {
		boolean flag=false;
		if(getNowPageGroup()<getTotalPageGroup()) {
			flag=true;
		}
		return flag;
	}
	
}





















