package site.liuye.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import site.liuye.dao.OrderDao;
import site.liuye.dao.impl.OrderDaoImpl;
import site.liuye.entity.Order;
import site.liuye.entity.OrderItem;
import site.liuye.entity.Page;
import site.liuye.utils.JDBCUtils;

public class OrderService {
	private OrderDao oDao = new OrderDaoImpl();

	public int addOrder(Order order) {
		int i = 0;
		Connection con = null;
		try {
			con = JDBCUtils.getConnection();
			con.setAutoCommit(false);
			i = oDao.insertOrder(con, order);
			int id = oDao.getLastInsertId(con);
			order.setId(id);
			for (OrderItem item : order.getItemMap().values()) {
				i = oDao.insertOrderItem(con, item);
			}
			con.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			if (con != null)
				try {
					con.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
		}
		return i;
	}

	public List<Order> selectAll(int userid) {
		List<Order> list = null;
		try {
			list = oDao.selectAll(userid);
			for (Order o : list) {
				List<OrderItem> l = oDao.selectAllItem(o.getId());
				o.setItemList(l);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public Page getOrderPage(int status, int pageNo) {
		Page p = new Page();
		p.setPageNo(pageNo);
		int pageSize = 10;
		int totalCount = 0;
		try {
			totalCount = oDao.getOrderCount(status);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		p.setPageSizeAndTotalCount(pageSize, totalCount);
		List list = null;
		try {
			list = oDao.selectOrderList(status, pageNo, pageSize);
			for (Order o : (List<Order>) list) {
				List<OrderItem> l = oDao.selectAllItem(o.getId());
				o.setItemList(l);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		p.setList(list);
		return p;
	}

	public void updateStatus(int id, int status) {
		try {
			oDao.updateStatus(id, status);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void delete(int id) {
		Connection con = null;
		try {
			con = JDBCUtils.getDataSource().getConnection();
			con.setAutoCommit(false);

			oDao.deleteOrderItem(con, id);
			oDao.deleteOrder(con, id);
			con.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			if (con != null)
				try {
					con.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
		}
	}
}
