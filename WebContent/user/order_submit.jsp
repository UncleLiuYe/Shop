<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>订单提交</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.5.3/css/bootstrap.min.css">

<script src="https://cdn.staticfile.org/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://cdn.staticfile.org/popper.js/1.16.1/umd/popper.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.5.3/js/bootstrap.min.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="/common/header.jsp" />
	<div class="container text-center">
		<h2>确认收货信息</h2>
		<form class="card"
			action="${pageContext.request.contextPath }/user/OrderConfirmServlet"
			method="post" id="payform">
			<div class="form-group">
				<input type="text" class="form-control" name="name"
					value="${user.name }" style="padding: 10px;" placeholder="输入收货人"
					required>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="phone"
					value="${user.phone }" style="padding: 10px;" placeholder="输入收货电话"
					required>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="address"
					value="${user.address }" style="padding: 10px;"
					placeholder="输入收货地址" required>
			</div>
			<br>

			<h2>选择支付方式</h2>
			<h3>支付金额: ${order.total }</h3>
			<br> <br>
			<div class="row">
				<div class="col-sm-4">
					<input type="radio" name="paytype" value="1" checked="checked" /><img
						width="150" height="150"
						src="${pageContext.request.contextPath }/image/wechat.jpg"
						alt="微信支付">
				</div>
				<div class="col-sm-4 ">
					<input type="radio" name="paytype" value="2" /><img width="150"
						height="150"
						src="${pageContext.request.contextPath }/image/alipay.jpg"
						alt="支付宝支付">
				</div>
				<div class="col-sm-4 ">
					<input type="radio" name="paytype" value="3" /><img width="150"
						height="150"
						src="${pageContext.request.contextPath }/image/offline.jpg"
						alt="货到付款">
				</div>
			</div>
			<div class="text-center">
				<input type="submit" class="btn btn-primary" value="确认订单"> <br />
			</div>
		</form>
	</div>
	<br />
	<jsp:include page="/common/footer.jsp" />
</body>
</html>