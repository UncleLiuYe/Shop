package site.liuye.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import site.liuye.entity.Page;
import site.liuye.service.GoodsService;

/**
 * Servlet implementation class GoodsSearchServlet
 */
@WebServlet("/GoodsSearchServlet")
public class GoodsSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		GoodsService goodsService = new GoodsService();
		String keyword = request.getParameter("keyword");
		int pageNo = 1;
		if (request.getParameter("pageNo") != null) {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		Page p = goodsService.getSearchGoodsPage(keyword, pageNo);
		request.setAttribute("p", p);
		request.setAttribute("keyword", keyword);
		request.getRequestDispatcher("/goods_search.jsp").forward(request, response);
	}
}
