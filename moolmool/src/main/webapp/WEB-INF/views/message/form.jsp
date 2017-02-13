<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/bootstrap-customize.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/moolmool.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<div class="container container-top">
		<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<h4 class="visible-md-block visible-lg-block">
				<strong>&nbsp;</strong>
			</h4>
		</div>
		</div>
		<div class="row">
		<div class="col-md-10">	
		<c:if test="${formType =='message' }">
		<form action="insert" method="POST">
			<label>받는사람</label>
			<input type="text" name="rnick" required="required" class="form-control" readonly value="${param.nickname}">
			<label>제목</label><input type="text" name="title" required="required" class="form-control">
			<label>내용</label>
			<input type="hidden" name="no" value="${param.no }">
			<textarea class="form-control" required="required" name="content" rows="20"></textarea>
			<input class="btn btn-default" type="submit" value="보내기">
			<a href="../mypage/list" class="btn btn-default">취소</a>
		</form>
		</c:if>
		<c:if test="${formType =='reply'}">
		<form action="../reply" method="POST">
			<label>받는사람</label>
			<input type="text" name="rnick" value="${receiver}" readonly="readonly" class="form-control">
			<label>제목</label><input type="text" name="title" required="required" class="form-control">
			<label>내용</label>
			<textarea class="form-control" name="content" rows="20" required="required"></textarea>
			<input class="btn btn-default" type="submit" value="보내기">
			<a href="../mypage/list" class="btn btn-default">취소</a>
		</form>
		</c:if>
	<script >
		if('<c:out value="${ msg}"/>'.length > 0){
			alert('<c:out value="${ msg}"/>');
		}
	</script>
</div>
</div></div>