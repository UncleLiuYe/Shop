<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>重置密码</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
		<form action="${pageContext.request.contextPath }/admin/user_reset"
			method="post">
			<input type="hidden" name="id" value="${param.id }">
			<div class="form-group">
				<label for="input_name" class="col-sm-1 control-label">用户名</label>
				<div class="col-sm-5">${param.username }</div>
			</div>
			<div class="form-group">
				<label for="input_name" class="col-sm-1 control-label">密码</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="input_name"
						name="password" value="" required="required">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-1 col-sm-10">
					<button type="submit" class="btn btn-success">提交修改</button>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="/common/footer.jsp" />
</body>
</html>