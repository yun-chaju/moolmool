<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<head>
<style>
.active a {
	color: #fff;
}

ul {
	list-style-type: none;
	padding-left: 0px;
}

#faqList {
	box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.3);
	/* margin-top: 20px; */
}

#faqTitleAll {
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.1);
}

#faqCategory {
	font-size: 13px;
}

#faqTitle {
	font-size: 15px;
	color: #444;
}

.regdate {
	font-size: 14px;
	float: right;
}

#faqContent {
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
			<!-- 좌측 메뉴 영역 시작 -->
			<div class="col-md-2">
				<div class="container-fluid sidemenu-top">
					<div class="row">
						<div class="list-group has-shadow">
							<a href="${pageContext.request.contextPath }/notice/list"
								class="list-group-item text-center"> 공지사항 </a> <a
								href="${pageContext.request.contextPath }/faq"
								class="list-group-item text-center active"> FAQ </a> <a
								href="${pageContext.request.contextPath }/qna/list"
								class="list-group-item text-center"> Q&amp;A </a>
						</div>
					</div>
				</div>
			</div>
			<!-- 좌측 메뉴 영역 끝 -->
			<div class="col-md-10">
				<h4 class="visible-md-block visible-lg-block">
					<strong style="color: #444">FAQ</strong>
				</h4>
				<!-- 우측 상단 필터 영역 시작 -->
				<div class="ftype">
					<c:set var="length" value="${fn:length('/moolmool/faq/')}" />
					<c:set var="uri" value="${fn:length(requestScope['javax.servlet.forward.request_uri'])}" />
					<c:set var="string" value="${fn:substring(requestScope['javax.servlet.forward.request_uri'], length, uri)}" />
					<ul class="nav nav-tabs">
						<li ${string eq '' ? 'class="active"' : '' }><a href="${pageContext.request.contextPath}/faq/">전체보기</a></li>
						<c:forEach var="ftype" items="${type}">
							<li ${string eq ftype.fName ? 'class="active"' : '' }><a href="${pageContext.request.contextPath }/faq/${ftype.fName}">${ftype.description}</a></li>
						</c:forEach>
					</ul>
				</div>
				<!-- 우측 상단 필터 영역 끝 -->
				<!-- 우측 내용 영역 시작 -->
				<div class="content">
					<div>
						<ul class="panel panel-default" id="faqList">
							<c:forEach items="${vo}" var="faq">
								<li class="panel-body" id="faqTitleAll"><span
									class="label label-primary" id="faqCategory">${faq.description}</span>&nbsp;
									<span id="faqTitle"><strong>${faq.title}</strong></span> <span
									class="regdate">${faq.regDate}</span></li>
								<li class="panel-body" id="faqContent">${faq.content}<c:if
										test="${loginUser.id == 'admin'}">
										<br>
										<br>
										<form:form method="get" action="${fname }/${faq.fNo}"
											cssClass="inline-form">
											<input type="submit" value="삭제"
												class="btn btn-danger btn-sm">
											<a href="${fname }/${faq.fNo}/edit" class="btn btn-default btn-sm">수정</a>
										</form:form>
									</c:if>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
					<c:if test="${loginUser.id == 'admin'}">
						<c:if test="${fname ne '전체보기' }">
							<form:form action="${fname }/new" method="get">
								<input type="submit" value="등록" class="btn btn-default btn-sm">
							</form:form>
						</c:if>
					</c:if>
			</div>
			
		</div>
	</section>
</body>