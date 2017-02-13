<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(document).ready(function() {
	$.getJSON("${ pageContext.request.contextPath }/mypage/btype", function(data){
		if(data.length > 0){
			$(".boardtype").html('<option value=\'all\'>전체 게시물</option>');
			$(data).each(function(){
				$(".boardtype").append('<option value=' + this.btCode + '>' + this.btName + '</option>');
			});
		}
		getBoardList(1, $("[name='sType']").val(), $("[name='sKeyword']").val());
	});
	
	$(".boardtype").on("change", function(){
		$("[name='sKeyword']").val("");
			getBoardList(1, $("[name='sType']").val(), $("[name='sKeyword']").val());
	});
	
	$(".pagination").on("click","a", function(){
		getBoardList($(this).text(), $("[name='sType']").val(), $("[name='sKeyword']").val());
	});
	
	$("#search").click(function(e){
		e.preventDefault();
		getBoardList(1, $("[name='sType']").val(), $("[name='sKeyword']").val());
	});
});

function getBoardList(page, sType, sKeyword){
	var uri = "${ pageContext.request.contextPath }/mypage/" + $(".boardtype").val() + "/" + ${loginUser.memNo};
	if((sType != null || sType.length > 0) && (sKeyword != null || sKeyword.length > 0)){
		uri = uri + "?page=" + page + "&sType=" + sType + "&sKeyword=" + sKeyword;
	}
	$.getJSON(uri, function(data){
		$("table").html('<tr><th>게시물 유형</th><th>제목</th><th>작성자</th><th>날짜</th>');
		if(data != null){
			var pageInfo;
			var boardList;
			
			$.each(data, function(key, val) {
				if(key == 'pageInfo')
					pageInfo = val;
				else
					boardList = val;
			});
			
			$(boardList).each(function(){
				$(".table").append('<tr><td>' + this.btCode + '</td><td>'
						+ "<a href='${ pageContext.request.contextPath }/board/" + this.btCode + "/" + this.bno + "'>"
						+this.title + '</a></td><td>' + this.writerNickname + '</td><td>'
						+ this.regDate);					
			});
				
			var attrPrev1 = "";
			var attrPrev2 = "";
			if(pageInfo.hasPrev == false)
				attrPrev1 = "class='disabled'";
			else 
				attrPrev2 = "href='#'";
			$(".pagination").html("");
			$(".pagination").append("<li " + attrPrev1 + "><a " + attrPrev2
									+ "aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
			for(var i=pageInfo.startPage; i <= pageInfo.endPage; i++){
				var str = "";
				if(i == page){
					str = "class='active'";
				}
				$(".pagination").append("<li " + str + "><a>" + i + "</a></li>");
			}
			
			var attrNext1 = "";
			var attrNext2 = "";
			if(pageInfo.hasNext == false)
				attrNext1 = "class='disabled' ";
			else
				attrNext2 = "href='#' ";
			
			$(".pagination").append("<li " + attrNext1 + "><a "  + attrNext2
									+ "aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
		}
	});
}
</script>
<section>
	<div class="container container-top">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<div class="col-xs-2">
					<select class="form-control boardtype"></select>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">

				<div class="container-fluid r1">
					<div class="row">
						<div class="list-group has-shadow">
							<a href="${pageContext.request.contextPath }/mypage"
								class="list-group-item">내 정보 보기</a> 
								<a href="${pageContext.request.contextPath }/mypage/myBoard"
								class="list-group-item  active">내 게시글</a> 
								<!-- <a href="#" class="list-group-item">찜 목록</a> <a href="#"
								class="list-group-item">물물교환 목록</a> -->
							<p>
						</div>
						<div class="list-group has-shadow">
							<a href="${pageContext.request.contextPath }/mypage/list/receive"
								class="list-group-item">받은 쪽지</a> <a
								href="${pageContext.request.contextPath }/mypage/list/send"
								class="list-group-item">보낸 쪽지</a> <a
								href="${pageContext.request.contextPath }/mypage/list/insert"
								class="list-group-item">쪽지 보내기</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-10">
					<div class="row">
					</div>
					<table class="table"></table>
					<div class="row">
						<div class="col-md-6"></div>
						<div class="col-md-2">
							<select name="sType" class="form-control">
								<option value="a" ${param.sType eq "a" ? "selected" : "" }>전체
								<option value="tc" ${param.sType eq "tc" ? "selected" : "" }>제목+내용								
								<option value="t" ${param.sType eq "t" ? "selected" : "" }>제목
								<option value="c" ${param.sType eq "c" ? "selected" : "" }>내용								
							</select>
						</div>
						<div class="col-md-3">
							<input type="hidden" name="page" value="1"> <input
								type="text" name="sKeyword" class="form-control"
								value="${param.sType ne 'wn' ? param.sKeyword : '' }">
						</div>
						<div class="col-md-1">
							<input id="search" type="submit" value="검색"
								class="btn btn-primary">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<nav class="text-center">
								<ul class="pagination">
								</ul>
							</nav>
						</div>
				</div>
				</div>
			</div>
		</div>
</section>