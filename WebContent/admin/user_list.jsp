<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>客户列表</title>
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
		<div class="text-right">
			<a class="btn btn-warning"
				href="${pageContext.request.contextPath }/admin/user_add.jsp">添加客户</a>
		</div>
		<c:if test="${!empty msg }">
			<div class="alert alert-success">${msg }</div>
		</c:if>
		<c:if test="${!empty failMsg }">
			<div class="alert alert-danger">${failMsg }</div>
		</c:if>
		<br>
		<table class="table table-bordered table-hover">
			<tr>
				<th width="5%">ID</th>
				<th width="10%">用户名</th>
				<th width="10%">收件人</th>
				<th width="10%">电话</th>
				<th width="10%">地址</th>
				<th width="10%">操作</th>
			</tr>
			<c:forEach items="${p.list }" var="u">
				<tr>
					<td><p>${u.id }</p></td>
					<td><p>${u.username }</p></td>
					<td><p>${u.name }</p></td>
					<td><p>${u.phone }</p></td>
					<td><p>${u.address }</p></td>
					<td><a class="btn btn-info"
						href="${pageContext.request.contextPath }/admin/user_reset.jsp?id=${u.id }&username=${u.username }">重置密码</a>
						<a class="btn btn-primary"
						href="${pageContext.request.contextPath }/admin/user_editshow?id=${u.id }">修改</a>
						<a class="btn btn-danger"
						href="${pageContext.request.contextPath }/admin/user_delete?id=${u.id }">删除</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<br>
	</div>
	<jsp:include page="/common/footer.jsp" />
</body>
</html>