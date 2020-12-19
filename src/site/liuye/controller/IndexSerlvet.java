package site.liuye.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import site.liuye.entity.Type;
import site.liuye.service.GoodsService;
import site.liuye.service.TypeService;

@WebServlet("/index")
public class IndexSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		GoodsService goodsService = new GoodsService();
		List<Type> list = new TypeService().selectAll();
		request.getSession().setAttribute("types", list);
		List<Map<String, Object>> tiaofuList = goodsService.getTiaoFuGoodsList();
		request.setAttribute("tiaofulist", tiaofuList);
		List<Map<String, Object>> hotList = goodsService.getHotGoodsList();
		request.setAttribute("hotlist", hotList);
		request.setAttribute("newlist", goodsService.getNewGoodsList());
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}
