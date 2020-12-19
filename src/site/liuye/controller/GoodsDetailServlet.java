package site.liuye.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import site.liuye.entity.Goods;
import site.liuye.service.GoodsService;

/**
 * Servlet implementation class GoodsDetailServlet
 */
@WebServlet("/GoodsDetailServlet")
public class GoodsDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		GoodsService goodsService = new GoodsService();
		int id = Integer.parseInt(request.getParameter("id"));
		Goods g = goodsService.getById(id);
		request.setAttribute("good", g);
		request.getRequestDispatcher("/goods_detail.jsp").forward(request, response);
	}
}
