<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav
	class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm p-3 mb-5 bg-white rounded"
	style="background-color: #e3f2fd;">
	<a class="navbar-brand"
		href="${pageContext.request.contextPath }/index">刘晔在线商城</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath }/index">主页</a></li>
			<li class="nav-item"><a class="nav-link dropdown-toggle"
				data-toggle="dropdown" href="#">分类</a>
				<div class="dropdown">
					<div class="dropdown-menu">
						<c:forEach items="${types }" var="item">
							<a class="dropdown-item"
								href="${pageContext.request.contextPath }/GoodsListServlet?id=${item.id}">${item.name}</a>
						</c:forEach>
					</div>
				</div></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath }/goods_cart.jsp">购物车</a></li>
			<c:if test="${!empty user }">
				<li class="nav-item <c:if test='${param.flag==5 }'>active</c:if>"><a
					class="nav-link"
					href="${pageContext.request.contextPath }/user/OrderListServlet">我的订单</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/user/user_center.jsp"
					<c:if test="${param.flag==4 }">class="active"</c:if>>个人中心</a></li>
				<c:if test="${!empty user && user.isadmin }">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath }/admin/admin_index.jsp">后台管理</a></li>
				</c:if>
				<li><a class="nav-link" href="#"
					onclick="confirm('确定退出吗?')?window.location.href='${pageContext.request.contextPath }/user/UserLogoutServlet':''">退出</a></li>
			</c:if>
		</ul>
		<form class="form-inline my-2 my-lg-0 mr-3"
			action="${pageContext.request.contextPath }/GoodsSearchServlet">
			<input class="form-control mr-sm-2" type="search" placeholder="搜索"
				name="keyword">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
		</form>
		<div class="my-2 my-lg-0 mr-5">
			<c:choose>
				<c:when test="${!empty user }">
					<span>${user.name }</span>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath }/user_register.jsp">注册</a>
					<a href="${pageContext.request.contextPath }/user_login.jsp">登录</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</nav>
<br />
<br />
<br />
<br />