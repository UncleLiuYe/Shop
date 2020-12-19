package site.liuye.service;

import java.sql.SQLException;
import java.util.List;

import site.liuye.dao.UserDao;
import site.liuye.dao.impl.UserDaoImpl;
import site.liuye.entity.Page;
import site.liuye.entity.User;

public class UserService {
	private UserDao userDao = new UserDaoImpl();

	public boolean register(User user) {
		try {
			if (userDao.isUsernameExist(user.getUsername())) {
				return false;
			}
			return (userDao.addUser(user) > 0) ? true : false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public User userLogin(String username, String password) {
		User resuser = null;
		try {
			resuser = userDao.userLoginWithUserName(username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (resuser != null) {
			return resuser;
		}
		return null;
	}

	public User selectById(int id) {
		User u = null;
		try {
			u = userDao.selectById(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

	public int updateUserAddress(User user) {
		try {
			return userDao.updateUserAddress(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public int updatePwd(User user) {
		try {
			return userDao.updatePwd(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public Page getUserPage(int pageNo) {
		Page p = new Page();
		p.setPageNo(pageNo);
		int pageSize = 7;
		int totalCount = 0;
		try {
			totalCount = userDao.selectUserCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		p.setPageSizeAndTotalCount(pageSize, totalCount);
		List list = null;
		try {
			list = userDao.selectUserList(pageNo, pageSize);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		p.setList(list);
		return p;
	}

	public boolean delete(int id) {
		try {
			userDao.delete(id);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}
