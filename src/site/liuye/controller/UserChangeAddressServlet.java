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

@WebServlet("/user/UserChangeAddressServlet")
public class UserChangeAddressServlet extends HttpServlet {
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
		User loginUser = (User) request.getSession().getAttribute("user");
		UserService userService = new UserService();
		try {
			BeanUtils.copyProperties(loginUser, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int res = userService.updateUserAddress(loginUser);
		if (res > 0) {
			request.setAttribute("msg", "收件信息更新成功！");
		} else {
			request.setAttribute("failMsg", "收件信息更新失败！");
		}
		request.getRequestDispatcher("/user/user_center.jsp").forward(request, response);
	}
}
