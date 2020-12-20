package site.liuye.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CodeServlet
 */
@WebServlet("/CodeServlet")
public class CodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("image/jpeg");
		response.setHeader("Cache-Control", "no-cache");
		int width = 60, height = 30;
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		Random random = new Random();
		String s = "";
		for (int i = 0; i < 4; i++) {
			s += random.nextInt(10);
		}
		request.getSession().setAttribute("code", s);
		Color color = new Color(random.nextInt(256), random.nextInt(256), random.nextInt(256));
		String a = null;
		Font font = new Font(a, Font.ITALIC, 18);
		g.setColor(color);
		g.setFont(font);
		g.drawString(s, 10, height - 5);
		g.dispose();
		ImageIO.write(image, "JPEG", response.getOutputStream());
	}
}
