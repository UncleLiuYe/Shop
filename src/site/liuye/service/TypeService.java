package site.liuye.service;

import java.sql.SQLException;
import java.util.List;

import site.liuye.dao.TypeDao;
import site.liuye.dao.impl.TypeDaoImpl;
import site.liuye.entity.Type;

public class TypeService {
	private TypeDao typeDao = new TypeDaoImpl();

	public List<Type> selectAll() {
		// TODO Auto-generated method stub
		try {
			return typeDao.selectAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public int insert(Type t) {
		// TODO Auto-generated method stub
		try {
			return typeDao.insert(t);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public int delete(int id) {
		// TODO Auto-generated method stub
		try {
			return typeDao.delete(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public int update(Type t) {
		// TODO Auto-generated method stub
		try {
			return typeDao.update(t);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public Type select(int id) {
		// TODO Auto-generated method stub
		try {
			return typeDao.select(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
