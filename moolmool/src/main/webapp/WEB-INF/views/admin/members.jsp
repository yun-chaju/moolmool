<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="${ pageContext.request.contextPath }/resources/js/jquery.validate.min.js"></script>
<style>
	.material-icons {
		vertical-align: middle;
	}
	.modal-body table tbody tr td {
		vertical-align: middle;
	}
	.member-padding {
		padding: 15px;
	}
	.detail-icon {
		color: #f0ad4e;
		cursor: pointer;
	}
	
	.update-icon {
		color: #0275d8;
		cursor: pointer;
	}

	.modal-body table.table tr td>input {
		width: 100%;
	}
	.material-icons.delete-icon {
		color: #d9534f;
	}
	button.btn-mdelete {
		background: none;
		border: none;
		padding: 0px;
	}
	button.btn.btn-mdelete:hover,
	button.btn.btn-mdelete:active,
	button.btn.btn-mdelete:focus {
		background: none;
		border: none;    
		webkit-box-shadow: none;
		box-shadow: none;
		outline: none;
	}
	.mDelete {
		padding: 0px;
		margin: 0px;
		display: inline-block;
	}
</style>
<section>
	<div class="admin-menu"> 
		<ul class="nav nav-pills nav-stacked menu-option">
			<li role="presentation">
				<a href="${pageContext.request.contextPath }/admin"><i class="material-icons menu-icon">dvr</i>&nbsp;&nbsp;&nbsp;<span>Dashboard</span></a>
			</li>
			<li role="presentation" class="active">
				<a href="${pageContext.request.contextPath }/admin/members"><i class="material-icons menu-icon">people</i>&nbsp;&nbsp;&nbsp;<span>회원관리</span></a>
			</li>
			<li role="presentation">
				<a href="${pageContext.request.contextPath }/admin/boards"><i class="material-icons menu-icon">sms</i>&nbsp;&nbsp;&nbsp;<span>커뮤니티 관리</span></a>
			</li>
			<li role="presentation">
				<a href="${pageContext.request.contextPath }/admin/ftype"><i class="material-icons menu-icon">queue</i>&nbsp;&nbsp;&nbsp;<span>FAQ TYPE 관리</span></a>
			</li>
			<li role="presentation">
				<a href="${pageContext.request.contextPath }/admin/email"><i class="material-icons menu-icon">email</i>&nbsp;&nbsp;&nbsp;<span>메일링 시스템</span></a>
			</li>
		</ul>
	</div>
	<div class="admin-content">
		<div class="panel panel-info">
			<div class="panel-heading">
				<i class="material-icons heading-icon">people</i>&nbsp;회원 목록
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-6 member-padding">
					
					</div>
					<div class="col-xs-6 member-padding">
						<form action="" class="form-inline">
							<div class="from-group pull-right">
								<input type="hidden" name="page" value="1">
								<input type="text" name="sKeyword" class="form-control" value="${ param.sKeyword }">
								<input type="submit" value="검색" class="btn btn-primary">
							</div>
						</form>
					</div>
				</div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th class="text-center">아이디</th>
							<th class="text-center">이름</th>
							<th class="text-center">권한</th>
							<th class="text-center">상태</th>
							<th class="text-center">가입날짜</th>
							<th class="text-center">Action</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="member" items="${ memberList }">
						<tr>
							<td class="text-center">${ member.id }</td>
							<td class="text-center">${ member.name }</td>
							<td class="text-center">${ member.roleCode }</td>
							<td class="text-center" style="vertical-align: middle;">
							<c:choose>
								<c:when test="${ member.status eq 'A'.charAt(0) }">
									<span class="label label-success">active</span>
								</c:when>
								<c:when test="${ member.status eq 'B'.charAt(0) }">
									<span class="label label-danger">banned</span>
								</c:when>
								<c:when test="${ member.status eq 'D'.charAt(0) }">
									<span class="label label-warning">deleted</span>
								</c:when>
								<c:when test="${ member.status eq 'I'.charAt(0) }">
									<span class="label label-default">inactive</span>
								</c:when>
							</c:choose>
							</td>
							<td class="text-center">${ member.regdate }</td>
							<td class="text-center">
								<i class="material-icons detail-icon" data-toggle="modal" data-target="#mdetail${ member.memNo }">person_pin</i>&nbsp;&nbsp;&nbsp;
								<div class="modal fade" id="mdetail${ member.memNo }" role="dialog">
								    <div class="modal-dialog">
								    
								      <!-- Modal content-->
								      <div class="modal-content">
								        <div class="modal-header">
								          <button type="button" class="close" data-dismiss="modal">&times;</button>
								          <h4 class="modal-title">${ member.id }님의 상세정보</h4>
								        </div>
								        <div class="modal-body">
								          <table class="table table-bordered">
								          	<tr>
								          		<td class="text-center">회원번호</td><td>${ member.memNo }</td>
								          	</tr>
								          	<tr>
								          		<td class="text-center" >상태</td>
								          		<td style="vertical-align: middle;">
							          			<c:choose>
													<c:when test="${ member.status eq 'A'.charAt(0) }">
														<span class="label label-success">active</span>
													</c:when>
													<c:when test="${ member.status eq 'B'.charAt(0) }">
														<span class="label label-danger">banned</span>
													</c:when>
													<c:when test="${ member.status eq 'D'.charAt(0) }">
														<span class="label label-warning">deleted</span>
													</c:when>
													<c:when test="${ member.status eq 'I'.charAt(0) }">
														<span class="label label-default">inactive</span>
													</c:when>
												</c:choose>
								          		</td>
								          	</tr>
								          	<tr>
								          		<td class="text-center">권한</td><td>${ member.roleCode }</td>
								          	</tr>
								          	<tr>
								          		<td class="text-center">아이디</td><td>${ member.id }</td>
								          	</tr>
								          	<tr>
								          		<td class="text-center">이름</td><td>${ member.name }</td>
								          	</tr>
								          	<tr>
								          		<td class="text-center">닉네임</td><td>${ member.nickName }</td>
								          	</tr>
								          	<tr>
								          		<td class="text-center">이메일</td><td>${ member.email }</td>
								          	</tr>
								          	<tr>
								          		<td class="text-center">도로명 주소</td><td>${ member.roadAddrPart } ${ member.addrDetail }</td>
								          	</tr>
								          	<tr>
								          		<td class="text-center">지번 주소</td><td>${ member.jibunAddr } ${ member.addrDetail }</td>
								          	</tr>
								          	<tr>
								          		<td class="text-center">연락처</td><td>${ member.phone }</td>
								          	</tr>
								          	<tr>
								          		<td class="text-center">포인트</td><td>${ member.point }</td>
								          	</tr>
								          	<tr>
								          		<td class="text-center">가입날짜</td><td>${ member.regdate }</td>
								          	</tr>
								          	<tr>
								          		<td class="text-center">최종수정날짜</td><td>${ member.lastModDate }</td>
								          	</tr>
								          </table>
								        </div>
								        <div class="modal-footer">
								        	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
								        </div>
								      </div>
								      
								    </div>
								</div>
								<a href="${pageContext.request.contextPath }/admin/members/update/${ member.memNo }"><i class="material-icons update-icon">edit</i></a>&nbsp;&nbsp;&nbsp;
								<form:form method="delete" action="${pageContext.request.contextPath }/admin/members/${ member.memNo }" cssClass="inline-form mDelete" >
									<button type="submit" class="btn btn-mdelete" >
										<i class="material-icons delete-icon">delete</i>
									</button>
								</form:form>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				
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
	</div>
</section>
<script>
	$(function(){
		$(".btn-mdelete").on("click", function(e){
			e.preventDefault();
			var flag = confirm("해당 아이디를 정말로 정지시키겠습니까?");
			if(flag){
				$(this).parent('form').submit();
			}
		});
	});
</script>