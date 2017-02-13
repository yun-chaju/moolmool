<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="container container-top">
	<h4><strong>Q&amp;A</strong></h4>
	<div class="panel panel-default">
		<div class="panel-body">
			<table class="table">
				<thead>
					<tr>
						<th class="col-md-1">${ qnaArticle.qno }</th>
						<th class="col-md-1"><c:if test="${ qnaArticle.isPrivate eq 'Y'.charAt(0) }">
								<span class="glyphicon glyphicon-lock"></span>
							</c:if></th>
						<th class="col-md-6"><span>${ qnaArticle.title }</span> <span
							class="re-label pull-right ${qnaArticle.reply == 'Y'.charAt(0) ? 'label label-primary' : 'label label-warning' }">
								${qnaArticle.reply == 'Y'.charAt(0) ? '답변완료' : '대기중' } </span></th>
						<th class="col-md-2">${ qnaArticle.writerNickname }</th>
						<th class="col-md-2">${ qnaArticle.regDate }</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="6"><br> ${ qnaArticle.content }<br></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<form action="../${ qnaArticle.qno }/answer" method="post">
		<div class="form-group">
			<textarea class="form-control" name="content" id="content" rows="10"
					required="required" style="resize: none;"></textarea>
		</div>
		<div class="form-group text-center">
			<input type="submit" value="답글등록" class="btn btn-primary"> &nbsp;&nbsp;
			<a href="javascript:history.back()" class="btn btn-default">뒤로가기</a>
		</div>
	</form>
</section>