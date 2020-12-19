<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>购物车</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.5.3/css/bootstrap.min.css">

<script src="https://cdn.staticfile.org/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://cdn.staticfile.org/popper.js/1.16.1/umd/popper.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.5.3/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath }/js/goodsbuy.js"></script>
</head>
<body>
	<jsp:include page="/common/header.jsp" />
	<div class="container text-center">
		<h2>我的购物车</h2>
		<div class="row row-cols-1 row-cols-4">
			<c:forEach items="${order.itemMap }" var="item">
				<div class="col-3" style="margin-top: 30px;">
					<div class="card border-primary">
						<a
							href="${pageContext.request.contextPath }/GoodsDetailServlet?id=${item.key}">
							<img
							src="${pageContext.request.contextPath }${item.value.goods.cover}"
							class="card-img-top img-fluid" width="100%">
						</a>
						<div class="card-body">
							<h3>
								<a
									href="${pageContext.request.contextPath }/GoodsDetailServlet?id=${item.key}">${item.value.goods.name}</a>
							</h3>
							<h3>
								<span>单价: ¥ ${item.value.price}</span>
							</h3>
							<h3>
								<span>数量: ${item.value.amount}</span>
							</h3>
						</div>
					</div>
					<br /> <a class="btn btn-info" href="javascript:buy(${item.key});">增加</a>
					<a class="btn btn-warning" href="javascript:lessen(${item.key});">减少</a>
					<a class="btn btn-danger" href="javascript:deletes(${item.key});">删除</a>
				</div>
			</c:forEach>
		</div>
		<hr />
		<h3>订单总金额: ¥ ${order.total }</h3>
		<a
			class="btn btn-success btn-lg <c:if test='${order.itemMap.size()==0}'>disabled</c:if>"
			style="margin-left: 75%"
			href="${pageContext.request.contextPath}/user/OrderSubmitServlet">提交订单</a>
	</div>
	<br />
	<jsp:include page="/common/footer.jsp" />
</body>
</html>