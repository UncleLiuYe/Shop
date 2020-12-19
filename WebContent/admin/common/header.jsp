<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav
	class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm p-3 mb-5 bg-white rounded"
	style="background-color: #e3f2fd;">
	<a class="navbar-brand"
		href="${pageContext.request.contextPath }/admin/admin_index.jsp">在线商城后台管理</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath }/admin/order_list">订单管理</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath }/admin/user_list">客户管理</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath }/admin/goods_list">商品管理</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath }/admin/type_list">类目管理</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath }/user/UserLogoutServlet">退出</a></li>
		</ul>
	</div>
</nav>
<br />
<br />
<br />
<br />