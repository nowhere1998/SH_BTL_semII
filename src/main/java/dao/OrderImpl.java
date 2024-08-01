package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import entities.Category;
import entities.CategoryPage;
import entities.OrderDetail;
import entities.OrderPage;
import entities.Orders;

@Repository
public class OrderImpl implements OrderDAO{
	@Autowired
	SessionFactory sessionFactory;
	
	List<Orders> list = new ArrayList<Orders>();

	@Override
	public List<Orders> getAll() {
		Session session = sessionFactory.openSession();
		Query query;
		query = session.createQuery("from Orders");
		list = query.getResultList();
		session.close();
		return list;
	}

	@Override
	public void add(Orders orders) {
		Session session = sessionFactory.openSession(); 
		Query query;
		session.beginTransaction();
		session.save(orders);
		session.getTransaction().commit();
		session.close();
		
	}

	@Override
	public void update(Orders orders) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(orders);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void addOrderDetail(List<OrderDetail> list, int orderId) {
		Session session = sessionFactory.openSession(); 
		Query query;
		session.beginTransaction();
		for (OrderDetail orderDetail : list) {
			orderDetail.setOrderId(orderId);
			session.save(orderDetail);
		}
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public Orders getLast() {
		Session session = sessionFactory.openSession();
		Query query;
		query = session.createQuery("from Orders");
		list = query.getResultList();
		Orders orders = list.get(list.size()-1);
		session.close();
		return orders;
	}

	@Override
	public Orders getById(int id) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Orders order = session.find(Orders.class, id);
		session.getTransaction().commit();
		session.close();
		return order;
	}

	@Override
	public OrderPage paging(int id, int currentPage, int pageSize) {
		int record = 0;
		OrderPage orderPage = new OrderPage();
		Session session = sessionFactory.openSession();
		Query query;
		query = session.createQuery("from Orders");
		record = query.getResultList().size();
		query.setFirstResult((currentPage-1)*pageSize).setMaxResults(pageSize);
		int totalPage = record%pageSize==0?record/pageSize:record/pageSize+1;
		orderPage.setList(query.getResultList());
		orderPage.setCurrentPage(currentPage);
		orderPage.setPageSize(pageSize);
		orderPage.setTotalPage(totalPage);
		session.close();
		return orderPage;
	}
}
