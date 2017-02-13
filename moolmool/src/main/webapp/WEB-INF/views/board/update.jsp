<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>
<section class="container container-top">
	<form:form method="put" commandName="boardVO">
		<p class="form-group">
			<form:label path="title">제목</form:label>
			<form:input path="title" autocomplete="off" cssClass="form-control" cssErrorClass="form-control has-error" />
		</p>
		<p class="form-group">
			<form:label path="content">내용</form:label>
			<form:textarea path="content" rows="20" cssClass="form-control" cssErrorClass="form-control has-error" />
		</p>
		<script type="text/javascript">
			CKEDITOR.replace( 'content' );			
			CKEDITOR.config.contentsCss = 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css';
		</script>
		<p class="form-group">
			<input type="submit" value="수정" class="btn btn-primary" /> 
			<a href="../${boardVO.bno }" class="btn btn-default">취소</a>
		</p>
	</form:form>
</section>