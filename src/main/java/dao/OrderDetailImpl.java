package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import entities.OrderDetail;

@Repository
public class OrderDetailImpl implements OrderDetailDAO{
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<OrderDetail> getByOrderId(int id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from OrderDetail where orderId = :orderId").setParameter("orderId", id);
		List<OrderDetail> list = new ArrayList<OrderDetail>();
		list = query.getResultList();
		session.close();
		return list;
	}
	
	
}
