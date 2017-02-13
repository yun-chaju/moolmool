<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=H_wwephtXUAR7XYcLyxZ"></script>
<title>Insert title here</title>
<script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>
<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
<style>
.panel-body {
	padding: 50 30 50 30;
	border: 0 solid white;
	box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.3);
	border-radius: 4px;
	background-color: fff;
}
.dropzone {
	width: 100%;
	border: 2px dashed #0087F7;
	border-radius: 5px;
	background: white;
	min-height: 218px;}
</style>
</head>
<body>
<Section class="container container-top">
			<h4 class="visible-md-block visible-lg-block" style="font-size: 16px;">
				<strong style="margin-left: 10px;">물품 게시글 수정</strong>
			</h4>
			<div class="row">
			<div class="panel panel-default">
			<div class="panel-body">
			<!-- 이미지 업로드 -->
			<!-- dropzone.js영역 -->
				<div class="col-md-6">
					<div id="dropzone">
						<form action="/file-upload" class="dropzone">
							<div class="fallback">
							    <input name="file" type="file"/>
							</div>
							<div class="dz-message needsclick">
						    <strong><span style="color:#999;">등록물품 이미지 드롭</span></strong><br>
						    <!-- <span class="note needsclick">...</span> -->
						  </div>
						</form>
						</div>
				</div>
				<div class="col-md-6">
				<form:form method="put">
				<!-- 내용 입력 -->
				<!-- 거래종류 선택 -->
				<div class="col-md-3">
					<div class="dropdown">
						<div class="form-group">
							<select class="form-control" id="tradeType" name="tradeType">
								<c:if test="${tradeVO.tradeType eq 'S'.charAt(0) }">
								<option value="S" selected="selected">교환</option>
								</c:if>
								<c:if test="${tradeVO.tradeType eq 'F'.charAt(0) }">
								<option value="F">나눔</option>
								</c:if>
								<c:if test="${tradeVO.tradeType eq 'W'.charAt(0) }">
								<option value="W">구함</option>
								</c:if>
							</select>
						</div>
					</div>
				</div>
				<!-- 제목 -->
				<div class="col-md-9">
						<input class="form-control" type="text" name="title" id="title"	style="margin-bottom:20" autofocus="autofocus" value="${tradeVO.title}"required>	
				</div>
				<!-- 가격, 주소, 내용, ... 입력 -->
				<div class="col-md-12">
					<input class="form-control" type="number" name="price" id="price"	placeholder="예상가격" style="margin-bottom:10" value="${tradeVO.price}">
					<input class="form-control"	type="text" name="roadAddrPart" id="roadAddrPart"	placeholder="도로명주소" style="margin-bottom:10" value="${tradeVO.roadAddrPart}" readonly>
					<input class="form-control"	type="text" id="jibunAddr" placeholder="지번주소" style="margin-bottom:10" value="${tradeVO.sido}&nbsp;${tradeVO.sigugun}&nbsp;${tradeVO.dongmyun}" readonly>
					<input class="form-control" type="hidden" name="sido" id="sido" value="${tradeVO.sido}">
					<input class="form-control" type="hidden" name="sigugun" id="sigugun" value="${tradeVO.sigugun}">
					<input class="form-control" type="hidden" name="dongmyun" id="dongmyun" value="${tradeVO.dongmyun}">
					<input class="form-control" type="text" name="addrDetail" id="addrDetail" placeholder="상세주소 또는 위치명" value="${tradeVO.addrDetail}" style="margin-bottom:20">
					<input class="form-control" type="hidden" name="lat" id="lat"	placeholder="lat" value="${tradeVO.lat}">
					<input class="form-control"	type="hidden" name="lng" id="lng" placeholder="lng" value="${tradeVO.lng}">
					<!-- 지도역역 -->
					<div id="map" style="width: 100%; height: 350px; margin-bottom:20;"></div>
					<script>
					
						$(window).on("load",function() {
							var map = new naver.maps.Map('map',{ //지도생성
										center : new naver.maps.LatLng(),
										zoom : 5
									});
	
							var lat = ${tradeVO.lat};
							var lng = ${tradeVO.lng};
							var location = lat + ","+ lng;
	
							var location = new naver.maps.LatLng(lat, lng);
							
							var marker = new naver.maps.Marker({ //마커 생성
										position : new naver.maps.LatLng(location), //html geolocation으로 받은 좌표값으로 마커 생성
										map : map
									});
	
							map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
							map.setZoom(11); // 지도의 줌 레벨을 변경합니다.
							
							$("#lat").val(lat);	//lat값 hiddent input에 입력
							$("#lng").val(lng);	//lng값 hiddent input에 입력
							
							$.ajax({	//좌표를 주소로 변환
								url : 'map/addr',
								type : 'post',
								contentType : "application/json; charset=UTF-8",
								dataType : 'json',
								data : JSON.stringify({
									'latlng' : location._lng + ','+ location._lat
								}),
								success : function(data) {
									//변환된 지번 주소값 jibunAddr <input>에 입력
									$("#jibunAddr")
											.val(data.result.items[0].addrdetail.sido
														+ " "
														+ data.result.items[0].addrdetail.sigugun
														+ " "
														+ data.result.items[0].addrdetail.dongmyun);
									
									//변환된 지번 주소값 jibunAddr hiddent <input>에 입력
									$("#sido").val(data.result.items[0].addrdetail.sido);
									$("#sigugun").val(data.result.items[0].addrdetail.sigugun);
									$("#dongmyun").val(data.result.items[0].addrdetail.dongmyun);
									
									//변환된 도로명 주소값 roadAddrPart <input>에 입력
									$("#roadAddrPart")
											.val(
													data.result.items[1].addrdetail.sido
														+ " "
														+ data.result.items[1].addrdetail.sigugun
														+ " "
														+ data.result.items[1].addrdetail.dongmyun);
								}
					});
					//마커 이동 이벤트 처리
					naver.maps.Event.addListener(map, 'click',function(e) {
										marker.setPosition(e.coord);
										map.setCenter(e.coord);
										$("#lat").val(e.latlng._lat);
										$("#lng").val(e.latlng._lng);

										$.ajax({
													url : 'map/addr',
													type : 'post',
													contentType : "application/json; charset=UTF-8",
													dataType : 'json',
													data : JSON
															.stringify({
																'latlng' : e.latlng._lng
																		+ ','
																		+ e.latlng._lat
															}),
													success : function(data) {
														$("#jibunAddr").val(data.result.items[0].addrdetail.sido
															+ " "
															+ data.result.items[0].addrdetail.sigugun
															+ " "
															+ data.result.items[0].addrdetail.dongmyun);
														
														$("#sido").val(data.result.items[0].addrdetail.sido);
														$("#sigugun").val(data.result.items[0].addrdetail.sigugun);
														$("#dongmyun").val(data.result.items[0].addrdetail.dongmyun);
														
														$("#roadAddrPart").val(data.result.items[1].addrdetail.sido
															+ " "
															+ data.result.items[1].addrdetail.sigugun
															+ " "
															+ data.result.items[1].addrdetail.dongmyun);
													}
										});

					});
						
							
						});
						/* 
						function onErrorGeolocation() {	//html geolocation 실패시 실행 메소드
							alert("지원하지 않는 브라우저 입니다.");
						} */
					</script>
					<!-- 내용 입력 -->
					<div class="form-group" style="margin-bottom:40;">
						<textarea class="form-control" name="content" id="content" rows="8" placeholder="내용" style="resize: none;"
							required="required">${tradeVO.content}</textarea>
					</div>
				</div>
				<div class="row">
					<div class="form-group text-center">
						<input type="submit" value="수정" class="btn btn-primary" />&nbsp;&nbsp;
						<input type="button" value="뒤로" class="btn btn-default"
							onclick="history.back()" />
					</div>
				</div>	
					</form:form>
					</div>
				</div>
				</div>
			</div>
	</Section>

</body>
</html>