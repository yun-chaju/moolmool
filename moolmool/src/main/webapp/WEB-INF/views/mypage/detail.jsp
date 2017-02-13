<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<section class="container container-top">
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
							<a href="${ pageContext.request.contextPath }/mypage/myBoard" class="list-group-item">내 게시글</a>
<!-- 							<a href="#" class="list-group-item">찜 목록</a>
							<a href="#" class="list-group-item">물물교환 목록</a> -->
							<p>	
						</div>
						<div class="list-group has-shadow">
							<a href="${pageContext.request.contextPath }/mypage/list/receive" class="list-group-item">받은 쪽지</a>
							<a href="${pageContext.request.contextPath }/mypage/list/send" class="list-group-item">보낸 쪽지</a>
							<a href="${pageContext.request.contextPath }/mypage/list/insert" class="list-group-item">쪽지 보내기</a>
						</div>
					</div>
				</div>
			</div>
		
		<div class="col-md-10">
				<div class="row">
						
				</div>
				<div class="panel panel-default">
			<div class="panel-heading">
			<div style="float:right; display:flex">
						<a href='<c:if test="${msg.sno != check }">receive</c:if><c:if test="${msg.sno == check }">send</c:if>' class="btn btn-default btn-md glyphicon glyphicon-list"></a>
						<form:form method="delete" action="${msg.mno}" cssClass="inline-form">
							<input type="submit" value="삭제" class="btn btn-default btn-md glyphicon glyphicon-trash
							"></form:form>
						<c:if test="${check != msg.sno}">
						<a href="${msg.mno}/reply/${msg.snick}" class="btn btn-default btn-md glyphicon glyphicon-envelope"></a>
						</c:if>
					</div>
			
			<c:if test="${msg.sno != check }">
			<label>보낸사람 &nbsp;${msg.snick}(${msg.sid})</label>
			</c:if>	
			<c:if test="${msg.sno == check }">
			<label>받는사람 &nbsp;${msg.rnick}(${msg.rid})</label>
			</c:if>
			<br>
			<label>받은시간 &nbsp;<fmt:formatDate type="both" timeStyle="short" value="${msg.sendDate }"/></label>
			
			</div>
			<div class="panel-body">
			${msg.title}<br>
			${msg.content}</div>
				</div>
			</div>
</div>
	
	<script type="text/javascript">

	</script>
</section>