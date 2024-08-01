package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import entities.Category;
import entities.Product;
import entities.Users;
import entities.UsersPage;

@Repository
public class UsersImpl implements UsersDAO{
	@Autowired
	SessionFactory sessionFactory;
	
	List<Users> list = new ArrayList<Users>();
	@Override
	public List<Users> getAll() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Users");
		list = query.getResultList();
		session.close();
		return list;
	}

	@Override
	public Users getByName(String name) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Users where name like :name").setParameter("name", name);
		Users users = new Users();
		list = query.getResultList();
		if (list.size()!=0) {
			users = list.get(0);
		}
		session.close();
		return users;
	}

	@Override
	public Users getByNameOrEmail(String name) {
		Session session = sessionFactory.openSession();
		Users users = new Users();
		Query query = session.createQuery("from Users where name like :name or email like :name").setParameter("name", name);
		list = query.getResultList();
		if (list.size()!=0) {
			users = list.get(0);
		}
		session.close();
		return users;
	}

	@Override
	public void add(Users users) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(users);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public Users getById(int id) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Users users = session.find(Users.class, id);
		session.getTransaction().commit();
		session.close();
		return users;
	}

	@Override
	public void update(Users users) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(users);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void delete(int id) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Users users = session.find(Users.class, id);
		if (users!=null) {
			session.remove(users);
		}
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public UsersPage paging(int currentPage, int pageSize) {
		int record = 0;
		UsersPage usersPage = new UsersPage();
		Session session = sessionFactory.openSession();
		Query query;
		query = session.createQuery("from Users");
		query.setFirstResult((currentPage-1)*pageSize).setMaxResults(pageSize);
		list = query.getResultList();
		record = list.size();
		int totalPage = record%pageSize==0?record/pageSize:record/pageSize+1;
		usersPage.setCurrentPage(currentPage);
		usersPage.setList(list);
		usersPage.setTotalPage(totalPage);
		usersPage.setPageSize(pageSize);
		session.close();
		return usersPage;
	}

	@Override
	public List<Users> search(String search) {
		Session session = sessionFactory.openSession();
		Query query;
		query = session.createQuery("from Users where name like :name").setParameter("name", "%"+search+"%");
		list = query.getResultList();
		session.close();
		return list;
	}

}
