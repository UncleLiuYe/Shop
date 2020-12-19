package site.liuye.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import site.liuye.entity.Order;
import site.liuye.entity.User;
import site.liuye.service.OrderService;

@WebServlet("/user/OrderListServlet")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		User u = (User) request.getSession().getAttribute("user");
		OrderService orderService = new OrderService();
		List<Order> list = orderService.selectAll(u.getId());
		request.setAttribute("orderList", list);
		request.getRequestDispatcher("/user/order_list.jsp").forward(request, response);
	}
}
