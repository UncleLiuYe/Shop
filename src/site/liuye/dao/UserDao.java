package site.liuye.dao;

import java.sql.SQLException;
import java.util.List;

import site.liuye.entity.User;

public interface UserDao {
	User userLoginWithUserName(String username, String password) throws SQLException;

	User selectByUsernamePassword(String username, String password) throws SQLException;

	int updateUserAddress(User user) throws SQLException;

	User selectById(int id) throws SQLException;

	int updatePwd(User user) throws SQLException;

	List selectUserList(int pageNo, int pageSize) throws SQLException;

	int selectUserCount() throws SQLException;

	int delete(int id) throws SQLException;

	int addUser(User user) throws SQLException;

	boolean isUsernameExist(String username) throws SQLException;
}
