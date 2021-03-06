package site.liuye.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import site.liuye.entity.User;
import site.liuye.service.UserService;

/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String code = request.getParameter("code");
		if (request.getSession().getAttribute("code").toString().equalsIgnoreCase(code)) {
			UserService userService = new UserService();
			User user = new User();
			try {
				BeanUtils.copyProperties(user, request.getParameterMap());
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (userService.register(user)) {
				request.setAttribute("msg", "注册成功，请登录！");
				request.getRequestDispatcher("user_login.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "用户名重复，请重新填写！");
				request.getRequestDispatcher("user_register.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("msg", "验证码错误！");
			request.getRequestDispatcher("user_register.jsp").forward(request, response);
		}
	}
}
