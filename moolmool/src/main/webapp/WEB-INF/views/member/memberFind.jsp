<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
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
.form-group.text-center a {
	color: gray;
}
.reg_slider{
   margin-left:430px;
}
input[type=radio] + label {
   display:inline-block;
    margin:-2px;
    padding: 4px 12px;
    background-color: #f2f2f2;
    border-color: #ddd;
    width:120px;
    border-radius: 8px;
    cursor: pointer;
}
input[type=radio]:checked + label { 
   background-image: none;
   background-color:#1175bc;
   color: #fff;
}
#regradio{
   margin-left: 780px;
}
#regradio1{
   display:none;
}
#regradio2{
   display:none;
}
#regradio1 + label{
   text-align: center;
}
#regradio2 + label{
   text-align: center;
}
.leave-box{
	padding-left: 40px;
	padding-right: 40px;
	background: white;
}
label{
	color: gray;
}
</style>
<script type="text/javascript">
	$(function(){
    	showDiv();
    	$("input[name=item]").on("change", function(){
    		showDiv();
    	});
    });
    
    function showDiv(){
    	
    	if($("input[name=item]").eq(0).is(":checked", true)){
    	    $("#regtable1").css("display", "block");
    	    $("#regtable1_b").css("display", "none");
    	    $('#findPwd input[type="text"]').val("");
    	    $('#findPwd input[type="email"]').val(""); 
    	  
    	}
    	
    	if($("input[name=item]").eq(1).is(":checked", true)){
    		$("#regtable1").css("display", "none");
    		$('#findId input[type="text"]').val("");
    		$('#findId input[type="email"]').val("");
    	    $("#regtable1_b").css("display", "block");
    	   
    	}
    }
    
    
    function authId() {
    	var x = document.getElementById("nameId").value;
    	var y = document.getElementById("emailId").value;
    	
        if (x == null || x == "") {
            alert("이름을 입력해 주세요.");
        }else if(y == null || y == ""){
        	alert("이메일을 입력해 주세요.");
        }else{
        	alert("이메일에 있는 인증번호를 입력해 주세요.");
        	document.getElementById("authNoId").readOnly = false;
        	
        	$.ajax({
    			url : "/moolmool/member/authMailId",
    			data : {
    				name : x,
    				email : y
    			},
    			type : "post",
    			success : function(data){	
    					$("#emailId").next().text(decodeURIComponent(data)).css("color","#0275D8");
    			}
    		});	
        }
	}
    
    function authPwd() {
    	var x = document.getElementById("namePwd").value;
    	var y = document.getElementById("emailPwd").value;
    	var z = document.getElementById("idPwd").value;
    	
    	if(z == null || z == ""){
    		alert("아이디를 입력해 주세요.");
    	}else if (x == null || x == "") {
            alert("이름을 입력해 주세요.");
        }else if(y == null || y == ""){
        	alert("이메일을 입력해 주세요.");
        }else{
        	alert("이메일에 있는 인증번호를 입력해 주세요.");
        	document.getElementById("authNoPwd").readOnly = false;
        	
        	$.ajax({
    			url : "/moolmool/member/authMailPwd",
    			data : {
    				name : x,
    				email : y,
    				id : z
    			},
    			type : "post",
    			success : function(data){	
    					$("#emailPwd").next().text(decodeURIComponent(data)).css("color","#0275D8");
    			}
    		});	
        }
	}
    
    function authCheckId() {
    	var x = document.getElementById("authNoId").value;

    	$.ajax({
			url : "/moolmool/member/authCheckId",
			data : {
				authNo : x
			},
			type : "post",
			success : function(data){
				console.log(data);
				$("#authNoId").next().text(decodeURIComponent(data)).css("color","#0275D8");
			}
		});
	}
    
    function authCheckPwd() {
    	var x = document.getElementById("authNoPwd").value;
		console.log(x);
    	$.ajax({
			url : "/moolmool/member/authCheckPwd",
			data : {
				authNo : x
			},
			type : "post",
			success : function(data){
				console.log(data);
				$("#authNoPwd").next().text(decodeURIComponent(data)).css("color","#0275D8");
			}
		});
	}
    
</script>
<br>
<br>
<br>
<br>
<br>
<div class="text-center">
	<div id="regradio">
	    <input id="regradio1" type="radio" name="item" value="findId" checked>
	    <label for="regradio1" >아이디 찾기</label> &nbsp;
	    
	    <input id="regradio2" type="radio" name="item" value="findPwd">
	   	<label for="regradio2" >암호 찾기</label>
	</div>
	<hr style="border-color:#0275D8">
</div>
<div class="container container-top container-center">
	<div class="row">
		<div class="col-md-5 col-xs-12">
			<div class="leave-box well">
				<div id="regtable1">
					<form id="findId" action="leave" method="post">
					<h3>아이디 찾기</h3>
					<h5>본인확인 이메일 주소와 입력한 이메일 주소가 같아야,<br>인증번호를 받을 수 있습니다.</h5>
						<div class="row">
							<div class="form-group col-md-12 col-xs-12">
               					<label for="name">이름</label>
                				<input type="text" class="form-control" name="name" id="nameId" placeholder="이름을 입력하세요."/>
            				</div>
							<div class="form-group col-md-12 col-xs-12">
               		    		<label for="email">이메일</label>
								<input type="email" class="form-control" name="email" id="emailId" placeholder="이메일을 입력하세요.">
								<span></span>
            				</div>
          
            				<div class="form-group col-md-12 col-xs-12">
                				<input type="button" class="btn btn-primary btn-block" value="인증 번호 받기" onclick="return authId();"/>
           					</div>
           					<div id="authNoDiv" class="form-group col-md-12 col-xs-12">
               		    		<label for="authNo">인증코드</label>
								<input type="text" class="form-control" name="authNo" id="authNoId" readonly placeholder="인증코드를 입력하세요.">
								<span></span>
            				</div>
            				<div class="form-group col-md-12 col-xs-12">
                				<input type="button" class="btn btn-primary btn-block" value="인증 번호 확인" onclick="return authCheckId();"/>
           					</div>
						</div>
					</form>
				</div>
				<div id="regtable1_b">
					<form id="findPwd" action="leave" method="post">
					<h3>암호 찾기</h3>
					<h5>본인확인 이메일 주소와 입력한 이메일 주소가 같아야,<br>인증번호를 받을 수 있습니다.</h5>
						<div class="row">
							<div class="form-group col-md-12 col-xs-12">
               					<label for="id">아이디</label>
                				<input type="text" class="form-control" name="id" id="idPwd" placeholder="아이디를 입력하세요."/>
            				</div>
							<div class="form-group col-md-12 col-xs-12">
               					<label for="name">이름</label>
                				<input type="text" class="form-control" name="name" id="namePwd" placeholder="이름을 입력하세요."/>
            				</div>
							<div class="form-group col-md-12 col-xs-12">
               		    		<label for="email">이메일</label>
								<input type="email" class="form-control" name="email" id="emailPwd" placeholder="이메일을 입력하세요.">
								<span></span>
            				</div>
          
            				<div class="form-group col-md-12 col-xs-12">
                				<input type="button" class="btn btn-primary btn-block" value="인증 번호 받기" onclick="return authPwd();"/>
           					</div>
           					<div id="authNoDiv" class="form-group col-md-12 col-xs-12">
               		    		<label for="authNo">인증코드</label>
								<input type="text" class="form-control" name="authNo" id="authNoPwd" readonly placeholder="인증코드를 입력하세요.">
								<span></span>
            				</div>
            				<div class="form-group col-md-12 col-xs-12">
                				<input type="button" class="btn btn-primary btn-block" value="인증 번호 확인" onclick="return authCheckPwd();"/>
           					</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>