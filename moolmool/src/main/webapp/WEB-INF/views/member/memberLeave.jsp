<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
.leave-box{
	padding-left: 40px;
	padding-right: 40px;
	background: white;
}
label{
	color: gray;
}
</style>
<br>
<br>
<div class="container">
	<div class="row">
		<div class="page-header">
		</div>
		<div class="col-md-5 col-xs-12">
			<div class="leave-box well">
			<form action="leave" method="post">
					<h3>비밀번호 재확인</h3>
					<h5>정말로 탈퇴 하시겠습니까?</h5>
			<div class="row">
				<div class="form-group col-md-12 col-xs-12">
               		<label for="id">ID</label>
                	<input type="text" class="form-control" name="id" id="id" value="${loginUser.id}" readonly/>
            	</div>
				<div class="form-group col-md-12 col-xs-12">
               		    	<label for="password">PASSWORD</label>
							<input type="password" class="form-control" name="password" id="password" placeholder="암호를 입력하세요.">
            	</div>
            	<div class="form-group col-md-12 col-xs-12">
                			<input type="submit" class="btn btn-primary btn-block" value="확인" />
           		</div>
			</div>
			</form>
			</div>
		</div>
	</div>
</div>