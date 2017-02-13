<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>
<style>
	.inline-form {
		display: inline-block;
	}
	
	#content img {
		max-width: 100% !important;
	}

	.modal {
	  text-align: center;
	  padding: 0!important;
	}
	
	.modal:before {
	  content: '';
	  display: inline-block;
	  height: 100%;
	  vertical-align: middle;
	  margin-right: -4px;
	}
	
	.modal-dialog {
	  display: inline-block;
	  text-align: left;
	  vertical-align: middle;
	}
	.panel-heading .h3, .panel-body, .cmt-content{
		word-wrap: break-word;
	}
	.goldenrod {
		color: goldenrod !important; /* TODO: 수정 필요 */
		cursor: pointer;
	}
	.material-icons {
		font-size: 20px;
		vertical-align: middle;
	}
	.report-icon,
	.recommend-icon,
	.nonrecommend-icon {
		font-size: 15px;
		cursor: pointer;
	}
	.orange {
		color: orange;
	}
	
	.next-list, .prev-list {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	.board-next-icon,
	.board-prev-icon,
	.board-list-icon {
		color: #aaa;
	}
	
	.panel-default>.panel-heading.panel-white {
		background: #fff;
	}
	.title.h5 {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
	}
	.panel-footer {
		background: #fff;
		border: none;
	}
	
	.panel-default>.panel-heading .badge.comment-count {
		background: #0275d8;
	}
	button.btn-memo {
		background: none;
		border: none;
		margin-bottom: 5px;
	}
	button.btn-default.btn-memo:hover,
	button.btn-default.btn-memo:active,
	button.btn-default.btn-memo:focus {
		background: none;
		border: none;    
		webkit-box-shadow: none;
   box-shadow: none;
   outline: none;
	}
	.custom-list form,
	.custom-list>a {
		margin-bottom: 5px;
	}
	
</style>

<section class="container container-top">
	<div class="row sidemenu-top">
	
		<div class="col-md-2 custom-list">
			<div class="list-group has-shadow">
				<c:if test="${not empty prevNextInfo.nextBno }">
					<a href="${pageContext.request.contextPath }/board/${boardArticle.btCode}/${prevNextInfo.nextBno}${queryInfo.makeQuery(param.page, param.sType, param.sKeyword) }" class="list-group-item next-list">
						<span class="glyphicon glyphicon-chevron-up board-next-icon" aria-hidden="true"></span>&nbsp; 
						${prevNextInfo.nextTitle }
					</a>
				</c:if>
				<c:if test="${empty prevNextInfo.nextBno }">
					<a class="list-group-item next-list disabled">
						다음글이 없습니다
					</a>
				</c:if>
				<a href="${pageContext.request.contextPath }/board/${boardArticle.btCode}${queryInfo.makeQuery(param.page, param.sType, param.sKeyword) }" class="list-group-item">
					<span class="glyphicon glyphicon-th-list board-list-icon" aria-hidden="true"></span>&nbsp; 
					목록
				</a>
				<c:if test="${not empty prevNextInfo.prevBno }">
					<a href="${pageContext.request.contextPath }/board/${boardArticle.btCode}/${prevNextInfo.prevBno}${queryInfo.makeQuery(param.page, param.sType, param.sKeyword) }" class="list-group-item prev-list">
						<span class="glyphicon glyphicon-chevron-down board-prev-icon" aria-hidden="true"></span>&nbsp; 
						${prevNextInfo.prevTitle }
					</a>
				</c:if>
				<c:if test="${empty prevNextInfo.prevBno }">
					<a class="list-group-item next-list disabled">
						이전글이 없습니다
					</a>
				</c:if>
			</div>
			<c:if test="${loginUser.memNo eq boardArticle.writerNo}">
				<form:form method="delete" action="${boardArticle.bno }">
					<input type="submit" value="삭제" class="btn btn-danger btn-block">
				</form:form>
				<a href="${boardArticle.bno }/edit${queryInfo.makeQuery(param.page, param.sType, param.sKeyword) }" class="btn btn-default btn-block">수정</a>
			</c:if>
		</div>
		
		<div class="col-md-10">
			<div class="panel panel-default has-shadow">
				<div class="panel-heading panel-white">
					
					<div class="row">
						<div class="col-md-12 title"><strong><c:out value="${boardArticle.title }" /></strong></div>
						<div class="col-md-12 h5"> 작성자 : ${not empty boardArticle.pscHtmlTag? boardArticle.pscHtmlTag :'<i class="material-icons">face</i>'}${boardArticle.writerNickname }
							<c:if test="${! empty loginUser and (loginUser.memNo ne boardArticle.writerNo)}">
							
						  <button type="button" class="btn btn-default btn-memo" data-toggle="modal" data-target="#myMemo">
						    <span class="glyphicon glyphicon-comment memo-icon" aria-hidden="true"></span>
						  </button>
								
							</c:if>
						</div>
						<div class="col-md-12">날짜 : <fmt:formatDate value="${boardArticle.regDate }" pattern="yyyy/MM/dd HH:mm:ss"/></div>
					</div>
					
				</div>
				<div class="panel-body" id="content">
					${boardArticle.content }
				</div>
				<div class="panel-footer">
					<div class="text-center vcenter">
						<span class="glyphicon glyphicon-thumbs-up recommend-icon" aria-hidden="true"></span>
						<span class="score">${boardArticle.score }</span>	
						<span class="glyphicon glyphicon-thumbs-down nonrecommend-icon" aria-hidden="true"></span>
						<span class="glyphicon glyphicon-bell report-icon pull-right" aria-hidden="true"></span>
					</div>
				</div>
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
								<c:if test="${comment.writerNo eq loginUser.memNo}">
									<form:form method="delete" action="${boardArticle.bno }/cmt/${comment.cno }${queryInfo.makeQuery(param.page, param.sType, param.sKeyword) }" cssClass="inline-form pull-right">
										<input type="submit" value="삭제" class="btn btn-danger btn-xs">
									</form:form>
									<a class="btn btn-info btn-xs pull-right cmt-mod" data-cno="${comment.cno }" data-toggle="modal" data-target="#myModal">수정</a>
								</c:if>
							</div>
						</li>
					</c:forEach>
					<c:if test="${empty commentList}">
						<li class="list-group-item">작성된 댓글이 없습니다.</li>
					</c:if>
				</ul>
			</div>
			
			<c:if test="${!empty commentList}">
				<nav class="text-center">
					<ul class="pagination pagination-sm">
						<li ${pageInfo.hasPrev ? "":"class='disabled'"}>
							<a <c:if test="${pageInfo.hasPrev }">
								href="${queryInfo.makeQuery(page, pageInfo.startPage - 1, param.sType, param.sKeyword) }"</c:if>
								 aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<c:forEach var="cpage" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
							<li ${cpage eq param.cpage or (param.cpage eq null and cpage eq 1) ? "class='active'":"" }>
								<a <c:if test="${!(cpage eq param.cpage or (param.cpage eq null and page eq 1)) }">
									href='${queryInfo.makeQuery(page, cpage, param.sType, param.sKeyword) }'
								</c:if>>${cpage }</a>
							</li>
						</c:forEach>
						<li  ${pageInfo.hasNext ? "":"class='disabled'"}>
							<a <c:if test="${pageInfo.hasNext }">
								href="${queryInfo.makeQuery(page, pageInfo.endPage + 1, param.sType, param.sKeyword) }"</c:if> 
									aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
				</nav>
			</c:if>
		</div>
	</div>
<!-- TODO : 댓글 등록 버튼 클릭 후 작성으로 변경 -->



<%-- 	<div class="panel panel-default">
		<div class="panel-heading">${boardArticle.bno } 
			<span class="pull-right"><fmt:formatDate value="${boardArticle.regDate }" pattern="yyyy/MM/dd HH:mm:ss"/></span>
			<span class="pull-right"><a>${boardArticle.writerNickname }</a> &nbsp; &nbsp; </span>
			<div class="h3"><c:out value="${boardArticle.title }" /></div>
			</div>
		<div class="panel-body" id="content">
			${boardArticle.content }
		</div>
	</div>
	
	<a href="${pageContext.request.contextPath }/board/${boardArticle.btCode}${queryInfo.makeQuery(param.page, param.sType, param.sKeyword) }" class="btn btn-default">목록</a>
	
	<c:if test="${loginUser.memNo eq boardArticle.writerNo}">
		<form:form method="delete" action="${boardArticle.bno }" cssClass="inline-form">
			<input type="submit" value="삭제" class="btn btn-danger">
		</form:form>
		<a href="${boardArticle.bno }/edit${queryInfo.makeQuery(param.page, param.sType, param.sKeyword) }" class="btn btn-default">수정</a>
	</c:if>
	
	<form action="${boardArticle.bno }/cmt/new/${queryInfo.makeQuery(param.page, param.sType, param.sKeyword) }" method="post">
		<p class="form-group">
			<label for="content">댓글 작성</label>
			<textarea class="form-control" name="content" id="content" rows="3" required="required"></textarea>
			<input type="submit" value="댓글 등록" class="btn btn-default btn-sm btn-block">
		</p>
	</form>
	
	<div class="panel panel-info">
		<div class="panel-heading">댓글</div>
		<ul class="list-group">
			<c:forEach var="comment" items="${commentList }">
				<li class="list-group-item">
					<div>
						<span class="cmt-writer">작성자 : ${comment.writerNickname }</span>
						<span class="pull-right">${comment.regDate }</span>
					</div>
					<div>
						<span class="cmt-content"><c:out value="${comment.content }" /></span>
						<c:if test="${comment.writerNo eq loginUser.memNo}">
							<form:form method="delete" action="${boardArticle.bno }/cmt/${comment.cno }${queryInfo.makeQuery(param.page, param.sType, param.sKeyword) }" cssClass="inline-form pull-right">
								<input type="submit" value="삭제" class="btn btn-danger btn-xs">
							</form:form>
							<a class="btn btn-info btn-xs pull-right cmt-mod" data-cno="${comment.cno }" data-toggle="modal" data-target="#myModal">수정</a>
						</c:if>
					</div>
				</li>
			</c:forEach>
			<c:if test="${empty commentList}">
				<li class="list-group-item">작성된 댓글이 없습니다.</li>
			</c:if>
		</ul>
	</div>
	
	<c:if test="${!empty commentList}">
		<nav class="text-center">
		<ul class="pagination pagination-sm">
			<li ${pageInfo.hasPrev ? "":"class='disabled'"}>
				<a <c:if test="${pageInfo.hasPrev }">
					href="${queryInfo.makeQuery(page, pageInfo.startPage - 1, param.sType, param.sKeyword) }"</c:if>
					 aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			<c:forEach var="cpage" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
				<li ${cpage eq param.cpage or (param.cpage eq null and cpage eq 1) ? "class='active'":"" }>
					<a <c:if test="${!(cpage eq param.cpage or (param.cpage eq null and page eq 1)) }">
						href='${queryInfo.makeQuery(page, cpage, param.sType, param.sKeyword) }'
					</c:if>>${cpage }</a>
				</li>
			</c:forEach>
			<li  ${pageInfo.hasNext ? "":"class='disabled'"}>
				<a <c:if test="${pageInfo.hasNext }">
					href="${queryInfo.makeQuery(page, pageInfo.endPage + 1, param.sType, param.sKeyword) }"</c:if> 
						aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</ul>
		</nav>
	</c:if> --%>
	
	
						
	<!-- 모달 시작 -->
	<div id="myMemo" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">${boardArticle.writerNickname }</h4>
				</div>
				<div class="modal-body">
					<textarea class="form-control memo-content" style="min-width: 100%"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="btn-memo-mod">확인</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" id="btn-memo-del">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 끝 -->
	
	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">댓글 수정</h4>
        </div>
        <div class="modal-body">
          	<textarea class="form-control" name="content" id="mod-content" rows="3" required="required"></textarea>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" id="mod" data-dismiss="modal">수정</button>
        </div>
      </div>
    </div>
  </div>
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
  		
  		var memo = {};
  		
  		if('${loginUser.memNo}'.length > 0 && '${loginUser.memNo}' === '${boardArticle.writerNo}' ) {
				$(".report-icon").remove();
  		}
  		
  		if('${loginUser.memNo}'.length > 0) {
	   		$.getJSON("${ pageContext.request.contextPath }/memo/${boardArticle.writerNo}" , function(data){
	   			if(data != null) {
	   				$(".btn-memo").addClass("goldenrod");
	   				memo.content = data.content;
	   			}
	   		});
  		}
   		
   		$(".panel-heading").on("click", ".goldenrod", function(){
   			$(".modal-body .form-control").text(memo.content);
   		});
   		
   		$("#btn-memo-mod").on("click", function(){
   			if(!($(".btn-memo").hasClass("goldenrod"))) {
   				$.ajax({
						url: '${ pageContext.request.contextPath }/memo/${boardArticle.writerNo}/new',
						type: 'post',
						headers : {
							'Content-Type': 'application/json',
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'text',
						data : JSON.stringify({
							"content": $(".memo-content").val()
						}),
						success : function() {
			   			$(".btn-memo").addClass("goldenrod");
						}
					});
   			} else {
					$.ajax({
						url: '${ pageContext.request.contextPath }/memo/${boardArticle.writerNo}',
						type: 'put',
						headers: {
					        'Content-Type': 'application/json',
					        "X-HTTP-Method-Override" : 'PUT'},
						dataType : 'text',
						data : JSON.stringify({
							"content": $(".memo-content").val()
						}),
						success : function() {}
					});
   			}
   		});
   		
   		$("#btn-memo-del").on("click", function(){
   			$.ajax({
					url: '${ pageContext.request.contextPath }/memo/${boardArticle.writerNo}',
					type: 'delete',
					headers: {"X-HTTP-Method-Override": "DELETE"},
					success : function() {
			   		$(".btn-memo").removeClass("goldenrod");
			   		$(".memo-content").val("");
					}
				});
   		});
   		
   		
   		var existsReport = 0;
   		
   		if('${loginUser.memNo}'.length > 0) {
	   		$.getJSON("${boardArticle.bno }/reportChk", function(data){
	   			existsReport = data;
	   			if(existsReport === 0) {
	   				$(".report-icon").addClass('orange');
	   			} else {
   		   		$(".report-icon").remove();
	   			}
	   		});
	   		
	   		$(".report-icon").on("click", function(){
					var flag = confirm("정말로 신고하시겠습니까?");
	   			if(existsReport === 0 && flag) {
		   			$.ajax({
		   				url: "${boardArticle.bno }/report",
		   				success: function(data) {
		   					if(data == 'success') {
		   						alert('신고 성공');
		   		   			//$(".report-icon").removeClass('orange');
		   		   			$(".report-icon").remove();
		   					} else {
		   						alert('신고 실패');
		   					}
		   				},
		   				error: function(e) {
		   					console.log(e);
		   				}
		   			});
   				} 
   			});
   		}

   		

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
  
</section>