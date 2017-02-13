<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="${ pageContext.request.contextPath }/resources/js/jquery.validate.min.js"></script>
<style type="text/css">
input{
	padding: 5px;
}
.error{
	color: #0275D8;
}
label{
	color: gray;
}
form { 
	margin: 0 auto; 
	width:250px;
}
</style>
<script type="text/javascript">
$(function(){
	
	$("#phone").focusout(function() {
		
		var phone =document.getElementById("phone").value;
		document.getElementById("phone").value = phone.replace(/[^0-9]/g,'');
		
	});
	
	jQuery.validator.addMethod("id_rule", function(value, element) {
        return this.optional(element) || /^[a-zA-Z0-9_-]+$/.test(value);
	});
	
	jQuery.validator.addMethod("pwd_rule", function(value, element) {
        return this.optional(element) || /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=*])[0-9a-zA-Z!@#$%^&+=]*$/.test(value);
	});                        
	
	jQuery.validator.addMethod("phone_rule", function(value, element) {
        return this.optional(element) || /^01[016789]+[0-9-]+$/.test(value);
	});
	
	jQuery.validator.addMethod("naming_rule", function(value, element) {
        return this.optional(element) || /^[a-zA-Z가-힣]+$/.test(value);
	});

    $("form").validate({
    	
    	debug: true
    	
    	highlight: function(element) {
            $(element).closest('.form-group').addClass('has-error has-feedback').removeClass('has-success has-feedback');
            $(element).closest('.form-group').find('span .glyphicon-success').remove();
            $(element).closest('.form-group').append('<span class="glyphicon glyphicon-success form-control-feedback"></span>');
        },
        
        unhighlight: function(element) {
            $(element).closest('.form-group').removeClass('has-error has-feedback').addClass('has-success has-feedback');
            $(element).closest('.form-group').find('span .glyphicon-remove').remove();
            $(element).closest('.form-group').append('<span class="glyphicon glyphicon-success form-control-feedback></span>');
        },
    	
    	groups: {
    		addr_groups: "zipCode roadAddrPart addrDetail"
    	},
   
    	rules: {
            id: {
                required : true,
                id_rule : true,
                rangelength:[5,20]
            },
            password: {
            	pwd_rule : true, 
            	rangelength:[6,16],
            	required : true
            },
            rePassword: {
            	required : true,
            	equalTo : password
            },
            nickName: {
            	required : true,
            	naming_rule : true
            },
            name:{
            	required : true,
            	naming_rule : true
            },
            zipCode:{
            	required : true
            },
            roadAddrPart: {
            	required : true
            },
            addrDetail: {
            	required : true
            },
            phone: {
            	required : true,
            	phone_rule : true,
            	rangelength: [10,11]
            },
            email: {
            	required : true,
            	email : true
            }
    	},
    	
    	messages : {
            id: {
                required : "필수 정보입니다.",
                id_rule : "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.",
                rangelength: "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다."
            },
            password: {
            	pwd_rule : "6~16자 영문 대 소문자, 숫자, 특수문자를 조합하여 사용하세요.",
            	rangelength: "6~16자 영문 대 소문자, 숫자, 특수문자를 조합하여 사용하세요.",
            	required : "필수 정보입니다."
            },
            rePassword: {
            	required : "필수 정보입니다.",
            	equalTo : "비밀번호가 일치하지 않습니다."
            },
            nickName: {
            	 required : "필수 정보입니다.",
            	 naming_rule : "한글, 영문 대소문자를 이용해 주세요."
            },
            name:{
            	 required : "필수 정보입니다.",
                 naming_rule : "한글, 영문 대소문자를 이용해 주세요."
            },
            zipCode:{
            	required : "주소를 검색 해주세요."
            },
            roadAddrPart: {
            	required : "주소를 검색 해주세요."
            },
            addrDetail: {
            	required : "주소를 검색 해주세요."
            },
            phone: {
            	 required : "필수 정보입니다.",
            	 phone_rule : "전화번호를 다시 확인해주세요.",
            	 rangelength: "전화번호를 다시 확인해주세요."
            },
            email: {
            	 required : "필수 정보입니다.",
            	 email : "이메일 주소를 다시 확인해주세요."
            }
    	},
    	
    	errorElement: 'span',
        errorClass: 'help-block',
       	 	
    	errorPlacement: function(error, element) {
    	      error.appendTo( element.siblings().next() );
    	      
    	      if (element.attr("name") == "zipCode"  || 
    	              element.attr("name") == "roadAddrPart" || 
    	              element.attr("name") == "addrDetail" )
    	            error.insertAfter("#addrDetail");
    	          else
    	            error.insertAfter(element);
    	     }
    });
})
</script>
<script type="text/javascript">
	
	function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("../resources/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	
	function jusoCallBack(zipCode,roadAddrPart1,addrDetail,jibunAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		console.log(jibunAddr);
		document.getElementById("zipCode").value = zipCode;
		document.getElementById("roadAddrPart").value = roadAddrPart1;
		document.getElementById("addrDetail").value = addrDetail;
		document.getElementById("jibunAddr").value = jibunAddr;
	}
</script>
<section class="container container-top container-center">
	<div class="vcenter-tb">
		<div class="row vcenter-tc ">
			<form:form action="update" commandName="memberVO" method="POST" cssClass="col-md-5 col-sm-12 col-centered well">
  				<form:hidden path="roleCode" value="ROLE_USER"/>
		    	<div class="form-group">
		    		<form:label cssClass="control-label" path="id">아이디</form:label>
		    		<form:input path="id" autocomplete="off" cssClass="form-control" placeholder="아이디를 입력하세요." readonly="true"/>
					<form:errors cssClass="help-block error" path="id" />
		    	</div>
		    	<div class="form-group">
		    		<form:label cssClass="control-label" path="password">비밀번호</form:label>
		    		<form:password path="password" cssClass="form-control" placeholder="비밀번호를 입력하세요."/>
					<form:errors cssClass="help-block error" path="password" />
					<!-- id="password.errors" -->
		    	</div>
		    	<div class="form-group">
		    		<label class="control-label" for="rePassword">비밀번호 확인</label>
					<input type="password" class="form-control" name="rePassword" id="rePassword" placeholder="비밀번호 재확인">
		    	</div>
		    	<div class="form-group">
		    		<form:label cssClass="control-label" path="nickName">닉네임</form:label>
		    		<form:input path="nickName" cssClass="form-control" placeholder="닉네임(별명)을 입력하세요." readonly="true"/>
					<form:errors cssClass="help-block error" path="nickName" />
		    	</div>
		    	<div class="form-group">
		    		<form:label cssClass="control-label" path="name">이름</form:label>
		    		<form:input path="name" cssClass="form-control" placeholder="이름을 입력하세요."/>
					<form:errors cssClass="help-block error" path="name"/>
		    	</div>
		    	<div class="form-group">
		    		<input type="hidden" id="confmKey" name="confmKey">	
					<form:label cssClass="control-label" path="zipCode">주소</form:label>
					<div class="form-inline">
						<form:input path="zipCode" cssClass="form-control" readonly="true"/>
						<input type="button" class="form-control btn btn-primary" value="주소검색" onclick="goPopup();">
					</div>
					<form:input path="roadAddrPart" cssClass="form-control" readonly="true"/>
					<form:input path="addrDetail" cssClass="form-control" readonly="true"/>
					<form:hidden path="jibunAddr"/>
					<form:errors cssClass="help-block error" path="zipCode"/>
		    	</div>
		    	<div class="form-group">
		    	    <label class="control-label" for="phone">전화번호</label>
		    		<input type="tel" class="form-control" id="phone" name="phone" placeholder="(-제외)휴대전화번호 입력하세요." value="${memberVO.phone}">
  				    <form:errors cssClass="help-block error" path="phone"/>
		    	</div>
		    	<div class="form-group">
		    		<label class="control-label" for="email">EMAIL</label>
		    		<input type="email" class="form-control" id="email" name="email" placeholder="비상연락용 이메일 입력하세요." value="${memberVO.email}" readonly="true">
  					<form:errors cssClass="help-block error" path="email"/>
		    	</div>
		    	<div class="form-group">
       				<input type="submit" class="btn btn-primary btn-block" value="회원 수정" />
       			</div>
			</form:form>
		</div>
	</div>
</section>