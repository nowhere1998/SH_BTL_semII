package entities;

import java.util.List;

public class ProductPage {
	private List<Product> list;
	private int totalPage;
	private int pageSize;
	private int currentPage;
	public ProductPage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductPage(List<Product> list, int totalPage, int pageSize, int currentPage) {
		super();
		this.list = list;
		this.totalPage = totalPage;
		this.pageSize = pageSize;
		this.currentPage = currentPage;
	}
	public List<Product> getList() {
		return list;
	}
	public void setList(List<Product> list) {
		this.list = list;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
}
