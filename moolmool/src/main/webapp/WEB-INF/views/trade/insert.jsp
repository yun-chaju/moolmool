<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=H_wwephtXUAR7XYcLyxZ"></script>
<style>
.panel-body {
	padding: 50 30 50 30;
	border: 0 solid white;
	box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.3);
	border-radius: 4px;
	background-color: fff;
}
.ydzone {
	width: 200px;
	min-height: 100px;
	border: 2px dashed #0087F7;
	border-radius: 5px;
	background: white;
	margin-bottom: 20px;
	/* display: inline-block; */
}
</style>
<script>
$(function(){
	
	var maxImageCount = 0;
	
	function checkImageType(fileName) {
		var pattern = /jpg|gif|png|jpeg/i;
		return fileName.match(pattern);
	}
	
	$(".ydzone").on("dragenter dragover", function(e) {
		e.preventDefault();
	});
	
	$(".ydzone").on("drop", function(e){
		e.preventDefault();
		
		var files = e.originalEvent.dataTransfer.files;
		/* 
		$(files).each(function(idx){
			maxImageCount ++;

			var file = files[idx];
			
			if((file.type === 'image/png' ||
					file.type === 'image/jpg' ||
					file.type === 'image/jpeg' ||
					file.type === 'image/gif') && maxImageCount <= 3) {
				var formData = new FormData();
				formData.append("file", file);
				
				$.ajax({
					url: '../uploadAjax',
					data: formData,
					dataType: 'text',
					processData: false,
					contentType: false,
					type: 'POST',
					success: function(data) {
						var str = "";
						
						if(checkImageType(data)) {
							str = "<div style='display:inline-block'><img src='../viewImg?fileName=" + data + "'/></div>";
						} else {
							// 이미지가 아님;
						}
						$("#test111").after(str);
						
					}
				}); */

				var file = files[0];
					
				if((file.type === 'image/png' ||
						file.type === 'image/jpg' ||
						file.type === 'image/jpeg' ||
						file.type === 'image/gif') && maxImageCount <= 3) {
				var formData = new FormData();
				formData.append("file", file);
			test(this);
			function test(aaa) {
				$.ajax({
					url: '../uploadAjax',
					data: formData,
					dataType: 'text',
					processData: false,
					contentType: false,
					type: 'POST',
					success: function(data) {
						console.log(aaa);		
						$(aaa).css("display", "inline-block");
						$(aaa).after("<div style='display:inline-block'><img src='../viewImg?fileName=" + data + "'/></div>");
						$("#file" + $(aaa).data("text")).val(data);
						/* if(checkImageType(data)) {
							str = "<div style='display:inline-block'><img src='../viewImg?fileName=" + data + "'/></div>";
							if($(".fup").val() === "") {
								alert('test');
								$(this).html(str);
							}
						} else {
							// 이미지가 아님;
						}
						$("#test111").after(str); */
					}
				});
			}
			} else {
		}
	});
		
		
});
</script>
</head>
<body>
	<Section class="container container-top">
			<h4 class="visible-md-block visible-lg-block" style="font-size: 16px;">
				<strong style="margin-left: 10px;">물품 등록</strong>
			</h4>
			<div class="row">
			<div class="panel panel-default">
			<div class="panel-body">
			<!-- 이미지 업로드 -->
				<div class="col-md-6">
					<div id="1" data-text="1" class="ydzone"> &nbsp;
					</div>
					<div id="2" data-text="2" class="ydzone"> &nbsp;
					</div>
					<div id="3" data-text="3" class="ydzone"> &nbsp;
					</div>
				</div>
				<div class="col-md-6">
				<form action="new" method="post">
				<!-- 내용 입력 -->
				<!-- 거래종류 선택 -->
				<div class="col-md-3">
					<div class="dropdown">
						<div class="form-group">
							<select class="form-control" id="tradeType" name="tradeType">
								<option value="S">교환</option>
								<option value="F">나눔</option>
								<option value="W">구함</option>
							</select>
						</div>
					</div>
				</div>
				<!-- 제목 -->
				<div class="col-md-9">
						<input class="form-control" type="text" name="title" id="title"	placeholder="제목" style="margin-bottom:20" autofocus="autofocus" required>	
				</div>
				<!-- 가격, 주소, 내용, ... 입력 -->
				<div class="col-md-12">
					<input id="file1" type="hidden" name="file1">
					<input id="file2" type="hidden" name="file2">
					<input id="file3" type="hidden" name="file3">
					<input class="form-control" type="number" name="price" id="price"	placeholder="예상가격" style="margin-bottom:10" value="0">
					<input class="form-control"	type="text" name="roadAddrPart" id="roadAddrPart"	placeholder="도로명주소" style="margin-bottom:10" readonly>
					<input class="form-control"	type="text" id="jibunAddr" placeholder="지번주소" style="margin-bottom:10" readonly>
					<input class="form-control" type="hidden" name="sido" id="sido">
					<input class="form-control" type="hidden" name="sigugun" id="sigugun">
					<input class="form-control" type="hidden" name="dongmyun" id="dongmyun">
					<input class="form-control" type="text" name="addrDetail" id="addrDetail" placeholder="상세주소 또는 위치명" style="margin-bottom:20">
					<input class="form-control" type="hidden" name="lat" id="lat"	placeholder="lat" value="0">
					<input class="form-control"	type="hidden" name="lng" id="lng" placeholder="lng" value="0">
					<!-- 지도역역 -->
					<div id="map" style="width: 100%; height: 350px; margin-bottom:20;"></div>
					<script>
						var map = new naver.maps.Map('map', {	//지도생성
							center : new naver.maps.LatLng(),
							zoom : 5
						});
					
						function onSuccessGeolocation(position) { //html geolocation 성공시 실행 메소드

							var location = new naver.maps.LatLng(
									position.coords.latitude,
									position.coords.longitude);
							
							var marker = new naver.maps.Marker({ //마커 생성
								position : new naver.maps.LatLng(location),	//html geolocation으로 받은 좌표값으로 마커 생성
								map : map
							});

							map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
							map.setZoom(11); // 지도의 줌 레벨을 변경합니다.
							$("#lat").val(location._lat);	//lat값 hiddent input에 입력
							$("#lng").val(location._lng);	//lng값 hiddent input에 입력

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
						}

						function onErrorGeolocation() {	//html geolocation 실패시 실행 메소드
							alert("지원하지 않는 브라우저 입니다.");
						}

						$(window).on("load", function() {	//geolocation 이용 현재 좌표값 추출
									if (navigator.geolocation) {
										navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
									} else {
										alert("지원하지 않는 브라우저 입니다.");
									}
								});
					</script>
					<!-- 내용 입력 -->
					<div class="form-group" style="margin-bottom:40;">
						<textarea class="form-control" name="content" id="content" rows="8" placeholder="내용" style="resize: none;"
							required="required"></textarea>
					</div>
				</div>
				<div class="row">
					<div class="form-group text-center">
						<input type="submit" value="등록" class="btn btn-primary" />&nbsp;&nbsp;
						<input type="button" value="뒤로" class="btn btn-default"
							onclick="history.back()" />
					</div>
				</div>	
					</form>
					</div>
				</div>
				</div>
			</div>
	</Section>
</body>
</html>