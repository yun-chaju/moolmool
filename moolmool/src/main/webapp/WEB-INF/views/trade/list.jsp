<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.active a {
	color: #fff;
}

div.r1 {
	padding-top: 39px;
}

span.re-label {
	width: 60px;
}

div.top-padding {
	padding-right: 0px;
	padding-left: 0px;
}

.panel-body {
	box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.3);
	border-radius: 4px;
	padding: 25 20 20 20;
	background-color: fff;
}

table.table-hover tbody {
	border-top: 0px;
}

table.table-hover tbody tr td{
	border-top: 1px solid #f2f2f2;
	border-bottom: 1px solid #f2f2f2;
}

i.material-icons {
	font-size: 34px;
}

.material-icons.md-34 { font-size: 34px; }

/* table.table-hover tbody tr td{
	border-top:0px;
	border-bottom:0px;
} */

</style>
<section class="container container-top">
	<div class="row">
		<div class="col-md-2">
			<div class="container-fluid r1">
				<div class="row">
					<div class="list-group has-shadow">
						<!-- <a href="#" class="list-group-item active">물물교환 페이지 목록</a> -->
						<c:set var="length" value="${fn:length('/moolmool/trade/')}"/>
						<c:set var="uri" value="${fn:length(requestScope['javax.servlet.forward.request_uri'])}"/>
						<c:set var="string" value="${fn:substring(requestScope['javax.servlet.forward.request_uri'], length, uri)}"/>
						<a href="${pageContext.request.contextPath }/trade/all" ${string eq 'all' ? 'class=" list-group-item active"' : 'class=" list-group-item"' }>전체</a>
						<a href="${pageContext.request.contextPath }/trade/swap" ${string eq 'swap' ? 'class=" list-group-item active"' : 'class=" list-group-item"' }>교환</a>
						<a href="${pageContext.request.contextPath }/trade/free" ${string eq 'free' ? 'class=" list-group-item active"' : 'class=" list-group-item"' }>나눔</a>
						<a href="${pageContext.request.contextPath }/trade/wanted" ${string eq 'wanted' ? 'class=" list-group-item active"' : 'class=" list-group-item"' }>구함</a>
					</div>
					<c:if test="${not empty loginUser }">
						<a href="new" type="button" class="btn btn-primary btn-block">게시물 등록</a>
					</c:if>
				</div>
			</div>
		</div>
		<div class="col-md-10">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-2 top-padding">
						<c:if test="${string eq 'all'}" >
							<h4>
								<strong class="visible-md-block visible-lg-block" style="font-size: 16px;">전체</strong>
							</h4>
						</c:if>
						<c:if test="${string eq 'swap'}">
							<h4>
								<strong class="visible-md-block visible-lg-block" style="font-size: 16px;">교환</strong>
							</h4>
						</c:if>
						<c:if test="${string eq 'free'}">
							<h4>
								<strong class="visible-md-block visible-lg-block" style="font-size: 16px;">나눔</strong>
							</h4>
						</c:if>
						<c:if test="${string eq 'wanted'}">
							<h4>
								<strong class="visible-md-block visible-lg-block" style="font-size: 16px;">구함</strong>
							</h4>
						</c:if>
						
					</div>
					<div class="col-md-10 top-padding"></div>
				</div>
				<div class="row">
				<!-- <div class="box"> -->
				<div class="panel panel-default">
				<div class="panel-body">
					<table class="table table-hover">
							<c:forEach var="article" items="${list }">
							<tbody>
							<tr>
								<td style="width:15%;vertical-align: middle;">
									<a href="${article.tno }" class="thumbnail" style="width:150px;height:150px;">
										<c:if test="${not empty article.file1 }">
	      							<img src="../viewImg?fileName=${article.file1 }" alt="물품이미지" style="width:140px;height:140px">
	      						</c:if>
	      						<c:if test="${empty article.file1 }">
	      							<img src="http://placehold.it/140x140" alt="이미지 없음" style="width:140px;height:140px">
	      						</c:if>
	    						</a>
	    					</td>
	    					<td style="padding-top: 14px;">
									<p><a href="${article.tno }">
									<c:if test="${article.tradeType eq 'S'.charAt(0)}">
									<span class="label label-primary">물물</span>
									</c:if>
									<c:if test="${article.tradeType eq 'F'.charAt(0)}">
									<span class="label label-success">나눔</span>
									</c:if>
									<c:if test="${article.tradeType eq 'W'.charAt(0)}">
									<span class="label label-warning">구함</span>
									</c:if>
									<strong>${article.title }</strong></a></p>
									<p/>
									<c:if test="${string eq 'all' ||string eq 'swap'}">
									<p><span style="font-size:14px;color:#999;">예상가:</span> &#8361;&nbsp;<fmt:formatNumber value="${article.price }" type="number"/></p>
									</c:if>
									<c:if test="${string eq 'free' ||string eq 'wanted'}">
									<br>
									</c:if>
									<p>${article.sido}&nbsp;${article.sigugun}&nbsp;${article.dongmyun}&nbsp;${article.addrDetail}<br>${article.roadAddrPart }</p>
									<p/>
									<p><span style="font-size:15px;color:#999;"><fmt:formatDate value="${article.regDate }" pattern="yyyy-MM-dd" /></span></p>
								</td>
								<td style="vertical-align: middle;text-align: center; width:20%">
									${article.pscUrl }
									<p/><p/><p/>
									<p>${article.writerNickname}</p>
								</td>
								</tr>
								</tbody>
							</c:forEach>
					</table>
					</div>
					</div>
				</div>
				<!-- 거래시스템 페이징 처리 -->
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
							<li ${page eq param.page or (param.page eq null and page eq 1) ? "class='active'":"" }>
								<a <c:if test="${!(page eq param.page or (param.page eq null and page eq 1)) }">
									href='${queryInfo.makeQuery(page, param.sType, param.sKeyword) }'
								</c:if>>${page }</a>
							</li>
						</c:forEach>
						<li ${pageInfo.hasNext ? "":"class='disabled'"}>
							<a <c:if test="${pageInfo.hasNext }"> href="${queryInfo.makeQuery(pageInfo.endPage + 1, param.sType, param.sKeyword) }"</c:if>
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</section>