<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	/* 	a:link, a:visited {
		color: black;
	} */
	a:hover, a:active, a:focus {
		text-decoration: none;
	}
	.table-condensed {
		table-layout:fixed;
	}
	.table-condensed td {
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
	}
	.list-group-item {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
	}
</style>
<section class="container container-top">

	<div class="col-md-12">
		<h4 class="visible-md-block visible-lg-block">
			<strong>&nbsp;</strong>
		</h4>
	</div>
	
	<div class="row">
		<c:forEach var="btList" items="${btypeList }" varStatus="index">
				<div class="article col-md-4">
				<div class="list-group has-shadow">
					<c:if test="${btList.btCode ne 'new'}">
						<a href="board/${btList.btCode }" class="list-group-item active">${btList.btName += ' 게시판' }<span class="pull-right">+</span></a>
					</c:if>
					<c:if test="${btList.btCode eq 'new'}">
						<a class="list-group-item active">${btList.btName }</a>
					</c:if>
					<c:forEach var="board" items="${boardList }" varStatus="stat">
						<c:if test="${btList.btCode eq board.btCode}">
							<a href="board/${board.btCode}/${board.bno}" class="list-group-item">${board.title }</a>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</c:forEach>
	</div>
</section>