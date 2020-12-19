package site.liuye.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import site.liuye.entity.Order;
import site.liuye.entity.OrderItem;

public interface OrderDao {

	int insertOrder(Connection con, Order order) throws SQLException;

	int getLastInsertId(Connection con) throws SQLException;

	int insertOrderItem(Connection con, OrderItem item) throws SQLException;

	List<Order> selectAll(int userid) throws SQLException;

	List<OrderItem> selectAllItem(int orderid) throws SQLException;

	int getOrderCount(int status) throws SQLException;

	void updateStatus(int id, int status) throws SQLException;

	void deleteOrder(Connection con, int id) throws SQLException;

	void deleteOrderItem(Connection con, int id) throws SQLException;

	List<Order> selectOrderList(int status, int pageNo, int pageSize) throws SQLException;

}
