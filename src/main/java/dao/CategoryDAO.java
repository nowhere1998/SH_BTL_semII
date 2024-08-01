package dao;

import java.util.List;

import entities.Category;
import entities.CategoryPage;

public interface CategoryDAO {
	public List<Category> getAll();
	public Category getById(int id);
	public List<Category> getByParentName(String parentName); 
	public Category getByName(String name);
	public void add(Category category);
	public void update(Category category);
	public void delete(int id);
	public CategoryPage paging(String parentName, int currentPage, int pageSize);
	public List<Category> search(String search);
}
