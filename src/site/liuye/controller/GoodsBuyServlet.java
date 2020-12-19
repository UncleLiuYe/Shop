package site.liuye.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import site.liuye.entity.Goods;
import site.liuye.entity.Order;
import site.liuye.service.GoodsService;

@WebServlet("/GoodsBuyServlet")
public class GoodsBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		GoodsService goodsService = new GoodsService();
		Order o = null;
		if (req.getSession().getAttribute("order") != null) {
			o = (Order) req.getSession().getAttribute("order");
		} else {
			o = new Order();
			req.getSession().setAttribute("order", o);
		}
		int goodsid = Integer.parseInt(req.getParameter("goodsid"));
		Goods goods = goodsService.getById(goodsid);
		if (goods.getStock() > 0) {
			o.addGoods(goods);
			resp.getWriter().print("ok");
		} else {
			resp.getWriter().print("fail");
		}
	}
}
