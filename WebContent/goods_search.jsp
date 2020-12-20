<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>商品搜索</title>
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
	<div class="container">
		<h2>搜索 ‘${param.keyword }’的结果</h2>
		<div class="row row-cols-1 row-cols-4">
			<c:forEach items="${p.list}" var="item">
				<div class="col-3" style="margin-top: 30px;">
					<div class="card border-primary">
						<img src="${pageContext.request.contextPath}${item.cover}"
							class="card-img-top img-fluid" alt="">
						<div class="card-body text-center">
							<h3 class="card-text">${item.name }</h3>
							<h4 class="card-text">${item.price }元</h4>
							<a
								href="${pageContext.request.contextPath }/GoodsDetailServlet?id=${item.id}">查看</a>&nbsp;&nbsp;<a
								href="#" onclick="buy(${item.id})">加入购物车</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<br />
		<ul class="pagination justify-content-center">
			<li class="page-item <c:if test='${p.pageNo==1 }'>disabled</c:if>"><a
				class="page-link"
				<c:if test="${p.pageNo!=1 }">href="${pageContext.request.contextPath }/GoodsSearchServlet?pageNo=1&keyword=${keyword}"</c:if>>首页</a></li>
			<li class="page-item <c:if test='${p.pageNo==1 }'>disabled</c:if>"><a
				class="page-link"
				<c:if test='${p.pageNo!=1 }'>href="${pageContext.request.contextPath }/GoodsSearchServlet?pageNo=${p.pageNo-1}&keyword=${keyword}"</c:if>>上一页</a></li>
			<li class="page-item disabled"><a class="page-link" href="#"
				style="color: red;">第${p.pageNo }页</a></li>
			<li
				class="page-item <c:if test='${p.totalPage==0 || p.pageNo==p.totalPage }'>disabled</c:if>"><a
				class="page-link"
				<c:if test="${p.pageNo!=p.totalPage }">href="${pageContext.request.contextPath }/GoodsSearchServlet?pageNo=${p.pageNo+1}&keyword=${keyword}"</c:if>>下一页</a></li>
			<li
				class="page-item <c:if test='${p.totalPage==0 || p.pageNo==p.totalPage }'>disabled</c:if>"><a
				class="page-link"
				<c:if test="${p.pageNo!=p.totalPage }">href="${pageContext.request.contextPath }/GoodsSearchServlet?pageNo=${p.totalPage}&keyword=${keyword}"</c:if>>尾页</a></li>
		</ul>
	</div>
	<br />
	<jsp:include page="/common/footer.jsp" />
</body>
</html>