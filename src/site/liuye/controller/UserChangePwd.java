package site.liuye.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import site.liuye.entity.User;
import site.liuye.service.UserService;

@WebServlet("/user/UserChangePwd")
public class UserChangePwd extends HttpServlet {
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
		String password = request.getParameter("password");
		String newPwd = request.getParameter("newPassword");
		UserService userService = new UserService();
		User u = (User) request.getSession().getAttribute("user");
		if (password.equals(u.getPassword())) {
			u.setPassword(newPwd);
			int res = userService.updatePwd(u);
			if (res > 0) {
				request.setAttribute("msg", "修改成功！");
			} else {
				request.setAttribute("failMsg", "修改失败失败！");
			}
			request.getRequestDispatcher("/user/user_center.jsp").forward(request, response);
		} else {
			request.setAttribute("failMsg", "修改失败，原密码不正确，你再想想！");
			request.getRequestDispatcher("/user/user_center.jsp").forward(request, response);
		}
	}
}
