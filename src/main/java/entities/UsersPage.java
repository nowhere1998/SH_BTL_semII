package entities;

import java.util.List;

public class UsersPage {
	private List<Users> list;
	private int totalPage;
	private int currentPage;
	private int pageSize;
	public UsersPage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UsersPage(List<Users> list, int totalPage, int currentPage, int pageSize) {
		super();
		this.list = list;
		this.totalPage = totalPage;
		this.currentPage = currentPage;
		this.pageSize = pageSize;
	}
	public List<Users> getList() {
		return list;
	}
	public void setList(List<Users> list) {
		this.list = list;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
