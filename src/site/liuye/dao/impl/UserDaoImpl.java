package site.liuye.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import site.liuye.dao.UserDao;
import site.liuye.entity.User;
import site.liuye.utils.JDBCUtils;

public class UserDaoImpl implements UserDao {
	private QueryRunner runner = new QueryRunner(JDBCUtils.getDataSource());

	@Override
	public int addUser(User user) throws SQLException {
		String sql = "insert into user(username,password,name,phone,address,isadmin) values(?,?,?,?,?,?)";
		return runner.update(sql, user.getUsername(), user.getPassword(), user.getName(), user.getPhone(),
				user.getAddress(), user.isIsadmin());
	}

	@Override
	public boolean isUsernameExist(String username) throws SQLException {
		String sql = "select * from user where username = ?";
		User u = runner.query(sql, new BeanHandler<User>(User.class), username);
		if (u == null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public User userLoginWithUserName(String username, String password) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from user where username = ? and password = ?";
		return runner.query(sql, new BeanHandler<User>(User.class), username, password);
	}

	@Override
	public User selectByUsernamePassword(String username, String password) throws SQLException {
		String sql = "select * from user where username=? and password=?";
		return runner.query(sql, new BeanHandler<User>(User.class), username, password);
	}

	@Override
	public User selectById(int id) throws SQLException {
		String sql = "select * from user where id=?";
		return runner.query(sql, new BeanHandler<User>(User.class), id);
	}

	@Override
	public int updateUserAddress(User user) throws SQLException {
		String sql = "update user set name = ?,phone=?,address=? where id = ?";
		return runner.update(sql, user.getName(), user.getPhone(), user.getAddress(), user.getId());
	}

	@Override
	public int updatePwd(User user) throws SQLException {
		String sql = "update user set password = ? where id = ?";
		return runner.update(sql, user.getPassword(), user.getId());
	}

	@Override
	public int selectUserCount() throws SQLException {
		String sql = "select count(*) from user";
		return runner.query(sql, new ScalarHandler<Long>()).intValue();
	}

	@Override
	public List selectUserList(int pageNo, int pageSize) throws SQLException {
		String sql = "select * from user limit ?,?";
		return runner.query(sql, new BeanListHandler<User>(User.class), (pageNo - 1) * pageSize, pageSize);
	}

	@Override
	public int delete(int id) throws SQLException {
		String sql = "delete from user where id = ?";
		return runner.update(sql, id);
	}
}
