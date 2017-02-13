<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.panel-default {
	padding: 5px 5px 5px 5px;
}
</style>

<script>
	$(function() {
		$("input[type=radio]").change(function() {
			if ($("#insert").prop("checked") == true) {
				$(".form-control").removeAttr("readonly");
				$(".btn-default").attr("disabled", "disabled");
				$(".btn-primary").html("생성");
				$("#fName").val("");
				$("#description").val("");
				$(".form-inline").attr("action", "/moolmool/admin/ftype/insert");

			} if ($("#update").prop("checked") == true) {
				$(".form-control").removeAttr("readonly");
				$(".btn-default").removeAttr("disabled");
				$(".btn-primary").html("수정");
				$("#fName").val("");
				$("#description").val("");
				$(".form-inline").attr("action", "/moolmool/admin/ftype/update");

			}  if ($("#delete").prop("checked") == true) {
				$(".form-control").attr("readonly","readonly");
				$(".btn-default").removeAttr("disabled");
				$(".btn-primary").html("삭제");
				$("#fName").val("");
				$("#description").val("");
				$(".form-inline").attr("action", "/moolmool/admin/ftype/delete");
			}
		});

		$(".btn-default").click(function() {
			$("#fName").val($(this).attr("id"));
			$("#description").val($(this).attr("value"));
			$("#oldFName").attr("value",$(this).attr("id"));
		});	
	});
</script>

<section>
	<div class="admin-menu"> 
		<ul class="nav nav-pills nav-stacked menu-option">
			<li role="presentation">
				<a href="${pageContext.request.contextPath }/admin"><i class="material-icons menu-icon">dvr</i>&nbsp;&nbsp;&nbsp;<span>Dashboard</span></a>
			</li>
			<li role="presentation">
				<a href="${pageContext.request.contextPath }/admin/members"><i class="material-icons menu-icon">people</i>&nbsp;&nbsp;&nbsp;<span>회원관리</span></a>
			</li>
			<li role="presentation">
				<a href="${pageContext.request.contextPath }/admin/boards"><i class="material-icons menu-icon">sms</i>&nbsp;&nbsp;&nbsp;<span>커뮤니티 관리</span></a>
			</li>
			<li role="presentation" class="active">
				<a href="${pageContext.request.contextPath }/admin/ftype"><i class="material-icons menu-icon">queue</i>&nbsp;&nbsp;&nbsp;<span>FAQ TYPE 관리</span></a>
			</li>
			<li role="presentation">
				<a href="${pageContext.request.contextPath }/admin/email"><i class="material-icons menu-icon">email</i>&nbsp;&nbsp;&nbsp;<span>메일링 시스템</span></a>
			</li>
		</ul>
	</div>
	<div class="admin-content">
			<div class="panel panel-danger">
				<div class="panel-heading">
					<i class="material-icons heading-icon">queue</i>&nbsp;현재 FAQ 목록
				</div>
				<div class="panel-body">
					<c:forEach var="ftype" items="${vo }">
						<button id="${ftype.fName}" class="btn btn-default"
							value="${ftype.description }">${ftype.description }(${ftype.fName})</button>
					</c:forEach>
					<div class="alert alert-warning">
						<strong>주의!</strong> 목록의 컬럼 수정, 삭제시 목록의 내용이 <strong>삭제</strong> 될 수 있습니다.
					</div>
					<form:form action="/moolmool/admin/ftype/update" class="form-inline"
						method="post">
						<label for="update"><strong>수정 </strong></label>&nbsp;&nbsp;<input type="radio" name="ftypename" id="update" checked="checked">
						<label for="insert"><strong>| 새로 생성 </strong></label>&nbsp;&nbsp;<input type="radio" name="ftypename" id="insert">
						<label for="delete"><strong>| 삭제 </strong></label>&nbsp;&nbsp;<input type="radio" name="ftypename" id="delete">
						<br>
						<div class="form-group">
							<label for="fName"><strong>FNAME :</strong></label> <input type="text" class="form-control" id="fName" name="fName" required>
						</div>
						<div class="form-group">
							<label for="description"><strong>DESCRIPTION :</strong></label> <input type="text" class="form-control" id="description" required
								name="description">
						</div>
						<div class="form-group">
							<input type="hidden" id="oldFName" name="oldFName">
						</div>
						<button type="submit" class="btn btn-primary" >수정</button>
					</form:form>
				</div>
			</div>
		</div>

</section>