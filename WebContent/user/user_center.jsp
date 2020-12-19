<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>个人信息</title>
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
		<h3>个人中心</h3>
		<c:if test="${!empty msg }">
			<div class="alert alert-info">${msg }</div>
			<br />
		</c:if>
		<c:if test="${!empty failMsg }">
			<div class="alert alert-danger">${failMsg }</div>
			<br />
		</c:if>
		<form class="card"
			action="${pageContext.request.contextPath }/user/UserChangeAddressServlet"
			method="post">
			<h4 class="card-header">收货信息</h4>
			<div class="card-body">
				<div class="form-group">
					<span>收货人<label></label></span> <input class="form-control"
						type="text" name="name" value="${user.name }" placeholder="请输入收货人">
				</div>
				<div class="form-group">
					<span>收货电话</span> <input class="form-control" type="text"
						name="phone" value="${user.phone }" placeholder="请输入收货电话">
				</div>
				<div class="form-group">
					<span>收货地址</span> <input class="form-control" type="text"
						name="address" value="${user.address }" placeholder="请输入收货地址">
				</div>
				<br /> <input type="submit" class="btn btn-primary" value="提交">
			</div>
		</form>
		<hr />
		<form class="card"
			action="${pageContext.request.contextPath}/user/UserChangePwd"
			method="post">
			<h4 class="card-header">安全信息</h4>
			<div class="card-body">
				<div class="form-group">
					<span>原密码</span> <input class="form-control" type="text"
						name="password" placeholder="请输入原密码">
				</div>
				<div class="form-group">
					<span>新密码</span> <input class="form-control" type="text"
						name="newPassword" placeholder="请输入新密码">
				</div>
				<br /> <input type="submit" class="btn btn-primary" value="提交">
			</div>
		</form>
	</div>
	<br />
	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>