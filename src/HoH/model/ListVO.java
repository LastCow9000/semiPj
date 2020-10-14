package HoH.model;

import java.util.ArrayList;

public class ListVO {
	private ArrayList<PostVO> list;
	private PagingBean pagingBean;
	public ListVO(ArrayList<PostVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public ArrayList<PostVO> getList() {
		return list;
	}
	public void setList(ArrayList<PostVO> list) {
		this.list = list;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "[list=" + list + ", pagingBean=" + pagingBean + "]";
	}
	
}
