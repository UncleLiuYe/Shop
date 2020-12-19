<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>订单列表</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.5.3/css/bootstrap.min.css">

<script src="https://cdn.staticfile.org/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://cdn.staticfile.org/popper.js/1.16.1/umd/popper.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.5.3/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/admin/common/header.jsp" />
	<div class="container-fluid">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a
				class="nav-link <c:if test='${status==0 }'>active</c:if>"
				href="${pageContext.request.contextPath }/admin/order_list">全部订单</a></li>
			<li class="nav-item"><a
				class="nav-link <c:if test='${status==1 }'>active</c:if>"
				href="${pageContext.request.contextPath }/admin/order_list?status=1">未付款</a></li>
			<li class="nav-item"><a
				class="nav-link  <c:if test='${status==2 }'>active</c:if>"
				href="${pageContext.request.contextPath }/admin/order_list?status=2">已付款</a></li>
			<li class="nav-item"><a
				class="nav-link <c:if test='${status==3 }'>active</c:if>"
				href="${pageContext.request.contextPath }/admin/order_list?status=3">配送中</a></li>
			<li class="nav-item"><a
				class="nav-link  <c:if test='${status==4 }'>active</c:if>"
				href="${pageContext.request.contextPath }/admin/order_list?status=4">已完成</a></li>
		</ul>

		<table class="table table-bordered table-hover">
			<tr>
				<th width="5%">ID</th>
				<th width="5%">总价</th>
				<th width="15%">商品详情</th>
				<th width="20%">收货信息</th>
				<th width="10%">订单状态</th>
				<th width="10%">支付方式</th>
				<th width="10%">下单用户</th>
				<th width="10%">下单时间</th>
				<th width="10%">操作</th>
			</tr>
			<c:forEach items="${p.list }" var="order">
				<tr>
					<td><p>${order.id }</p></td>
					<td><p>${order.total }</p></td>
					<td><c:forEach items="${order.itemList }" var="item">
							<p>${item.goodsName }(${item.price })x${item.amount}</p>
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
					<td><p>${order.user.username }</p></td>
					<td><p>${order.datetime.toString().substring(0,order.datetime.toString().length()-2) }</p></td>
					<td><c:if test="${order.status==2 }">
							<a class="btn btn-success"
								href="${pageContext.request.contextPath }/admin/order_status?id=${order.id }&status=3">发货</a>
						</c:if> <c:if test="${order.status==3 }">
							<a class="btn btn-warning"
								href="${pageContext.request.contextPath }/admin/order_status?id=${order.id }&status=4">完成</a>
						</c:if> <a class="btn btn-danger"
						href="${pageContext.request.contextPath }/admin/order_delete?id=${order.id }&pageNo=${p.pageNo}&status=${status}">删除</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<br>
	</div>
	<jsp:include page="/common/footer.jsp" />
</body>
</html>