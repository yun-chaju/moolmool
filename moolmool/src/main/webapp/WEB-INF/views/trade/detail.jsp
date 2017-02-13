<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Ml2NLFK53C_BTMBkFqeD"></script>
<style>
.active a {
	color: #fff;
}

div.r1 {
	padding-top: 39px;
}

span.re-label {
	width: 60px;
}

div.top-padding {
	padding-right: 0px;
	padding-left: 0px;
}

.panel-body {
	padding: 50 30 50 30;
	border: 0 solid white;
	box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.3);
	border-radius: 4px;
	background-color: fff;
}

.tradeDetail{
	font-size: 15px;
}
i.material-icons {
	font-size: 34px;
}

.material-icons.md-34 { font-size: 34px; }
</style>
</head>
<body>
	<section class="container container-top">
		<h4 class="visible-md-block visible-lg-block" style="font-size: 16px;">
			<strong style="margin-left: 10px;">${article.title }</strong>
		</h4>
		<div class="row">
			<div class="panel panel-default">
				<div class="panel-body">
				<!-- 이미지 출력 영역 -->
					<div class="col-md-6">
					
					<c:if test="${not empty article.file1 }"> 
						<div class="col-md-12" style="min-height:350px;margin: 0 0 10 0;"><img src="../viewImg?fileName=${fn:substring(article.file1, 0, 12) }${fn:substring(article.file1, 14, 100) } " alt="main"style="width:100%;height:350px"></div>
					</c:if>
					<c:if test="${empty article.file1 }">
						<div class="col-md-4" style="min-height:350px; min-width:350px; margin: 10 0 0 0;"><img src="http://placehold.it/350x350" style="width:100%;height:350px"></div>
					</c:if>
					
					<c:if test="${not empty article.file1 }">
						<div class="col-md-4" style="min-height:150px;margin: 10 0 0 0;"><img src="../viewImg?fileName=${article.file1 }" style="width:100%;height:150"></div>
					</c:if>	
					<c:if test="${empty article.file1 }">
						<div class="col-md-4" style="min-height:150px;margin: 10 0 0 0;"><img src="http://placehold.it/150x150" style="width:100%;height:150"></div>
					</c:if>
					
					<c:if test="${not empty article.file2 }">
						<div class="col-md-4" style="min-height:150px;margin: 10 0 0 0;"><img src="../viewImg?fileName=${article.file2 }" style="width:100%;height:150"></div>
					</c:if>	
					<c:if test="${empty article.file2 }">						
						<div class="col-md-4" style="min-height:150px;margin: 10 0 0 0;"><img src="http://placehold.it/150x150" style="width:100%;height:150"></div>
					</c:if>
					
					<c:if test="${not empty article.file3 }">
						<div class="col-md-4" style="min-height:150px;margin: 10 0 0 0;"><img src="../viewImg?fileName=${article.file3 }" style="width:100%;height:150"></div>
					</c:if>	
					<c:if test="${empty article.file3 }">
						<div class="col-md-4" style="min-height:150px;margin: 10 0 0 0;"><img src="http://placehold.it/150x150" style="width:100%;height:150"></div>
					</c:if>
					
					<div class="col-md-12" style="text-align: center;margin: 100 0 0 0;">
					${article.pscUrl }
					<p/><p/><p/><strong>${article.writerNickname }</strong></div>
					</div>
				<!-- 내용 출력 영역 -->
					<div class="col-md-6">
						<div class="col-md-1 top-padding">
							<div class="tradeDetail">
							<c:if test="${article.tradeType eq 'S'.charAt(0)}">
									<span class="label label-primary" style="font-size:13px;display:inline-block">물물</span>
									</c:if>
									<c:if test="${article.tradeType eq 'F'.charAt(0)}">
									<span class="label label-success" style="font-size:13px;display:inline-block">나눔</span>
									</c:if>
									<c:if test="${article.tradeType eq 'W'.charAt(0)}">
									<span class="label label-warning" style="font-size:13px;display:inline-block">구함</span>
									</c:if>
						</div>	
						</div>
						<div class="col-md-11 top-padding">
							<div class="tradeDetail"><span style="display:inline-block;"><strong>${article.title }</strong></span>
								${article.tradeCode }
							<span style="display: inline-block; float: right;font-size:15px;color:#999;">
								<fmt:formatDate value="${article.regDate }" pattern="yyyy/MM/dd HH:mm:ss" />
							</span>
							</div>
						</div>
						<div class="col-xs-2" style="padding: 0;">
							<br>
							<div class="tradeDetail" style="padding: 10 0 10 0;vertical-align:middle;text-align:left;font-size:14px;color:#999;">예상가격:</div>
							<div class="tradeDetail" style="padding: 12 0 11 0;vertical-align:middle;text-align:left;font-size:14px;color:#999;">도로명:</div>
							<div class="tradeDetail" style="padding: 10 0 10 0;vertical-align:middle;text-align:left;font-size:14px;color:#999;">지번:</div>
							<div class="tradeDetail" style="padding: 10 0 10 0;vertical-align:middle;text-align:left;font-size:14px;color:#999;">상세주소:</div>
							<br>
						</div>
						<div class="col-xs-10" style="padding: 0;">
							<br>
							<div class="tradeDetail" style="padding: 10 0 10 0;">&#8361;&nbsp;<fmt:formatNumber value="${article.price }" type="number" /></div>
							<c:if test="${emptyarticle.roadAddrPart}">
							<br>
							</c:if>
							<div class="tradeDetail" style="padding: 10 0 10 0;">${article.roadAddrPart }</div>
							<div class="tradeDetail" style="padding: 10 0 10 0;">${article.sido }&nbsp;${article.sigugun }&nbsp;${article.dongmyun }</div>
							<div class="tradeDetail" style="padding: 10 0 0 0;">${article.addrDetail }</div>
						</div>
						<div class="col-md-12" style="padding: 0;">	
							<!-- 지도영역 -->
							<div id="map" style="width: 100%; height: 350px; margin-bottom: 20;"></div>
							<script>
								$(window).on("load",function() {
													var map = new naver.maps.Map('map',{ //지도생성
																center : new naver.maps.LatLng(),
																zoom : 5
															});

													var lat = ${article.lat};
													var lng = ${article.lng};
													var location = lat + ","+ lng;

													var location = new naver.maps.LatLng(lat, lng);
													
													var marker = new naver.maps.Marker({ //마커 생성
																position : new naver.maps.LatLng(location), //html geolocation으로 받은 좌표값으로 마커 생성
																map : map
															});

													map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
													map.setZoom(11); // 지도의 줌 레벨을 변경합니다.

												});
							</script>
							<div style="border: 1px solid #dddddd;border-radius: 4px; min-height: 174px; padding: 6 12;box-shadow: inset 0 1px 1px rgba(0,0,0,.075);">${article.content }</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row" style="margin-bottom:10px;">
				<div class="text-center">
					<a href="${ pageContext.request.contextPath }/trade/all" class="btn btn-default">목록</a>&nbsp;&nbsp;
					<c:if test="${article.writerUno eq loginUser.memNo || loginUser.roleCode eq 'ROLE_ADMIN' }">
						<form:form method="delete" action="${article.tno }" cssClass="inline-form" style="display:inline">
							<input type="submit" value="삭제" class="btn btn-danger" >
							&nbsp;&nbsp;
						</form:form>
						<a href="${article.tno }/edit" class="btn btn-primary">수정</a>
					</c:if>
				</div>
			</div>
		
			<div class="panel-footer">
				<div>
					<form action="../tradeCmt/new" class="form-group">
						<div class="input-group">
							<input type="hidden" name="tno" value="${article.tno }">
							<input type="text" class="form-control" name="content" placeholder="댓글 등록">
							<span class="input-group-btn">
								<button class="btn btn-primary" type="submit">등록</button>
							</span>
			    </div>
					</form>
				</div>
				<table class="table">
					<c:forEach var="cmt" items="${cmtList }">
						<tr><td class="col-xs-8">${cmt.content }</td><td class="col-xs-4">${cmt.writerNickname }
							<form:form method="delete" action="../tradeCmt/${cmt.tcno }" cssClass="inline-form pull-right">
								<input type="hidden" name="tno" value="${article.tno }">
								<input type="submit" value="삭제" class="btn btn-danger btn-xs">
							</form:form>
							<a class="btn btn-info btn-xs pull-right cmt-mod" data-cno="" data-toggle="modal" data-target="#myModal">수정</a>
						</td></tr>
					</c:forEach>
  			</table>
			</div>
			
		</div>
		
	</Section>
</body>
</html>