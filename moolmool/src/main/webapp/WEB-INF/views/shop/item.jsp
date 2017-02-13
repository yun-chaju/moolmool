<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
	.strike {
		text-decoration: line-through;
	}
	
	.modal {
	  text-align: center;
	  padding: 0!important;
	}
	
	.modal:before {
	  content: '';
	  display: inline-block;
	  height: 100%;
	  vertical-align: middle;
	  margin-right: -4px;
	}
	
	.modal-dialog {
	  display: inline-block;
	  text-align: left;
	  vertical-align: middle;
	}
</style>
<script>
	$(function(){
		$("#btn-buy").on("click", function(e){
			e.preventDefault();
			if($("#nickname").val().length > 1) {
				$.ajax({
					url: '../member/nickNameCheck?nickName=' + $("#nickname").val(),
					method: 'post',
					success: function(data){
						if(data === 'true') {
							$("form").submit();
						} else {
							alert('중복된 닉네임이 존재합니다.');
						}
					}
				});
			} else {
				$("#nickname").focus();
			}
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
				<a href="${pageContext.request.contextPath }/shop/personacon" class="list-group-item">퍼스나콘</a>
				<a href="${pageContext.request.contextPath }/shop/item" class="list-group-item active">아이템</a>
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
					<c:forEach var="item" items="${iList }">
						<div class="col-xs-6 col-sm-3">
							<div class="panel panel-default">
								<div class="panel-heading text-center"><strong>${item.name }</strong></div>
								<div class="panel-body">
									<div class="text-center"><span>${item.htmlTag }</span></div>
								</div>
								<div class="panel-footer">
									<div class="price text-center"><span>${item.price }물물</span></div>
									<div class="text-center">
										<c:if test="${not empty loginUser and item.have <= 0}">
										<button type="button" class="btn btn-primary btn-memo" data-toggle="modal" data-target="#orderItem">구매</button>
										</c:if>
										<c:if test="${item.have > 0}">
											<a class="btn btn-default disabled">보유중</a>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<!-- 모달 시작 -->
	<div id="orderItem" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
			<form:form method="post" id="orderItem" action="${pageContext.request.contextPath }/shop/item/order/1">
				<div class="modal-header text-center">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">닉네임 변경</h4>
				</div>
				<div class="modal-body">
					<!-- <tex class=" nickname" style="min-width: 100%"></textarea> -->
					<input type="text" class="form-control" name="nickname" id="nickname" placeholder="닉네임을 입력하세요" autocomplete="off" required maxlength="6">
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-primary btn-block" id="btn-buy" value="구매">
				</div>
			</form:form>
			</div>
		</div>
	</div>
	<!-- 모달 끝 -->
	
	</div>
</section>