<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.active a{
		color: #fff;
	}
	span.re-label{
		width: 60px;
	}
	div.top-padding{
			padding-right:0px;
			padding-left:0px;
	}
</style>

<section class="container container-top">
	<div class="row">
		<div class="col-md-2">
			<div class="container-fluid sidemenu-top">
				<div class="row">
					<div class="list-group has-shadow">
						<a href="${pageContext.request.contextPath }/notice/list" class="list-group-item text-center">
							공지사항
						</a>
						<a href="${pageContext.request.contextPath }/faq" class="list-group-item text-center">
							FAQ
						</a>
						<a href="${pageContext.request.contextPath }/qna/list" class="list-group-item text-center active">
							Q&amp;A
						</a>
					</div>
				</div>
				<div class="row">
					<a href="new" style="display:block;" class="btn btn-primary" role="button">문의글 쓰기</a>	
				</div>
			</div>
		</div>
		<div class="col-md-10">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-2 top-padding">
						<h4><strong class="visible-md-block visible-lg-block">Q&amp;A</strong></h4>
					</div>
					<div class="col-md-10 top-padding">
					<form action="" class="form-inline">
						<div class="from-group pull-right">
							<select name="sType" class="form-control">
								<option value="a">전체
								<option value="tc">제목+내용
								<option value="t">제목
								<option value="c">내용
								<option value="w">닉네임
							</select>
							<input type="hidden" name="page" value="1">
							<input type="text" name="sKeyword" class="form-control">
							<input type="submit" value="검색" class="btn btn-primary">
						</div>
					</form>
					</div>
				</div>
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-body table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="col-md-1 text-center">번호</th>
										<th class="col-md-1 text-center"><span class="glyphicon glyphicon-lock"></span></th>
										<th class="col-md-5 text-center">제목</th>
										<th class="col-md-1 text-center"></th>
										<th class="col-md-2 text-center">작성자</th>
										<th class="col-md-2 text-center">날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="qnaArticle" items="${ questionList }">
									<tr>
										<td class="text-center">${ qnaArticle.qno }</td>
										<td class="text-center">
											<c:if test="${ qnaArticle.isPrivate eq 'Y'.charAt(0) }">
												<span class="glyphicon glyphicon-lock"></span>
											</c:if>
										</td>
										<td>
										<c:choose>
											<c:when test="${ loginUser.memNo eq qnaArticle.writerNo || loginUser.roleCode eq 'ROLE_ADMIN' }">	
												<a href="${ qnaArticle.qno }">${ qnaArticle.title }</a>	
											</c:when>
											<c:otherwise>
												<c:if test="${ qnaArticle.isPrivate eq 'Y'.charAt(0) }">
													${ qnaArticle.title }
												</c:if>
												<c:if test="${ qnaArticle.isPrivate eq 'N'.charAt(0) }">
													<a href="${ qnaArticle.qno }">${ qnaArticle.title }</a>
												</c:if>
											</c:otherwise>
										</c:choose>
										</td>
										<td class="text-center">
											<span class="re-label ${qnaArticle.reply == 'Y'.charAt(0) ? 'label label-primary' : 'label label-warning' }">
												${qnaArticle.reply == 'Y'.charAt(0) ? '답변완료' : '대기중' }
											</span>
										</td>
										<td class="text-center">${ qnaArticle.writerNickname }</td>
										<td class="text-center">${ qnaArticle.regDate }</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<nav class="text-center">
					<ul class="pagination">
						<li ${pageInfo.hasPrev ? "":"class='disabled'"}>
							<a <c:if test="${pageInfo.hasPrev }">
								href="${queryInfo.makeQuery(pageInfo.startPage - 1, param.sType, param.sKeyword) }"</c:if>
								 aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<c:forEach var="page" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
							<li ${page eq param.page or (param.page eq null and page eq 1) ? "class='active'":"" }>
								<a <c:if test="${!(page eq param.page or (param.page eq null and page eq 1)) }">
									href='${queryInfo.makeQuery(page, param.sType, param.sKeyword) }'
								</c:if>>${page }</a>
							</li>
						</c:forEach>
						<li  ${pageInfo.hasNext ? "":"class='disabled'"}>
							<a <c:if test="${pageInfo.hasNext }">
								href="${queryInfo.makeQuery(pageInfo.endPage + 1, param.sType, param.sKeyword) }"</c:if> 
									aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	
</section> 