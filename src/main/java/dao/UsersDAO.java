package dao;

import java.util.List;

import entities.Users;
import entities.UsersPage;

public interface UsersDAO {
	public List<Users> getAll();
	public List<Users> search(String search);
	public Users getById(int id);
	public Users getByName(String name);
	public Users getByNameOrEmail(String name);
	public void add(Users users);
	public void update(Users users);
	public void delete(int id);
	public UsersPage paging(int currentPage, int pageSize);
}
