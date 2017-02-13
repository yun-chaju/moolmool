<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/awesome-bootstrap-checkbox.css">
<style>
.naver{
	width: 100%;
	height: 15%;
}
.login-box{
	padding: 30px;
	background: white;
}
 
label{
	color: gray;
}
form.well {
	margin-bottom: 100px;
}
.vcenter-tb {
	display: table;
	height: 100%;
	width: 100%;
}
.vcenter-tc {
	display: table-cell;
	vertical-align: middle;
}
.container-center {
	height: 100%;
}

#login-form {
	padding: 40px 40px 25px 40px;
	border-radius: 10px;
}
.form-group.text-center a {
	color: gray;
}

a.point-color strong{
	color: #0275d8;
	/* text-decoration: underline; */
  border-bottom:1px solid #0275d8;
  padding-bottom:2px;
}

input.checkbox-circle {
	
}
</style>
<script>
$(function(){
	var msg = '${msg}';
	if(msg.length !== 0) {
		alert(msg);
	}
	
	$("#password").on("focus", function(){
		$("label[for=password]").css("color", "#66afe9");
	});
	$("#password").on("blur", function(){
		$("label[for=password]").css("color", "gray");
	});
	$("#id").on("focus", function(){
		$("label[for=id]").css("color", "#66afe9");
	});
	$("#id").on("blur", function(){
		$("label[for=id]").css("color", "gray");
	});
});
</script>
<section class="container container-top container-center">
	<div class="vcenter-tb">
		<div class="row vcenter-tc ">
			<form action="memberLogin" method="post" id="login-form" class="col-md-5 col-sm-12 col-centered well">
			
				<div class="form-group">
        <label for="id">ID</label>
        <input type="text" class="form-control" name="id" id="id" autocomplete="off" placeholder="아이디를 입력하세요." value="${cookie.REMEMBER.value}" autofocus="autofocus"/>
       </div>
       
       <div class="form-group">
       	<label for="password">PASSWORD</label>
					<input type="password" class="form-control" name="password" id="password" placeholder="암호를 입력하세요.">
       </div>
       
       <div class="checkbox checkbox-info checkbox-circle">
       	<input type="checkbox" name="rememberId" id="rememberId" <c:if test="${ !empty cookie.REMEMBER.value }">checked</c:if>>
       	<label for="rememberId">
       			아이디 기억하기
       	</label>
       </div>
 
       <div class="form-group">
       	<input type="submit" class="btn btn-primary btn-block" value="로그인" />
       </div>
       
       <div class="form-group text-center">
       	<a class="" href="${ pageContext.request.contextPath }/member/find">아이디/비밀번호 잊으셨나요?</a>
       </div>
       
       <div class="form-group text-center">
       	<a href="join" class="point-color"><strong>회원가입</strong></a>
       </div>
      </form>
      <form action="" hidden=""></form>
      </div>
		</div>
</section>