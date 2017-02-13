<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="${ pageContext.request.contextPath }/resources/css/fontawesome-stars.css" rel="stylesheet"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<script src="${ pageContext.request.contextPath }/resources/js/jquery.barrating.min.js"></script>
<script type="text/javascript">
   $(function() {
      $('#starRating').barrating({
        theme: 'fontawesome-stars'
      });
   });
</script>
<style>
	.inline-form {
		display: inline-block;
	}
	.active a{
		color: #fff;
	}
	div.r1{
		padding-top: 39px;
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
			<div class="container-fluid r1">
				<div class="row">
					<ul class="list-group">
						<li class="list-group-item text-center">
							<a href="${pageContext.request.contextPath }/notice">
								공지사항
							</a>
						</li>
						<li class="list-group-item text-center">
							<a href="${pageContext.request.contextPath }/faq">
								FAQ
							</a>
						</li>
						<li class="list-group-item text-center active">
							<a href="${pageContext.request.contextPath }/qna/list">
								Q&amp;A
							</a>
						</li>
					</ul>
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
						<h4><strong>Q&amp;A</strong></h4>
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
						<div class="panel-body">
							<table class="table">
								<thead>
									<tr>
										<th class="col-md-1">${ qnaArticle.qno }</th>
										<th class="col-md-1">
											<c:if test="${ qnaArticle.isPrivate eq 'Y'.charAt(0) }">
												<span class="glyphicon glyphicon-lock"></span>
											</c:if>
										</th>
										<th class="col-md-6">
										<span>${ qnaArticle.title }</span>
										<span class="re-label pull-right ${qnaArticle.reply == 'Y'.charAt(0) ? 'label label-primary' : 'label label-warning' }">
											${qnaArticle.reply == 'Y'.charAt(0) ? '답변완료' : '대기중' }
										</span>
										</th>
										<th class="col-md-2">${ qnaArticle.writerNickname }</th>
										<th class="col-md-2">${ qnaArticle.regDate }</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="6"><br>
											${ qnaArticle.content }<br>
										</td>
									</tr>
								</tbody>
							</table>
							<c:if test="${ loginUser.roleCode eq 'ROLE_ADMIN' && empty answerVO }">
								<span class="pull-right"><a href="${ qnaArticle.qno }/answer" class="btn btn-primary">답글</a></span>
							</c:if>
						</div>
					</div>
				</div>
				<c:if test="${ !empty answerVO }">
					<div class="row">
						<div class="panel panel-default">
							<div class="panel-body">
								${ answerVO.adminNickname } <c:if test="${ answerVO.isEvaluated eq 'Y'.charAt(0) }"><label class="label label-primary">관리자 답변 평가완료</label></c:if>
								<span class="pull-right">${ answerVO.modDate }</span>
								<hr>
								${ answerVO.content }<br>
								<c:if test="${ loginUser.roleCode eq 'ROLE_ADMIN' }">
									<span class="pull-right"><a href="${ qnaArticle.qno }/answer/edit" class="btn btn-primary">수정</a></span>
								</c:if>
							</div>
						</div>	
					</div>
				</c:if>
				<c:if test="${ qnaArticle.writerNo eq loginUser.memNo && qnaArticle.reply eq 'Y'.charAt(0) && answerVO.isEvaluated eq 'N'.charAt(0)}">
					<div class="row">
						<div class="panel panel-default">
							<div class="panel-body">
								<label>답변에 대해 얼마나 만족하셨나요?</label>
								<form action="${ qnaArticle.qno }/new" method="post">
								<input type="hidden" name="ano" value="${ answerVO.ano }" >
								<div style="display:flex;">
									<label for="starRating">별점 : </label>&nbsp;&nbsp;
									<select id="starRating" name="rate">
									  <option value="1">1</option>
									  <option value="2">2</option>
									  <option value="3">3</option>
									  <option value="4">4</option>
									  <option value="5">5</option>
									</select>
								</div>
									<textarea class="form-control" name="opinion" id="opinion" rows="5" placeholder="답변에 대한 의견을 작성해주세요!" style="resize:none;" required="required"></textarea>
									<br>
									<span class="pull-right"><input type="submit" value="확인" class="btn btn-default"></span>
								</form>
							</div>
						</div>
					</div>
				</c:if>
				<div class="row">
					<div class="text-center">
						<a href="${ pageContext.request.contextPath }/qna/list" class="btn btn-default">목록</a>&nbsp;&nbsp;
						<c:if test="${qnaArticle.writerNo eq loginUser.memNo || loginUser.roleCode eq 'ROLE_ADMIN' }">
							<form:form method="delete" action="${ qnaArticle.qno }" cssClass="inline-form" >
								<input type="submit" value="삭제" class="btn btn-danger" >
								&nbsp;&nbsp;
							</form:form>
							<a href="${ qnaArticle.qno }/edit" class="btn btn-primary">수정</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>