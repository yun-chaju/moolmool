<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.dropdown {
		float: left;
		padding-right: 10px;
	}
	
</style>
<script>
	$(document).ready(function() {
		$.getJSON("${ pageContext.request.contextPath }/admin/boards/btype", function(data){
			if(data.length > 0){
				$(".boardtype").html('<option value=\'all\'>전체</option>');
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
		var uri = "${ pageContext.request.contextPath }/admin/boards/" + $(".boardtype").val();
		var param = "";
		
		if(page > 1 || (sType.length > 0 && sKeyword.length > 0)){
			param = "?page=" + page + "&sType=" + sType + "&sKeyword=" + sKeyword;
			uri = uri + param;
		}
		$.getJSON(uri, function(data){
			console.log(data);
			var textcenter = "class='text-center'";
			$("table").html("<tr><th class='text-center'>게시물 유형</th><th class='text-center'>제목</th><th class='text-center'>작성자</th><th class='text-center'>신고</th><th class='text-center'>상태</th><th class='text-center'>날짜</th>");
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
					var detailLink = "href='${pageContext.request.contextPath }/admin/boards/" + this.btCode + "/" 
									+ this.bno + param + "'";
					var cCount = "";
					var label = "<span class='label label-success'>정상</span>";
					if(this.isDeleted == 'Y'.charAt(0)){
						label = "<span class='label label-danger'>삭제</span>";
					}
					if(this.cmtCount != 0){
							cCount = this.cmtCount;
					}
					$(".table").append("<tr><td class='text-center'>" + this.btCode + "</td><td><a " + detailLink + ">"
							+ this.title + "<span class='badge'>" + cCount + "</span></a></td><td class='text-center'>" + this.writerNickname 
							+ "</td><td class='text-center'>" + this.reportCount + "</td><td class='text-center'>" + label + "</td><td class='text-center'>"
							+ this.regDate + "</td></tr>");
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
	<div class="admin-menu"> 
		<ul class="nav nav-pills nav-stacked menu-option">
			<li role="presentation">
				<a href="${pageContext.request.contextPath }/admin"><i class="material-icons menu-icon">dvr</i>&nbsp;&nbsp;&nbsp;<span>Dashboard</span></a>
			</li>
			<li role="presentation">
				<a href="${pageContext.request.contextPath }/admin/members"><i class="material-icons menu-icon">people</i>&nbsp;&nbsp;&nbsp;<span>회원관리</span></a>
			</li>
			<li role="presentation" class="active">
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
	<div class="admin-content" >
		<div class="panel panel-success">
			<div class="panel-heading">
				<i class="material-icons heading-icon">sms</i>&nbsp;커뮤니티 관리
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-2">
						<select class="form-control boardtype"></select>
					</div>
				</div>
				<table class="table"></table>
				<div class="row">
					<div class="col-md-8"></div>
					<div class="col-md-1">
						<select name="sType" class="form-control">
							<option value="a" ${param.sType eq "a" ? "selected" : "" }>전체
							<option value="tc" ${param.sType eq "tc" ? "selected" : "" }>제목+내용
							<option value="t" ${param.sType eq "t" ? "selected" : "" }>제목
							<option value="c" ${param.sType eq "c" ? "selected" : "" }>내용
							<option value="w" ${param.sType eq "w" ? "selected" : "" }>닉네임
						</select>
					</div>
					<div class="col-md-2">
						<input type="hidden" name="page" value="1">
						<input type="text" name="sKeyword" class="form-control" value="${param.sType ne 'wn' ? param.sKeyword : '' }">
					</div>
					<div class="col-md-1">
						<input id="search" type="submit" value="검색" class="btn btn-primary">
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