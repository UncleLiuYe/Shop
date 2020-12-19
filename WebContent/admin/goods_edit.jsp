<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>商品编辑</title>
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
		<br> <br>
		<form class="form-horizontal"
			action="${pageContext.request.contextPath }/admin/goods_edit"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${g.id }" /> <input
				type="hidden" name="cover" value="${g.cover }" /> <input
				type="hidden" name="image1" value="${g.image1 }" /> <input
				type="hidden" name="image2" value="${g.image2 }" /> <input
				type="hidden" name="pageNo" value="${param.pageNo }" /> <input
				type="hidden" name="type" value="${param.type }" />
			<div class="form-group">
				<label for="input_name" class="col-sm-1 control-label">名称</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="input_name" name="name"
						value="${g.name }" required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="input_name" class="col-sm-1 control-label">价格</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="input_name"
						name="price" value="${g.price }">
				</div>
			</div>
			<div class="form-group">
				<label for="input_name" class="col-sm-1 control-label">介绍</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="input_name"
						name="intro" value="${g.intro }">
				</div>
			</div>
			<div class="form-group">
				<label for="input_name" class="col-sm-1 control-label">库存</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="input_name"
						name="stock" value="${g.stock }">
				</div>
			</div>
			<div class="form-group">
				<label for="input_file" class="col-sm-1 control-label">封面图片</label>
				<div class="col-sm-6">
					<img src="${pageContext.request.contextPath }${g.cover }"
						width="100" height="100" /> <input type="file" name="cover"
						id="input_file">推荐尺寸: 500 * 500
				</div>
			</div>
			<div class="form-group">
				<label for="input_file" class="col-sm-1 control-label">详情图片1</label>
				<div class="col-sm-6">
					<img src="${pageContext.request.contextPath }${g.image1 }"
						width="100" height="100" /> <input type="file" name="image1"
						id="input_file">推荐尺寸: 500 * 500
				</div>
			</div>
			<div class="form-group">
				<label for="input_file" class="col-sm-1 control-label">详情图片2</label>
				<div class="col-sm-6">
					<img src="${pageContext.request.contextPath }${g.image2 }"
						width="100" height="100" /> <input type="file" name="image2"
						id="input_file">推荐尺寸: 500 * 500
				</div>
			</div>
			<div class="form-group">
				<label for="select_topic" class="col-sm-1 control-label">类目</label>
				<div class="col-sm-6">
					<select class="form-control" id="select_topic" name="typeid">
						<c:forEach items="${types }" var="t">
							<option
								<c:if test="${t.id==g.type.id }">selected="selected"</c:if>
								value="${t.id }">${t.name }</option>
						</c:forEach>
					</select>
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