<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>用户登录</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.5.3/css/bootstrap.min.css">

<script src="https://cdn.staticfile.org/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://cdn.staticfile.org/popper.js/1.16.1/umd/popper.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.5.3/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/common/header.jsp"></jsp:include>
	<div class="container text-center">
		<form action="${pageContext.request.contextPath }/LoginServlet"
			method="post">
			<h3>用户登录</h3>
			<label for="username"></label> <input type="text"
				class="form-control" name="username" id="username"
				placeholder="在此输入用户名" required> <label for="password"></label>
			<input type="password" class="form-control" id="password"
				name="password" placeholder="在此输入密码" required> <br />
			<button type="submit" class="btn btn-primary">登录</button>
			<br /> <br />
			<c:if test="${!empty msg }">
				<div class="alert alert-danger">${msg }</div>
			</c:if>
		</form>
	</div>
	<br />
	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>