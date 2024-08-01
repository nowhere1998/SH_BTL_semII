package dao;

import java.util.List;

import entities.OrderDetail;

public interface OrderDetailDAO {
	public List<OrderDetail> getByOrderId(int id);
}
