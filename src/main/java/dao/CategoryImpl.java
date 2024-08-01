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

@Repository
public class CategoryImpl implements CategoryDAO{
	@Autowired
	SessionFactory sessionFactory;
	
	List<Category> list = new ArrayList<Category>();
	
	@Override
	public List<Category> getAll() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Category");
		list = query.getResultList();
		session.close();
		return list;
	}

	@Override
	public List<Category> getByParentName(String parentName) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Category where parentName like :parentName").setParameter("parentName", parentName);
		list = query.getResultList();
		session.close();
		return list;
	}

	@Override
	public void add(Category category) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(category);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public Category getById(int id) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Category category = session.find(Category.class, id);
		session.getTransaction().commit();
		session.close();
		return category;
	}

	@Override
	public void update(Category category) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(category);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void delete(int id) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Category category = session.find(Category.class, id);
		session.remove(category);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public Category getByName(String name) {
		Category category = new Category();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query query = session.createQuery("from Category where name = :name").setParameter("name", name);
		if (query.getResultList().size()!=0) {
			category = (Category) query.getResultList().get(0);
		}
		session.getTransaction().commit();
		session.close();
		return category;
	}

	@Override
	public CategoryPage paging(String parentName, int currentPage, int pageSize) {
		int record = 0;
		CategoryPage categoryPage = new CategoryPage();
		Session session = sessionFactory.openSession();
		Query query;
		if (parentName.isEmpty()) {
			query = session.createQuery("from Category");
			
		} else {
			query = session.createQuery("from Category where parentName like :parentName").setParameter("parentName", parentName);
		}
		record = query.getResultList().size();
		query.setFirstResult((currentPage-1)*pageSize).setMaxResults(pageSize);
		int totalPage = record%pageSize==0?record/pageSize:record/pageSize+1;
		categoryPage.setList(query.getResultList());
		categoryPage.setCurrentPage(currentPage);
		categoryPage.setPageSize(pageSize);
		categoryPage.setTotalPage(totalPage);
		session.close();
		return categoryPage;
		
	}

	@Override
	public List<Category> search(String search) {
		Session session = sessionFactory.openSession();
		Query query;
		query = session.createQuery("from Category where name like :name").setParameter("name", "%"+search+"%");
		list = query.getResultList();
		session.close();
		return list;
	}

}
