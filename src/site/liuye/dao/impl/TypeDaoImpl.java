package site.liuye.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import site.liuye.dao.TypeDao;
import site.liuye.entity.Type;
import site.liuye.utils.JDBCUtils;

public class TypeDaoImpl implements TypeDao {
	private QueryRunner runner = new QueryRunner(JDBCUtils.getDataSource());

	@Override
	public List<Type> selectAll() throws SQLException {
		String sql = "select * from type";
		return runner.query(sql, new BeanListHandler<Type>(Type.class));
	}

	@Override
	public Type select(int id) throws SQLException {
		String sql = "select * from type where id = ?";
		return runner.query(sql, new BeanHandler<Type>(Type.class), id);
	}

	@Override
	public int insert(Type t) throws SQLException {
		String sql = "insert into type(name) values(?)";
		return runner.update(sql, t.getName());
	}

	@Override
	public int update(Type t) throws SQLException {
		String sql = "update type set name=? where id = ?";
		return runner.update(sql, t.getName(), t.getId());
	}

	@Override
	public int delete(int id) throws SQLException {
		String sql = "delete from type where id = ?";
		return runner.update(sql, id);
	}
}
