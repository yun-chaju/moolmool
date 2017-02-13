<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <style>
    	@media (min-width:769px){
    		.panel-default{
    			padding : 10px 10px 10px 10px;
    			height : 80%;
    		}
    	}
    	h1{
    		text-align:center;
    		margin : 20px;
    	}
    	
    	h4, h5, h3{
    		text-align:center;
    		margin : 5px 5px 5px 5px;
    	}
    	
    	.btn-primary{
    		width : 100%;
    	}
    	
    	#loger{
    		text-align : left;
    	}
    	
    	#point{
    		text-align : right;
    	}
    	
    	#red{
    		color: red;
    	}
    	
    	#green{
    		color : green;
    	}
    
    </style>
    
<section class="container container-top">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-10">
				<a class="btn btn-default" href="${ pageContext.request.contextPath }/member/update" >회원정보 수정하기</a>
		</div>
		<div class="col-md-2">
			<div class="list-group has-shadow">
				<a href="${ pageContext.request.contextPath }/mypage" class="list-group-item active">내 정보 보기</a>
				<a href="${ pageContext.request.contextPath }/mypage/myBoard" class="list-group-item">내 게시글</a>
<!-- 				<a href="#" class="list-group-item">찜 목록</a>
				<a href="#" class="list-group-item">물물교환 목록</a> -->
				<p>
			</div>
			<div class="list-group has-shadow">
				<a href="${ pageContext.request.contextPath }/mypage/list/receive" class="list-group-item">받은 쪽지</a>
				<a href="${ pageContext.request.contextPath }/mypage/list/send" class="list-group-item">보낸 쪽지</a>
				<a href="${ pageContext.request.contextPath }/mypage/list/insert" class="list-group-item">쪽지 보내기</a>
			</div>		
		</div>

		<div class="col-md-10">
			<div class="panel panel-default">
				<h1><span><label>${loginUser.nickName }</label></span></h1>
				<div class="article col-md-6">
					<div class="panel panel-info">
						<div class="panel-heading"><h4><span class="glyphicon glyphicon-user"></span>&nbsp;<label>식별자</label></h4></div>
						<div class="panel-body">
							<div class="article col-md-6">
								<h5><label>ID</label></h5>
								<h4><label>${loginUser.id }</label></h4>
							</div>
							<div class="article col-md-6">
								<h5><label>이름</label></h5>
								<h4><label>${loginUser.name }</label></h4>
							</div>
						</div>
					</div>
				</div>
				<div class="article col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading"><h4><span class="glyphicon glyphicon-envelope"></span>&nbsp;<label>연락처</label></h4></div>
						<div class="panel-body">
							<div class="article col-md-6">
								<h5><label>전화번호</label></h5>
								<h4><label>${loginUser.phone }</label></h4>
							</div>
							<div class="article col-md-6">
								<h5><label>이메일</label></h5>
								<c:if test="${loginUser.email ne null }">
								<h5><label>${loginUser.email }</label></h5>
								</c:if>
								<c:if test="${loginUser.email eq null }">
								<h5><label>이메일 없음</label></h5>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<div class="article col-md-6">
					<div class="panel panel-success">
						<div class="panel-heading"><h4><span class="glyphicon glyphicon-home"></span>&nbsp;<label>주소</label></h4></div>
						<div class="panel-body">
							<h5><label>지번 주소</label></h5>
							<h4><label>${loginUser.jibunAddr }</label></h4>
							<br>
							<h5><label>도로명 주소</label></h5>
							<h4><label>${loginUser.roadAddrPart }</label></h4>
							<br>
							<h5><label>나머지 주소</label></h5>
							<h4><label>${loginUser.addrDetail }</label></h4>
						</div>
					</div>
				</div>
				<div class="article col-md-6">
					<div class="panel panel-danger">
						<div class="panel-heading"><h4><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;<label>포인트</label></h4></div>
						<div class="panel-body">
							<h5><label>현재 포인트</label></h5>
							<h4><label>${loginUser.point }</label></h4>
							<br>
							<h5><label>포인트 증감 내역</label></h5>
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">내역 보기</button>
							<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  								<div class="modal-dialog modal-sm">
    								<div class="modal-content">
    									<div class="modal-header">
    										<h4 class="modal-title" id="myModalLabel">포인트 내역</h4>
    									</div>
    									<div class="modal-body">
    										<c:forEach var="logs" items="${log }">
    											<h4 id="loger">${logs.pointDate}  ${logs.log }</h4>
    											<h4 id="point">
    											<c:if test="${logs.addEli eq 'a'.charAt(0)}">
    												<span id="green">+${logs.pointChange }</span>
    											</c:if>
    											<c:if test="${logs.addEli eq 'e'.charAt(0)}">
    												<span id="red">-${logs.pointChange }</span>
    											</c:if>
    											</h4>    											
    											<p>
    										</c:forEach>
    									</div>
    									<div class="modal-footer">
    										<h5>내역은 20개 까지 표시 됩니다.</h5>
    									</div>
    								</div>
  								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>