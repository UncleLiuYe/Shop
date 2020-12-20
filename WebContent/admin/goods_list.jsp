<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>商品列表</title>
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
				href="${pageContext.request.contextPath }/admin/goods_add.jsp">添加商品</a>
		</div>
		<ul class="nav nav-tabs">
			<li class="nav-item"><a
				class="nav-link <c:if test='${type==0 }'>active</c:if>"
				href="${pageContext.request.contextPath }/admin/goods_list">全部商品</a></li>
			<li class="nav-item"><a
				class="nav-link <c:if test='${type==1 }'>active</c:if>"
				href="${pageContext.request.contextPath }/admin/goods_list?type=1">条幅推荐</a></li>
			<li class="nav-item"><a
				class="nav-link <c:if test='${type==2 }'>active</c:if>"
				href="${pageContext.request.contextPath }/admin/goods_list?type=2">热销推荐</a></li>
			<li class="nav-item"><a
				class="nav-link <c:if test='${type==3 }'>active</c:if>"
				href="${pageContext.request.contextPath }/admin/goods_list?type=3">新品推荐</a></li>
		</ul>
		<br>
		<table class="table table-bordered table-hover">
			<tr>
				<th width="5%">ID</th>
				<th width="10%">图片</th>
				<th width="10%">名称</th>
				<th width="20%">介绍</th>
				<th width="10%">价格</th>
				<th width="10%">类目</th>
				<th width="25%">操作</th>
			</tr>
			<c:forEach items="${p.list }" var="g">
				<tr>
					<td><p>${g.id }</p></td>
					<td><p>
							<a
								href="${pageContext.request.contextPath }/GoodsDetailServlet?id=${g.id}"><img
								src="${pageContext.request.contextPath }${g.cover}"
								width="100px" height="100px"></a>
						</p></td>
					<td><p>
							<a
								href="${pageContext.request.contextPath }/GoodsDetailServlet?id=${g.id}">${g.name}</a>
						</p></td>
					<td><p>${g.intro}</p></td>
					<td><p>${g.price}</p></td>
					<td><p>${g.type.name}</p></td>
					<td><p>
							<c:choose>
								<c:when test="${g.isScroll }">
									<a class="btn btn-info"
										href="${pageContext.request.contextPath }/admin/goods_recommend?id=${g.id }&method=remove&typeTarget=1&pageNo=${p.pageNo}&type=${type}">移出条幅</a>
								</c:when>
								<c:otherwise>
									<a class="btn btn-primary"
										href="${pageContext.request.contextPath }/admin/goods_recommend?id=${g.id }&method=add&typeTarget=1&pageNo=${p.pageNo}&type=${type}">加入条幅</a>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${g.isHot }">
									<a class="btn btn-info"
										href="${pageContext.request.contextPath }/admin/goods_recommend?id=${g.id }&method=remove&typeTarget=2&pageNo=${p.pageNo}&type=${type}">移出热销</a>
								</c:when>
								<c:otherwise>
									<a class="btn btn-primary"
										href="${pageContext.request.contextPath }/admin/goods_recommend?id=${g.id }&method=add&typeTarget=2&pageNo=${p.pageNo}&type=${type}">加入热销</a>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${g.isNew }">
									<a class="btn btn-info"
										href="${pageContext.request.contextPath }/admin/goods_recommend?id=${g.id }&method=remove&typeTarget=3&pageNo=${p.pageNo}&type=${type}">移出新品</a>
								</c:when>
								<c:otherwise>
									<a class="btn btn-primary"
										href="${pageContext.request.contextPath }/admin/goods_recommend?id=${g.id }&method=add&typeTarget=3&pageNo=${p.pageNo}&type=${type}">加入新品</a>
								</c:otherwise>
							</c:choose>
						</p> <a class="btn btn-success"
						href="${pageContext.request.contextPath }/admin/goods_editshow?id=${g.id }&pageNo=${p.pageNo}&type=${type}">修改</a>
						<a class="btn btn-danger"
						href="${pageContext.request.contextPath }/admin/goods_delete?id=${g.id }&pageNo=${p.pageNo}&type=${type}">删除</a>
					</td>
				</tr>
			</c:forEach>

		</table>
		<ul class="pagination justify-content-center">
			<li class="page-item <c:if test='${p.pageNo==1 }'>disabled</c:if>"><a
				class="page-link"
				<c:if test="${p.pageNo!=1 }">href="${pageContext.request.contextPath }/admin/goods_list?pageNo=1&type=${type }"</c:if>>首页</a></li>
			<li class="page-item <c:if test='${p.pageNo==1 }'>disabled</c:if>"><a
				class="page-link"
				<c:if test='${p.pageNo!=1 }'>href="${pageContext.request.contextPath }/admin/goods_list?pageNo=${p.pageNo-1}&type=${type }"</c:if>>上一页</a></li>
			<li class="page-item disabled"><a class="page-link" href="#"
				style="color: red;">第${p.pageNo }页</a></li>
			<li
				class="page-item <c:if test='${p.totalPage==0 || p.pageNo==p.totalPage }'>disabled</c:if>"><a
				class="page-link"
				<c:if test="${p.pageNo!=p.totalPage }">href="${pageContext.request.contextPath }/admin/goods_list?pageNo=${p.pageNo+1}&type=${type }"</c:if>>下一页</a></li>
			<li
				class="page-item <c:if test='${p.totalPage==0 || p.pageNo==p.totalPage }'>disabled</c:if>"><a
				class="page-link"
				<c:if test="${p.pageNo!=p.totalPage }">href="${pageContext.request.contextPath }/admin/goods_list?pageNo=${p.totalPage}&type=${type }"</c:if>>尾页</a></li>
		</ul>
	</div>
	<jsp:include page="/common/footer.jsp" />
</body>
</html>