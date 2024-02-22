package service;

import java.util.List;

import dao.User3DAO;
import dto.User3DTO;

public class User3Service {

	private static User3Service instance = new User3Service();
	
	public static User3Service getInstance() {
		return instance;
	}
	
	private User3Service() {}
	
	private User3DAO dao = User3DAO.getInstance();
	
	public void insertUser3(User3DTO user) {
		dao.insertUser3(user);
	}
	
	public void selectUser3(String uid) {
		return;
	}
	
	public List<User3DTO> selectUser3s() {
		return dao.selectUser3s();
	}
	
	public void updateUser3(User3DTO user) {
		
	}
	
	public void deleteUser3(String uid) {
		
	}
}
