<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
	.panel-default>.panel-heading.panel-white {
		background: #fff;
	}
	.title.h5 {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
	}
	.material-icons {
		font-size: 20px;
		vertical-align: middle;
	}
	.singo {
		margin-top: 10px;
	}
</style>
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
		<div class="panel panel-default">
			<div class="panel-heading panel-white">
				<div class="row">
					<div class="col-md-12 title"><strong><c:out value="[${ bTypeName }]${boardArticle.title }" /></strong></div>
						<div class="col-md-12 h5"> 작성자 : ${not empty boardArticle.pscHtmlTag? boardArticle.pscHtmlTag :'<i class="material-icons">face</i>'}${boardArticle.writerNickname }</div>
						<div class="col-md-12">날짜 : <fmt:formatDate value="${boardArticle.regDate }" pattern="yyyy/MM/dd HH:mm:ss"/></div>
						<div class="col-md-12 singo">신고 : ${ boardArticle.reportCount }</div>
				</div>
			</div>
			<div class="panel-body">
				${boardArticle.content }
			</div>
			<div class="panel-footer">
					<div class="text-center vcenter">
						<span class="glyphicon glyphicon-thumbs-up recommend-icon" aria-hidden="true"></span>
						<span class="score">${boardArticle.score }</span>	
						<span class="glyphicon glyphicon-thumbs-down nonrecommend-icon" aria-hidden="true"></span>
					</div>
				</div>
		</div>
		<div class="row">	
			<div class="col-xs-5"></div>
			<div class="col-xs-1">
				<form:form method="delete" action="${pageContext.request.contextPath }/admin/boards/${ boardArticle.btCode }/${ boardArticle.bno }">
					<input type="submit" value="삭제" class="btn btn-danger btn-block">
				</form:form>
			</div>
			<div class="col-xs-1">
				<a href="${boardArticle.bno }/edit${queryInfo.makeQuery(param.page, param.sType, param.sKeyword) }" class="btn btn-default btn-block">수정</a>	
			</div>
			<div class="col-xs-5"></div>
		</div>	
		
		<form action="${boardArticle.bno }/cmt/new/${queryInfo.makeQuery(param.page, param.sType, param.sKeyword) }" method="post">
				<p class="form-group">
					<label for="content">댓글 작성</label>
					<textarea class="form-control" name="content" id="content" rows="3" required="required"></textarea>
					<input type="submit" value="댓글 등록" class="btn btn-default btn-sm btn-block">
				</p>
			</form>
			
			<div class="panel panel-default has-shadow">
				<div class="panel-heading panel-white"><strong>댓글&nbsp; </strong><span class="badge comment-count"><!-- TODO 댓글 갯수 --></span></div>
				<ul class="list-group">
					<c:forEach var="comment" items="${commentList }">
						<li class="list-group-item">
							<div>
								<span class="cmt-writer">${not empty boardArticle.pscHtmlTag? boardArticle.pscHtmlTag :'<i class="material-icons">face</i>'}${comment.writerNickname }</span>
								<span class="pull-right">${comment.regDate }</span>
							</div>
							<div>
								<span class="cmt-content"><c:out value="${comment.content }" /></span>
									<form:form method="delete" action="${boardArticle.bno }/cmt/${comment.cno }${queryInfo.makeQuery(param.page, param.sType, param.sKeyword) }" cssClass="inline-form pull-right">
										<input type="submit" value="삭제" class="btn btn-danger btn-xs">
									</form:form>
									<a class="btn btn-info btn-xs pull-right cmt-mod" data-cno="${comment.cno }" data-toggle="modal" data-target="#myModal">수정</a>
							</div>
						</li>
					</c:forEach>
					<c:if test="${empty commentList}">
						<li class="list-group-item">작성된 댓글이 없습니다.</li>
					</c:if>
				</ul>
			</div>
	</div>
</section>
<script>
	$(function(){
		$(".cmt-mod").on("click", function(){
  			$("#mod-content").val($(this).siblings(".cmt-content").text());
  			$("#mod-content").data('cno', ""+$(this).data("cno")+"");
  		});
  		
  		$("#mod").on("click", function(){
  			$.ajax({
  				type: 'PUT',
  				url: '' + location.pathname + "/cmt/" + $("#mod-content").data("cno") + '',
  				data:$("#mod-content").val(),
  				dataType: 'text',
  				success: function(data) {
  					if(data === 'true') {
  						$("[data-cno="+$("#mod-content").data("cno")+"]")
  							.siblings(".cmt-content").text($("#mod-content").val());
  					} else {
  						alsert('댓글 수정 실패');
  					}
  				}
  			});
  		});
  		
  		var insertEvaluateBoard = function(eType){
   			$.ajax({
   				url: "${boardArticle.bno }/evaluate",
   				type: 'post',
					dataType : 'text',
					headers : {
						'Content-Type': 'application/json',
						"X-HTTP-Method-Override" : "POST"
					},
					data : JSON.stringify({
						'eType': eType
					}),
   				success: function(data) {
   					if(data == 'success') {
   		   			$(".recommend-icon").remove();
   		   			$(".nonrecommend-icon").remove();
   		   			if(eType === 'LIKE') {
   	   		   		$(".score").text(Number($(".score").text()) + 1);
   		   			} else {
   		   				$(".score").text(Number($(".score").text()) - 1);
   		   			}
   					} else {
   						// 실패
   					}
   				},
   				error: function(e) {
   					console.log(e);
   				}
   			});
   		}
   		
   		var existsEvaluate = 0;
   		
   		if('${loginUser.memNo}'.length > 0) {
   			$.getJSON("${boardArticle.bno }/evaluateChk", function(data){
   				existsEvaluate = data;
   				if(existsEvaluate > 0) {
   					$(".recommend-icon").remove();
   					$(".nonrecommend-icon").remove();
   		   	}
   			});
   		}
   			
	   	$(".recommend-icon").on("click", function(){
				var flag = confirm("해당 게시물을 추천하시겠습니까?");
				if(existsEvaluate === 0 && flag) {
					insertEvaluateBoard('LIKE');
	   		} 
	   	});
	   	
	   	$(".nonrecommend-icon").on("click", function(){
				var flag = confirm("해당 게시물을 비추하시겠습니까?");
				if(existsEvaluate === 0 && flag) {
					insertEvaluateBoard('UNLIKE');
	   		} 
	   	});
	});
</script>