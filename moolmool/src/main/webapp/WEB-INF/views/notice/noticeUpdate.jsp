<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<Section class="container container-top">
	<h4><strong>공지사항</strong></h4>
	<form:form action="" method="put">
		<div class="form-group">
			<input class="form-control" type="text" name="title" id="title" placeholder="제목을 작성해 주세요" value="${noticeDetail.title }">
		</div>
		<div class="form-group">
			<textarea class="form-control" name="content" id="content" rows="20" placeholder="내용을 작성해 주세요" style="resize:none;" required="required">${noticeDetail.content}</textarea>	
		</div> 
		<div class="form-group text-center">
			<input type="submit" value="등록" class="btn btn-primary"/>&nbsp;&nbsp;
			<input type="button" value="뒤로" class="btn btn-default" onclick="history.back()" />
		</div>
	</form:form>
</Section>
</body>
</html>