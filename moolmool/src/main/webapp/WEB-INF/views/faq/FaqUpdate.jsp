<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="container container-top">
	<form:form method="put">
	
		<p class="form-group">
			<label for="title">제목</label> <input class="form-control" type="text"
				name="title" id="title" autocomplete="off" value="${vo.title }">
		</p>
		<p class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content" rows="20">${vo.content }</textarea>
		</p>
		<p class="form-group">
			<input type="submit" value="수정" class="btn btn-default" /> <a
				href="../" class="btn btn-default">취소</a>
		</p>
	</form:form>
</section>