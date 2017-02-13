<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h4 {
	padding-left: 10;
}
</style>
</head>
<body>
	<Section class="container container-top">
		<h4>
			<strong>공지사항</strong>
		</h4>
			<form action="new" method="post">
			<!-- notice 카테고리 설정 -->
				<div class="col-md-2">
					<div class="dropdown">
						<div class="form-group">
							<select class="form-control" id="category" name="category">
								<option value="공지">공지</option>
								<option value="이벤트">이벤트</option>
							</select>
						</div>
					</div>
				</div>
				<!-- notice 제목 -->
				<div class="col-md-10">
					<div class="form-group">
						<input class="form-control" type="text" name="title" id="title"
							placeholder="제목을 작성해 주세요" autofocus>
					</div>
				</div>
				<!-- notice 내용 -->
				<div class="col-md-12">
					<div class="form-group">
						<textarea class="form-control" name="content" id="content"
							rows="20" placeholder="내용을 작성해 주세요" style="resize: none;"
							required="required"></textarea>
					</div>
					<!-- 등록, 뒤로가기 버튼 -->
					<div class="form-group text-center">
						<input type="submit" value="등록" class="btn btn-primary" />&nbsp;&nbsp;
						<input type="button" value="뒤로" class="btn btn-default"
							onclick="history.back()" />
					</div>
				</div>
			</form>
		
	</Section>
</body>
</html>