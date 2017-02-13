<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
</head>
<body>
<Section class="container container-top">
	<h4><strong>Q&amp;A</strong></h4>
	<form action="new" method="post">
		<div class="form-group">
			<input class="form-control" type="text" name="title" id="title" placeholder="[Q&A] 제목을 작성해 주세요" >
		</div>
		<div class="form-group">
			<textarea class="form-control" name="content" id="content" rows="20" placeholder="[Q&A] 질문을 작성해 주세요" style="resize:none;" required="required"></textarea>	
		</div>
		<label>
			<input type="checkbox" name="isPrivate" id="isPrivate"> 비공개
		</label>
		<div class="form-group text-center">
			<input type="submit" value="등록" class="btn btn-primary"/>&nbsp;&nbsp;
			<input type="button" value="뒤로" class="btn btn-default" onclick="history.back()" />
		</div>
	</form>
</Section>
</body>
</html>