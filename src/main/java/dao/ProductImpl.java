package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import entities.CategoryPage;
import entities.Image;
import entities.Product;
import entities.ProductPage;

@Repository
public class ProductImpl implements ProductDAO{
	@Autowired
	SessionFactory sessionFactory;
	
	List<Product> list = new ArrayList<Product>();
	
	@Override
	public List<Product> getAll() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Product");
		list = query.getResultList();
		session.close();
		return list;
	}

	@Override
	public Product getById(int id) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Product product = session.find(Product.class, id);
		session.getTransaction().commit();
		session.close();
		return product;
	}

	@Override
	public Product getByName(String name) {
		Product product = new Product();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Product where name like :name").setParameter("name", name);
		if (query.getResultList().size()!=0) {
			product = (Product) query.getResultList().get(0);
		}
		session.close();
		return product;
	}

	@Override
	public void add(Product product) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(product);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void update(Product product) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(product);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void delete(int id) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Product product = session.find(Product.class, id);
		if (product!=null) {
			session.remove(product);
		}
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public List<Product> getByCategoryId(int categoryId) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Product where categoryId = :categoryId").setParameter("categoryId", categoryId);
		list = query.getResultList();
		session.close();
		return list;
	}

	@Override
	public ProductPage paging(Integer categoryId, int currentPage, int pageSize) {
		int record = 0;
		ProductPage productPage = new ProductPage();
		Session session = sessionFactory.openSession();
		Query query;
		System.out.println(categoryId);
		if (categoryId==null) {
			query = session.createQuery("from Product");
			record = query.getResultList().size();
			
		} else {
			query = session.createQuery("from Product where categoryId like :categoryId").setParameter("categoryId", categoryId);
			record = query.getResultList().size();
		}
		query.setFirstResult((currentPage-1)*pageSize).setMaxResults(pageSize);
		int totalPage = record%pageSize==0?record/pageSize:record/pageSize+1;
		productPage.setList(query.getResultList());
		productPage.setCurrentPage(currentPage);
		productPage.setPageSize(pageSize);
		productPage.setTotalPage(totalPage);
		session.close();
		return productPage;
	}

	@Override
	public List<Product> search(String search) {
		Session session = sessionFactory.openSession();
		Query query;
		query = session.createQuery("from Product where name like :name").setParameter("name", "%"+search+"%");
		list = query.getResultList();
		session.close();
		return list;
	}

	@Override
	public void addImage(Image image) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Product> getNewest() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Product order by id desc").setFirstResult(0).setMaxResults(4);
		list = query.getResultList();
		session.close();
		return list;
	}

}
