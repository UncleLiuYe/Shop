<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单列表</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.5.3/css/bootstrap.min.css">

<script src="https://cdn.staticfile.org/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://cdn.staticfile.org/popper.js/1.16.1/umd/popper.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.5.3/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/common/header.jsp"><jsp:param
			value="5" name="flag" />
	</jsp:include>
	<div class="container text-center">
		<h2>我的订单</h2>
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<tr>
					<th width="10%">ID</th>
					<th width="10%">总价</th>
					<th width="20%">商品详情</th>
					<th width="20%">收货信息</th>
					<th width="10%">订单状态</th>
					<th width="10%">支付方式</th>
					<th width="10%">下单时间</th>
					<th width="10%">操作</th>
				</tr>
				<c:forEach items="${orderList }" var="order">
					<tr>
						<td><p>${order.id }</p></td>
						<td><p>${order.total }</p></td>
						<td><c:forEach items="${order.itemList }" var="item">
								<p>${item.goodsName }(${item.price })x${item.amount }</p>
							</c:forEach></td>
						<td>
							<p>${order.name }</p>
							<p>${order.phone }</p>
							<p>${order.address }</p>
						</td>
						<td>
							<p>
								<c:if test="${order.status==2 }">
									<span style="color: red;">已付款</span>
								</c:if>
								<c:if test="${order.status==3 }">
									<span style="color: green;">已发货</span>
								</c:if>
								<c:if test="${order.status==4 }">
									<span style="color: black;">已完成</span>
								</c:if>
							</p>
						</td>
						<td>
							<p>
								<c:if test="${order.paytype==1 }">微信</c:if>
								<c:if test="${order.paytype==2 }">支付宝</c:if>
								<c:if test="${order.paytype==3 }">货到付款</c:if>
							</p>
						</td>
						<td><p>${order.datetime.toString().substring(0,order.datetime.toString().length()-2) }</p></td>
						<td></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<br />
	<jsp:include page="/common/footer.jsp" />
</body>
</html>