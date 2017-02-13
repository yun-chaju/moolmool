<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul {
	list-style-type: none;
	padding-left: 0px;
}

#noticeList {
	box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.3);
	/* margin-top: 20px; */
}

#noticeTitleAll {
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.1);
}

#noticeCategory {
	font-size: 13px;
}

#noticeTitleAll #noticeTitle {
	font-size: 15px;
	color: #444;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.overflow {
	display: inline-block;
	width: 70%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.regdate {
	font-size: 14px;
	float: right;
}

#noticeContent {
	font-size: 15px;
	display: none;
	border-bottom: 1px solid #F2F2F2;
	padding: 40 20 40 20;
}

.material-icons {
	vertical-align: middle;
	display: inline-block;
}

.material {
	vertical-align: middle;
	display: inline-block;
}
</style>
<script>
/* 마우스 클릭 이벤트 처리 스크립트 */
	$(function() {
		$("div.content li:even").on("click", function() {
			if (!($(this).next().hasClass("open"))) {
				$(this).next().show();
				$(this).next().addClass("open");
			} else {
				$(this).next().hide();
				$(this).next().removeClass("open");
			}
		});
	});
</script>
</head>
<body>
	<section class="container container-top">
		<div class="row">
		<!-- 좌측 메뉴 영역 -->
			<div class="col-md-2">
				<div class="container-fluid sidemenu-top">
					<div class="row">
						<div class="list-group has-shadow">
							<a class="list-group-item text-center active"
								href="${pageContext.request.contextPath }/notice/list"> 공지사항
							</a> <a class="list-group-item text-center"
								href="${pageContext.request.contextPath }/faq"> FAQ </a> <a
								class="list-group-item text-center"
								href="${pageContext.request.contextPath }/qna/list"> Q&amp;A
							</a>
						</div>
						<c:if test="${loginUser.id == 'admin' }">
							<a href="new" type="button" class="btn btn-primary btn-block" style="margin-bottom: 20px">공지사항
								등록</a>
						</c:if>
					</div>
				</div>
			</div>
			<!-- 공지사항 내용 영역 -->
			<div class="col-md-10">
				<h4 class="visible-md-block visible-lg-block" style="font-size: 16px;">
					<strong style="color: #444">공지사항</strong>
				</h4>
				<div class="content">
					<ul class="panel panel-default" id="noticeList">
						<c:forEach items="${noticeItemList}" var="notice">
						<!-- 카테고리에 따른 라벨 설정 -->
							<c:if test="${notice.category eq '공지' }">
								<li class="panel-body" id="noticeTitleAll"><div
										class="overflow">
										<span class="label label-primary" id="noticeCategory"
											style="padding-left: 13.5; padding-right: 13.5">${notice.category}</span>
										&nbsp; <span id="noticeTitle"><strong>${notice.title}</strong></span>
									</div>
							</c:if>
							<c:if test="${notice.category eq '이벤트' }">
								<li class="panel-body" id="noticeTitleAll"><div
										class="overflow">
										<span class="label label-warning" id="noticeCategory">${notice.category}</span>
										&nbsp; <span id="noticeTitle"><strong>${notice.title}</strong></span>
									</div>
							</c:if>
							<!-- 등록일 -->
							<span class="regdate">${notice.regDate}</span>
							<li class="panel-body" id="noticeContent">${notice.content }
							<!-- 유저가 관리자일 때 삭제/수정 버튼 출력 -->
								<c:if test="${loginUser.id == 'admin' }">
									<br>
									<br>
									<form:form method="delete" action="${notice.nNo}"
										cssClass="inline-form">
										<input type="submit" value="삭제" class="btn btn-danger btn-sm">
										<a href="${notice.nNo}/edit" class="btn btn-default btn-sm">수정</a>
									</form:form>
								</c:if>
							</li>
						</c:forEach>
					</ul>
				</div>
				<!-- 공지사항 페이징 처리 -->
				<nav class="text-center">
					<ul class="pagination">
						<li ${pageInfo.hasPrev ? "":"class='disabled'"}><a
							<c:if test="${pageInfo.hasPrev }">
								href="${queryInfo.makeQuery(pageInfo.startPage - 1, param.sType, param.sKeyword) }"
								</c:if>
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach var="page" begin="${pageInfo.startPage }"
							end="${pageInfo.endPage }">
							<li
								${page eq param.page or (param.page eq null and page eq 1) ? "class='active'":"" }>
								<a
								<c:if test="${!(page eq param.page or (param.page eq null and page eq 1)) }">
									href='${queryInfo.makeQuery(page, param.sType, param.sKeyword) }'
								</c:if>>${page }</a>
							</li>
						</c:forEach>
						<li ${pageInfo.hasNext ? "":"class='disabled'"}><a
							<c:if test="${pageInfo.hasNext }">
								href="${queryInfo.makeQuery(pageInfo.endPage + 1, param.sType, param.sKeyword) }"</c:if>
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<%-- 
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<h4 class="visible-md-block visible-lg-block">
					<strong style="color: #444">공지사항</strong>
				</h4>
			</div>

			<div class="col-md-2">
				<div class="list-group has-shadow">
					<a class="list-group-item text-center active"
						href="${pageContext.request.contextPath }/notice/list"> 공지사항 </a>
					<a class="list-group-item text-center"
						href="${pageContext.request.contextPath }/faq"> FAQ </a> <a
						class="list-group-item text-center"
						href="${pageContext.request.contextPath }/qna/list"> Q&amp;A </a>
				</div>
				<c:if test="${loginUser.id == 'admin' }">
					<a href="new" type="button" class="btn btn-primary btn-block">공지사항
						등록</a>
				</c:if>
			</div>
			<div class="col-md-10">
				<div class="content">
					<ul class="panel panel-default" id="noticeList">
						<c:forEach items="${NoticeList}" var="notice">
							<li class="panel-body" id="noticeTitleAll"><span
								class="label label-primary" id="noticeCategory">${notice.category}</span>&nbsp;
								<span id="noticeTitle"><strong>${notice.title}</strong></span> <span
								class="regdate">${notice.regDate}</span></li>
							<c:if test="${notice.nNo == NoticeListSize}">
								<li class="panel-body" id="noticeContent"
									style="display: list-item;">${notice.content }<c:if
										test="${loginUser.id == 'admin' }">
										<br>
										<br>
										<form:form method="delete" action="${notice.nNo}"
											cssClass="inline-form">
											<input type="submit" value="삭제" class="btn btn-danger btn-sm">
											<a href="${notice.nNo}/edit" class="btn btn-default btn-sm">수정</a>
										</form:form>
									</c:if>
								</li>
							</c:if>
							<c:if test="${notice.nNo != NoticeListSize }">
								<li class="panel-body" id="noticeContent">${notice.content }
									<c:if test="${loginUser.id == 'admin' }">
										<br>
										<br>
										<form:form method="delete" action="${notice.nNo}"
											cssClass="inline-form">
											<input type="submit" value="삭제" class="btn btn-danger btn-sm">
											<a href="${notice.nNo}/edit" class="btn btn-default btn-sm">수정</a>
										</form:form>
									</c:if>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div> --%>
	</section>
</body>
</html>