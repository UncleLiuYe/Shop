package site.liuye.dao;

import java.sql.SQLException;
import java.util.List;

import site.liuye.entity.Type;

public interface TypeDao {

	List<Type> selectAll() throws SQLException;

	int insert(Type t) throws SQLException;

	int delete(int id) throws SQLException;

	int update(Type t) throws SQLException;

	Type select(int id) throws SQLException;

}
