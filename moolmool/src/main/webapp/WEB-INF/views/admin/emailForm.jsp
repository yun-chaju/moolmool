<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<li role="presentation">
				<a href="${pageContext.request.contextPath }/admin/ftype"><i class="material-icons menu-icon">queue</i>&nbsp;&nbsp;&nbsp;<span>FAQ TYPE 관리</span></a>
			</li>
			<li role="presentation" class="active">
				<a href="${pageContext.request.contextPath }/admin/email"><i class="material-icons menu-icon">email</i>&nbsp;&nbsp;&nbsp;<span>메일링 시스템</span></a>
			</li>
		</ul>
	</div>
	<div class="admin-content">
	<div class="panel panel-warning">
		<div class="panel-heading">
		<i class="material-icons heading-icon">email</i>&nbsp;메일링 시스템
		</div>
		<div class="panel-body">
			<form class="form" action="/moolmool/admin/email/part" method="post">
			<p class="form-group">
				<label for="subject">제목</label> <input class="form-control" type="text"
					name="subject" id="subject" autocomplete="off">
			</p>
			
			<p class="form-group">
				<label for="mailaddr">메일을 모두에게 보내기</label>
				<input type="checkbox" name="mailaddr" id="mailaddr" >
				<input class="form-control"  type="text" name="mailList" id="mailList" placeholder="이메일은 콤마로 구분.">
			</p>
			
			<script>
				$(function(){
					var f = $(".form");
					$("#mailaddr").change(function(){
						if($("#mailaddr").prop("checked") == true){
							$("#mailList").css("visibility","hidden");
							$("#mailList").val("");
							f.attr("action","/moolmool/admin/email/all");
						}else{
							$("#mailList").css("visibility","visible");
							f.attr("action","/moolmool/admin/email/part");
						}
					});
				});
			</script>
			
			<p class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" name="content" id="content" rows="20"></textarea>
			</p>
			<p class="form-group">
				<input type="submit" value="보내기" class="btn btn-default" /> 
				
				<a href="../" class="btn btn-default">취소</a>
			</p>
		</form>
		</div>
	</div>
	
	</div>
</section>