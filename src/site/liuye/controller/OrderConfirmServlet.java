package site.liuye.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import site.liuye.entity.Order;
import site.liuye.entity.User;
import site.liuye.service.OrderService;

/**
 * Servlet implementation class OrderConfirmServlet
 */
@WebServlet("/user/OrderConfirmServlet")
public class OrderConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		OrderService oService = new OrderService();
		Order o = (Order) request.getSession().getAttribute("order");
		try {
			BeanUtils.copyProperties(o, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		o.setDatetime(new Date());
		o.setStatus(2);
		o.setUser((User) request.getSession().getAttribute("user"));
		int i = 0;
		try {
			i = oService.addOrder(o);
		} catch (Exception e) {
			// TODO: handle exception
			i = Integer.valueOf(e.getMessage());
		}
		request.getSession().removeAttribute("order");
		request.setAttribute("msg", (i > 0) ? "订单支付成功！" : "订单支付失败！");
		request.getRequestDispatcher("/user/order_success.jsp").forward(request, response);
	}
}
