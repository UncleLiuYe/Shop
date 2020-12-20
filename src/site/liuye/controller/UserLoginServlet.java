package site.liuye.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import site.liuye.entity.User;
import site.liuye.service.UserService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String ue = request.getParameter("username");
		String password = request.getParameter("password");
		String code = request.getParameter("code");
		if (request.getSession().getAttribute("code").toString().equalsIgnoreCase(code)) {
			UserService userService = new UserService();
			User loginuser = userService.userLogin(ue, password);
			if (loginuser != null) {
				request.getSession().setAttribute("user", loginuser);
				response.sendRedirect(request.getContextPath() + "/index");
				return;
			} else {
				request.setAttribute("msg", "用户名或者密码错误！");
				request.getRequestDispatcher("/user_login.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("msg", "验证码错误！");
			request.getRequestDispatcher("/user_login.jsp").forward(request, response);
		}
	}
}
