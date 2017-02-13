<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy/MM/dd" var="today"/>
<style>
	.active a{
		color: #fff;
	}
	.form-inline {
		display: inline-block;	
	}
	.material-icons {
		vertical-align: middle;
		display: inline-block;
	}
	.material {
		vertical-align: middle;
		display: inline-block;
	}
	td.text-center a {
		vertical-align: middle;
		display: inline-block;
	}
	td.title {
    max-width: 0;
    width: 30%;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
	}
	a, a:link, a:hover, a:active, a:focus {
		color: #333;
	}
.material-icons.md-18 { font-size: 18px; }
.material-icons.md-24 { font-size: 24px; }
.material-icons.md-36 { font-size: 36px; }
.material-icons.md-48 { font-size: 48px; }
</style>

<c:forEach var="boardType" items="${btypeList }">
	<c:if test="${btCode eq boardType.btCode }">
		<c:set var="activatedBT" value="${boardType.btName }" />
	</c:if>
</c:forEach>

<section class="container container-top">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<h4 class="visible-md-block visible-lg-block">
				<strong>${activatedBT += '게시판'}</strong>
			</h4>
		</div>
		<div class="col-md-2">
			<div class="list-group has-shadow">
				<c:forEach var="boardType" items="${btypeList }">
					<a href="${pageContext.request.contextPath }/board/${boardType.btCode }" class="list-group-item text-center ${btCode eq boardType.btCode ? 'active' : '' }">
						${boardType.btName }
					</a>
				</c:forEach>
			</div>
		</div>
		<div class="col-md-10">
			<div class="panel panel-default has-shadow">
				<div class="panel-body table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="text-center">번호</th>
								<th class="text-center">제목</th>
								<th class="text-center">작성자</th>
								<th class="text-center">날짜</th>
								<th class="text-center">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="boardArticle" items="${boardList }">
							<fmt:formatDate value="${boardArticle.regDate }" pattern="yyyy/MM/dd" var="regdate"/>
							<tr>
								<td class="text-center">${boardArticle.pno }</td>
								<td class="title"><a href="${btCode }/${boardArticle.bno }
											${queryInfo.makeQuery(param.page, param.sType, param.sKeyword) }" class="title">
											<c:out value="${boardArticle.title }" />
									<span class="badge">${boardArticle.cmtCount != 0 ? boardArticle.cmtCount : '' }</span></a></td>
								<td class="text-center">
									<a href="#" ${not empty loginUser and loginUser.memNo ne boardArticle.writerNo ? 'data-toggle="popover"': '' } title="${boardArticle.writerNickname}" data-trigger="focus" data-nickname="${boardArticle.writerNickname }" data-no="${boardArticle.writerNo }">
										${not empty boardArticle.pscHtmlTag? boardArticle.pscHtmlTag :'<i class="material-icons md-18">face</i>'}
									<span class="material">
									${boardArticle.writerNickname }</span></a>
								</td>
								
								<td class="text-center">
									<c:if test="${today eq regdate}">
										<fmt:formatDate value="${boardArticle.regDate }" pattern="HH:mm:ss" />
									</c:if>
									<c:if test="${today ne regdate }">
										${regdate }
									</c:if>
								</td>
								<td class="text-center"><c:out value="${boardArticle.hit }"></c:out></td>
							</tr>
							</c:forEach>
							<c:if test="${empty boardList }">
								<tr>
									<td colspan="5" class="text-center">게시물이 존재하지 않습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<c:if test="${not empty loginUser }">
				<a href="${btCode }/new${queryInfo.makeQuery(pageInfo.startPage - 1, param.sType, param.sKeyword) }" class="btn btn-primary">등록</a>
			</c:if>
			<form action="" class="form-inline pull-right">
					<select name="sType" class="form-control">
						<option value="a" ${param.sType eq "a" ? "selected" : "" }>전체
						<option value="tc" ${param.sType eq "tc" ? "selected" : "" }>제목+내용
						<option value="t" ${param.sType eq "t" ? "selected" : "" }>제목
						<option value="c" ${param.sType eq "c" ? "selected" : "" }>내용
						<option value="w" ${param.sType eq "w" ? "selected" : "" }>닉네임
					</select>
					<input type="hidden" name="page" value="1">
					<input type="text" name="sKeyword" class="form-control" value="${param.sType ne 'wn' ? param.sKeyword : '' }">
					<input type="submit" value="검색" class="btn btn-primary">
			</form>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-10">
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
		
</section>
<script>
	$(function(){
		$(".title").on("click", function(){
			 $.ajax({
				  method: "PUT",
				  url: this
				}); 
		});

		$(document).ready(function(){
		    $('[data-toggle="popover"]').popover({
		    	html:true,
		    	content : function(){
		    		return '<a class="btn" onClick="window.open(&quot;${pageContext.request.contextPath }/message/insert?nickname='+$(this).data("nickname")+'&no='+$(this).data("no")+'&quot;, &quot;tt&quot;, &quot;width=800, height=800&quot);"}>쪽지보내기</a><br>'
		    		+'<a class="btn" href="?sType=wn&sKeyword='+$(this).data("no")+'">작성글검색</a>';
		    	}
		    });
		});
	});
</script>