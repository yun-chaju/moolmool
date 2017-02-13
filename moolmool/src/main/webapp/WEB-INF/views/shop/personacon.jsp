<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
	#command {
		margin-bottom: 0px;
	}
</style>
<script>
$(function(){
	$(".btnbtn").mouseenter(function(){
		$(this).text("적용");
		$(this).removeClass("disabled");
		$(this).addClass("btn-success");
	});
	$(".btnbtn").mouseout(function(){
		$(this).text("보유");
		$(this).addClass("disabled");
		$(this).removeClass("btn-success");
	});
	$(".btnbtn").click(function() {
		$.ajax({
			  url: 'personacon/use/' + $(this).data("no"),
			  success: function(){
				  location.href=location.href;
				  // 추후 수정
			  }
			});
	});
});
</script>
<section class="container container-top">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<h4 class="visible-md-block visible-lg-block">
				<strong>&nbsp;</strong>
			</h4>
		</div>
		<div class="col-md-2">
			<div class="list-group has-shadow">
				<a href="${pageContext.request.contextPath }/shop/personacon" class="list-group-item active">퍼스나콘</a>
				<a href="${pageContext.request.contextPath }/shop/item" class="list-group-item">아이템</a>
			</div>
			<c:if test="${not empty loginUser}">
				<div class="list-group has-shadow">
					<div class="panel panel-default">
						<div class="panel-heading text-center">
							<div>${loginUser.pscUrl }</div>
							<div><strong>${loginUser.nickName }</strong></div>
						</div>
						<div class="panel-body text-center">
							<div>${memberPoint }물물</div>
						</div>
					</div>
				</div>
			</c:if>
		</div>
		<div class="col-md-10">
			<div class="panel panel-default">
				<div class="panel-body">
					<c:forEach var="item" items="${pList }">
						<div class="col-xs-6 col-sm-3">
							<div class="panel panel-default">
								<div class="panel-heading text-center"><strong>${item.name }${item.pscNo }</strong></div>
								<div class="panel-body">
									<div class="text-center">${item.htmlTag }</div>
								</div>
								<div class="panel-footer">
									<div class="price text-center">${item.price }물물</div>
									<div class="text-center">
										<c:if test="${not empty loginUser and item.have <= 0 and loginUser.pscCode ne item.pscNo}">
											<form:form method="post" action="${pageContext.request.contextPath }/shop/personacon/order/${item.pscNo }?page=${param.page }">
												<input type="submit" class="btn btn-primary" value="구매">
											</form:form>
										</c:if>
										<c:if test="${item.have > 0 and loginUser.pscCode ne item.pscNo}">
											<button class="btn btn-default disabled btnbtn" data-no="${item.pscNo }">보유</button>
										</c:if>
										<c:if test="${loginUser.pscCode eq item.pscNo}">
											<button class="btn btn-danger disabled" data-no="${item.pscNo }">사용중</button>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="panel-footer">
					
					<nav class="text-center">
						<ul class="pagination">
							<li ${pageInfo.hasPrev ? "":"class='disabled'"}>
								<a <c:if test="${pageInfo.hasPrev }">href='?page=${pageInfo.startPage - 1 }'</c:if>
									 aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
							<c:forEach var="page" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
								<li ${page eq param.page or (param.page eq null and page eq 1) ? "class='active'":"" }>
									<a <c:if test="${!(page eq param.page or (param.page eq null and page eq 1)) }">
										href='?page=${page }'
									</c:if>>${page }</a>
								</li>
							</c:forEach>
							<li  ${pageInfo.hasNext ? "":"class='disabled'"}>
								<a <c:if test="${pageInfo.hasNext }">href='?page=${pageInfo.endPage + 1 }'</c:if> 
										aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</ul>
					</nav>
					
				</div>
			</div>
		</div>
	</div>
</section>