<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>商品详情</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.5.3/css/bootstrap.min.css">

<script src="https://cdn.staticfile.org/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://cdn.staticfile.org/popper.js/1.16.1/umd/popper.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.5.3/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath }/js/goodsbuy.js"></script>
<style type="text/css">
.card-img-top {
	display: inline-block;
	width: 1000px;
	height: 500px;
	border-radius: 15px;
}

.img-xiangqing {
	width: 100%;
	height: 100%;
}
</style>
</head>

<body>
	<jsp:include page="/common/header.jsp" />
	<div class="container">
		<div>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath }/index">主页</a></li>
				<li class="breadcrumb-item active">${good.type.name }</li>
			</ol>
		</div>
		<div class="card" style="border-radius: 15px;">
			<img class="card-img-top img-fluid" class="img-responsive"
				src="${pageContext.request.contextPath }${good.cover}"
				alt="${good.name }" style="width: 100%">
			<div class="card-body">
				<h4 class="card-title">商品名称: &nbsp;&nbsp;${good.name }</h4>
				<h5 class="card-text">商品价格: &nbsp;&nbsp;${good.price }元</h5>
				<h5 class="card-text">商品剩余库存: &nbsp;&nbsp;${good.stock }个</h5>
				<div class="text-center">
					<a href="#" class="btn btn-primary" onclick="buy(${good.id})">加入购物车</a>
				</div>
			</div>
		</div>
		<br>

		<div>
			<div class="card container" style="border-radius: 15px;">
				<h3 class="text-center">商品详情</h3>
				<p>${good.intro }</p>
				<br /> <img class="img-responsive img-xiangqing img-fluid"
					src="${pageContext.request.contextPath }${good.image1 }"
					alt="${good.name }"> <br /> <img
					class="img-responsive img-xiangqing img-fluid"
					style="margin-bottom: 5px;"
					src="${pageContext.request.contextPath }${good.image2 }"
					alt="${good.name }">
			</div>
		</div>
		<br /> <br />
	</div>
	<jsp:include page="/common/footer.jsp" />
</body>
</html>