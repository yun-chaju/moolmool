<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<section class="container">
	<div class="btype">
		<c:forEach var="ftype" items="${vo }">
			<label>${ftype.description}</label><br>
			<a href="${pageContext.request.contextPath }/faq/${ftype.fName }" 
					class="btn btn-default">${ftype.fName }</a><br><br><br>
		</c:forEach>
	</div>
</section>