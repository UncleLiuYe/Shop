<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>商城主页</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.5.3/css/bootstrap.min.css">

<script src="https://cdn.staticfile.org/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://cdn.staticfile.org/popper.js/1.16.1/umd/popper.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.5.3/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath }/js/goodsbuy.js"></script>
<style>
.carousel-inner img {
	display: inline-block;
	width: 1000px;
	height: 450px;
	border-radius: 15px;
}

.carousel-inner .carousel-caption h3 p {
	color: red;
}
</style>
</head>
<body>
	<jsp:include page="/common/header.jsp" />
	<div class="container">
		<div id="demo" class="carousel slide carousel-fade container"
			data-ride="carousel" data-interval="2000">
			<!-- 指示符 -->
			<ul class="carousel-indicators">
				<c:forEach items="${tiaofulist }" var="item" varStatus="status">
					<li data-target="#demo" data-slide-to="${status.index }"
						class="${status.index==0?'active':status.index }"></li>
				</c:forEach>
			</ul>
			<!-- 轮播图片 -->
			<div class="carousel-inner">
				<c:forEach items="${tiaofulist }" var="item" varStatus="status">
					<c:choose>
						<c:when test="${status.index==0}">
							<div class="carousel-item active text-center">
								<a
									href="${pageContext.request.contextPath }/GoodsDetailServlet?id=${item.id}"><img
									class="img-fluid"
									src="${pageContext.request.contextPath }${item.cover }"
									alt="${item.cover }"> </a>
								<div class="carousel-caption" style="color: red;">
									<h2>${item.name }</h2>
									<h3>${item.price }元</h3>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="carousel-item text-center">
								<a
									href="${pageContext.request.contextPath }/GoodsDetailServlet?id=${item.id}"><img
									class="img-fluid"
									src="${pageContext.request.contextPath }${item.cover }"
									alt="${item.cover }"></a>
								<div class="carousel-caption" style="color: red;">
									<h2>${item.name }</h2>
									<h3>${item.price }元</h3>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>

			<!-- 左右切换按钮 -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>
		<hr />
		<p class="text-center" style="font-size: 25px;">新品推荐</p>
		<div class="row row-cols-1 row-cols-4">
			<c:forEach items="${newlist}" var="item">
				<div class="col-3" style="margin-top: 30px;">
					<div class="card border-primary">
						<img src="${pageContext.request.contextPath}${item.cover}"
							class="card-img-top img-fluid" alt="">
						<div class="card-body text-center">
							<h3 class="card-text">${item.name }</h3>
							<h4 class="card-text">${item.price }元</h4>
							<a
								href="${pageContext.request.contextPath }/GoodsDetailServlet?id=${item.id}">查看</a>&nbsp;&nbsp;<a
								href="#" onclick="buy(${item.id})">加入购物车</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<br />
		<hr />
		<p class="text-center" style="font-size: 25px;">热销商品</p>
		<div class="row row-cols-1 row-cols-4">
			<c:forEach items="${hotlist}" var="item">
				<div class="col-3" style="margin-top: 30px;">
					<div class="card border-primary">
						<img src="${pageContext.request.contextPath}${item.cover}"
							class="card-img-top img-fluid" alt="">
						<div class="card-body text-center">
							<h3 class="card-text">${item.name }</h3>
							<h4 class="card-text">${item.price }元</h4>
							<a
								href="${pageContext.request.contextPath }/GoodsDetailServlet?id=${item.id}">查看</a>&nbsp;&nbsp;<a
								href="#" onclick="buy(${item.id})">加入购物车</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<br />
	<hr />
	<div class="text-center">
		<img class="img-fluid"
			src="${pageContext.request.contextPath}/image/footpic.jpg" alt="">
	</div>
	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>