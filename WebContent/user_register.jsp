<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>用户注册</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.5.3/css/bootstrap.min.css">

<script src="https://cdn.staticfile.org/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://cdn.staticfile.org/popper.js/1.16.1/umd/popper.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.5.3/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/common/header.jsp" />
	<div class="container text-center">
		<c:if test="${!empty msg }">
			<div class="alert alert-danger">${msg }</div>
		</c:if>
		<form class="card"
			action="${pageContext.request.contextPath }/UserRegisterServlet"
			method="post">
			<h3>注册新用户</h3>
			<div class="form-group">
				<input type="text" name="username" class="form-control"
					placeholder="请输入用户名" required>
			</div>
			<div class="form-group">
				<input type="password" name="password" class="form-control"
					placeholder="请输入密码" required>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="name"
					placeholder="请输入收货人">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="phone"
					placeholder="请输入收货电话">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="address"
					placeholder="请输入收货地址">
			</div>
			<br />
			<div class="text-center">
				<input type="submit" class="btn btn-primary" value="提交">
			</div>
			<br />
		</form>
		<br />
	</div>
	<jsp:include page="/common/footer.jsp" />
</body>
</html>