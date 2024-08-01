package dao;

import java.util.List;

import entities.OrderDetail;
import entities.OrderPage;
import entities.Orders;

public interface OrderDAO {
	public List<Orders> getAll();
	public Orders getById(int id);
	public void add(Orders orders);
	public void addOrderDetail(List<OrderDetail> list, int orderId);
	public Orders getLast();
	public void update(Orders orders);
	public OrderPage paging(int id , int currentPage, int pageSize);
}
