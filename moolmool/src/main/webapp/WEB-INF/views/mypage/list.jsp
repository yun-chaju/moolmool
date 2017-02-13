<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<section class="container container-top">
<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<h4 class="visible-md-block visible-lg-block">
				<strong>&nbsp;</strong>
			</h4>
		</div>
		</div>
	<div class="row">
		<div class="col-md-2">
			<div class="container-fluid r1">
				<div class="row">
					<div class="list-group">
						<div class="list-group has-shadow">
							<a href="${pageContext.request.contextPath }/mypage" class="list-group-item">내 정보 보기</a>
							<a href="${ pageContext.request.contextPath }/mypage/myBoard" class="list-group-item">내 게시글</a>
<!-- 							<a href="#" class="list-group-item">찜 목록</a>
							<a href="#" class="list-group-item">물물교환 목록</a> -->
							<p>	
						</div>
						<div class="list-group has-shadow">
							<c:set var="length" value="${fn:length('/moolmool/mypage/list/')}" />
							<c:set var="uri" value="${fn:length(requestScope['javax.servlet.forward.request_uri'])}" />
							<c:set var="string" value="${fn:substring(requestScope['javax.servlet.forward.request_uri'], length, uri)}" />
							
							<a href="${pageContext.request.contextPath }/mypage/list/receive" class="list-group-item ${string eq 'receive' ? 'active' : '' }">받은 쪽지</a>
							<a href="${pageContext.request.contextPath }/mypage/list/send" class="list-group-item ${string eq 'send' ? 'active' : '' }">보낸 쪽지</a>
							<a href="${pageContext.request.contextPath }/mypage/list/insert" class="list-group-item">쪽지 보내기</a>
						</div>
					
<%-- 						<a id="chk" href="${pageContext.request.contextPath }/mypage/list/receive"
							class="list-group-item text-center">받은쪽지함</a> <a
							href="${pageContext.request.contextPath }/mypage/list/send"
							class="list-group-item text-center">보낸쪽지함</a> --%>
					</div>
				</div>
<!-- 				<div class="row">
					<a href="insert" style="display: block;" class="btn btn-primary"
						role="button">쪽지보내기</a>
				</div> -->
			</div>
		</div>
		<div class="col-md-10">
			<div class="container-fluid">
				<div class="row">
					<a id="dbtn" type="button" href="" class="btn btn-default btn-md glyphicon glyphicon-trash"></a>
				</div>
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="col-md-1 text-center">
											<span class="input-group input-group-sm">
												<input id="checkAll" type="checkbox"></span></th>
										<c:if test="${each.rid != check }">
											<th class="col-md-2">보낸사람</th>
										</c:if>
										<c:if test="${each.rid == check }">
											<th class="col-md-2">받는사람</th>
										</c:if>
										<th class="col-md-5">내용</th>
										<c:if test="${each.rid != check }">
											<th class="col-md-2">수신날짜</th>
										</c:if>
										<c:if test="${each.rid == check }">
											<th class="col-md-2">전송날짜</th>
											<th class="col-md-2">확인</th>
										</c:if>
										
									</tr>
								</thead>
								<tbody>
									<c:forEach var="each" items="${msgList}" varStatus="status">
										<c:set value="${status.index }" var="in" />
										<tr>
											<td><input type="checkbox" name="check${in}" value="${each.mno }"></td>
											<c:if test="${each.rid != check }">
												<td>${each.rnick }</td>
											</c:if>
											<c:if test="${each.rid == check }">
												<td>${each.snick }</td>
											</c:if>
											<c:if test="${each.parentMno == 0 }">
												<c:if test="${each.isOpened eq 'N'.charAt(0)}">
													<td><a href="${each.mno}">${each.title}</a></td>
												</c:if>
												<c:if test="${each.isOpened eq 'Y'.charAt(0)}">
													<td><a href="${each.mno}" style="color: gray;">${each.title}</a></td>
												</c:if>
											</c:if>
											<c:if test="${each.parentMno > 0 }">
												<c:if test="${each.isOpened eq 'N'.charAt(0) }">
													<c:if test="${each.rid != check }">
														<td><a href="${each.mno}">${each.title}</a></td>
													</c:if>
													<c:if test="${each.rid == check }">
														<td><a href="#" class="btn btn-default btn-xs disabled">답장</a>&nbsp;<a href="${each.mno}">${each.title}</a></td>
													</c:if>
												</c:if>
												<c:if test="${each.isOpened eq 'Y'.charAt(0)}">
													<c:if test="${each.rid != check }">
														<td><a href="${each.mno}" style="color: gray;">${each.title}</a></td>
													</c:if>
													<c:if test="${each.rid == check }">
														<td><a href="#" class="btn btn-default btn-xs disabled">답장</a>&nbsp;<a href="${each.mno}" style="color: gray;">${each.title}</a></td>
													</c:if>
												</c:if>
											</c:if>
											
											<c:if test="${each.rid == check }">
												<td><fmt:formatDate value="${each.sendDate}" type="both"
													timeStyle="short" /></td>
											</c:if>
											<c:if test="${each.rid != check }">
												<td style="font-size:10pt"><fmt:formatDate value="${each.sendDate}" type="both"
													timeStyle="short" /></td>
												<c:if test="${each.isOpened eq 'N'.charAt(0)}">
													<td class="text-center" style="font-size:10pt"><a href="#" class="btn btn-default btn-xs disabled">읽지않음</a></td>		
												</c:if>
												<c:if test="${each.isOpened eq 'Y'.charAt(0)}">
													<td style="font-size:9pt"><fmt:formatDate value="${each.openDate}" type="both"
													timeStyle="short" /></td>	
												</c:if>
											</c:if>
											
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<nav class="text-center">
					<ul class="pagination">
						<li ${pageInfo.hasPrev ? "":"class='disabled'"}><a
							<c:if test="${pageInfo.hasPrev }">
				 href="${queryInfo.makeQuery(pageInfo.startPage - 1, param.sType, param.sKeyword) }"</c:if>
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach var="page" begin="${pageInfo.startPage }"
							end="${pageInfo.endPage }">
							<li
								${page eq param.page or (param.page eq null and page eq 1) ? "class='active'":"" }>
								<a
								<c:if test="${!(page eq param.page or (param.page eq null and page eq 1)) }">
					href='${queryInfo.makeQuery(page, param.sType, param.sKeyword) }'
				</c:if>>${page }</a>
							</li>
						</c:forEach>
						<li ${pageInfo.hasNext ? "":"class='disabled'"}><a
							<c:if test="${pageInfo.hasNext }">
				href="${queryInfo.makeQuery(pageInfo.endPage + 1, param.sType, param.sKeyword) }"</c:if>
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			/* alert( ${requestScope["javax.servlet.forward.request_uri"]}); */
			var checkValues = new Array();

			$('#checkAll').click(function(){
								if($('#checkAll').prop("checked")) {
									for (var i = 0; i < '<c:out value="${ msgList.size()}"/>'; i++) {
										$('input[name=check'+ i +']').prop("checked", true);
										/* checkValues.push($(this).val()); */
									}
								} else {
									for (var i = 0; i < '<c:out value="${ msgList.size()}"/>'; i++) {
										$('input[name=check' + i + ']').prop("checked", false);
									}
								}
							});

			$('#dbtn').click(
							function() {
								for (var i = 0; i < '<c:out value="${ msgList.size()}"/>'; i++) {
									if ($('input[name=check' + i + ']').is(":checked") == true) {
										checkValues.push($('input[name=check' + i + ']').val());
									}
								}
								console.log($('#chk').text());
								
								
								$.ajax({
										url : "delete",
										data : {"array" : checkValues},
										type : "post",
										async : false,
										error : function(xhr, status, errormsg) {
												alert('Failed!' + errormsg);
												},
											success : function(data) {
												for (var i = 0; i < '<c:out value="${ msgList.size()}"/>'; i++) {
													$('input[name=check'+ i	+ ']:checked').parents("tr").remove();
												}
												if ($('#checkAll').is(":checked") == true) {
													$('#checkAll').prop("checked", false);
												}
												$.ajax({
													url: "receive"
												});
												
											}
										});
							});

		});
	</script>





</section>