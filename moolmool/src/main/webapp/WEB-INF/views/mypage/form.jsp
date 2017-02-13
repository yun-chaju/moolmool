<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<div class="col-md-2">
		
			<div class="container-fluid r1">
				<div class="row">
					<div class="list-group has-shadow">
							<a href="${pageContext.request.contextPath }/mypage" class="list-group-item">내 정보 보기</a>
							<a href="${ pageContext.request.contextPath }/mypage/myBoard"  class="list-group-item">내 게시글</a>
<!-- 							<a href="#" class="list-group-item">찜 목록</a>
							<a href="#" class="list-group-item">물물교환 목록</a> -->
							<p>	
						</div>
						<div class="list-group has-shadow">
							<a href="${pageContext.request.contextPath }/mypage/list/receive" class="list-group-item">받은 쪽지</a>
							<a href="${pageContext.request.contextPath }/mypage/list/send" class="list-group-item">보낸 쪽지</a>
							<a href="${pageContext.request.contextPath }/mypage/list/insert" class="list-group-item active">쪽지 보내기</a>
						</div>
					</div>
				</div>
			</div>
				<div class="col-md-10">	
		<c:if test="${formType =='message' }">
		<form action="insert" method="POST">
			<label>받는사람</label>
			<input type="text" name="rnick" required="required" class="form-control" placeholder="닉네임을 입력하세요">
			<label>제목</label><input type="text" name="title" required="required" class="form-control">
			<label>내용</label>
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