package dao;

import java.util.List;

import entities.Image;
import entities.Product;
import entities.ProductPage;


public interface ProductDAO {
	public List<Product> getAll();
	public List<Product> getNewest();
	public List<Product> getByCategoryId(int categoryId);
	public List<Product> search(String search);
	public Product getById(int id);
	public Product getByName(String name);
	public void add(Product product);
	public void update(Product product);
	public void delete(int id);
	public ProductPage paging(Integer categoryId, int currentPage, int pageSize);
	public void addImage(Image image);
}
