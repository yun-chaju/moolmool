<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	.is-shadow {
		-webkit-box-shadow: 0 4px 6px -4px #222;
		box-shadow: 0 4px 6px -4px #222;
	}
</style>
<!DOCTYPE html>
<header>
	<nav class="navbar navbar-fixed-top is-shadow ${ path eq 'index' ? 'is-transparent' : '' }">
	    <div class="navbar-header">
			<a class="navbar-brand" href="<%=request.getContextPath()%>"><img src="${pageContext.request.contextPath }/resources/images/moolmool_logo_round.svg" style="width:180"></a>
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar1">
		    <span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		    </button>
	    </div>
	    <div class="collapse navbar-collapse navbar-right" id="navbar1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.request.contextPath }/map">물물지도</a></li>
					<li><a href="${pageContext.request.contextPath }/trade/all">물물교환</a></li>
					<li><a href="${pageContext.request.contextPath }/shop">물물상점</a></li>
					<li><a href="${pageContext.request.contextPath }/board">커뮤니티</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">고객센터
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="${pageContext.request.contextPath }/notice/list">공지사항</a></li>
							<li><a href="${pageContext.request.contextPath }/faq">FAQ</a></li>
							<li><a href="${pageContext.request.contextPath }/qna/list">Q&amp;A</a></li>
						</ul></li>
					<c:if test="${loginUser eq null}">
						<li><a href="${pageContext.request.contextPath }/member/memberLogin">로그인</a></li>
					</c:if>
					<c:if test="${loginUser ne null}">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">
								${loginUser.nickName}님 <span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<c:if test="${loginUser.roleCode eq 'ROLE_ADMIN' }">
									<li><a href="${pageContext.request.contextPath }/admin">관리자페이지</a></li>
								</c:if>
								<c:if test="${loginUser.roleCode eq 'ROLE_USER' }">
									<li><a href="${pageContext.request.contextPath }/mypage">마이페이지</a></li>
								</c:if>
								<li><a href="${pageContext.request.contextPath }/member/logout">로그아웃</a></li>
								<li><a href="${pageContext.request.contextPath }/member/update">정보수정</a></li>
								<li><a href="${pageContext.request.contextPath }/member/leave">탈퇴하기</a></li>
							</ul>
					</c:if>
				</ul>
			</div>
	</nav>
</header>