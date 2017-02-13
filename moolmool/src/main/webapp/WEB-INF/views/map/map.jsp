<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Ml2NLFK53C_BTMBkFqeD"></script>
<script src="resources/js/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$.getJSON('${ pageContext.request.contextPath }/trade/category/list', function(data){
			$(data).each(function(){
				$(".category").append('<option value='+this.name+'>'+this.name+'</option>');
			});
		});
		
		$(".category").on("change", function(){
			$.getJSON("${ pageContext.request.contextPath }/trade/subcategory/list/" + $(".category").val(), function(data) {
				if(data.length > 0) {
					$(data).each(function(){
						$(".sub-category").append('<option value='+this.name+'>'+this.name+'</option>');
					});
					$(".sub-category").removeAttr("disabled");
				}
			});
		});
		
		$(".sido").on("change", function(){
			$.getJSON("${ pageContext.request.contextPath }/address/gugun/" + $(".sido").val(), function(data) {
				if(data.length > 0) {
					var result = '<option disabled selected hidden="true" value="sgg">시/군/구</option>';
					$(data).each(function(){
						result += '<option value='+this+'>'+this+'</option>';
					});
					$('.gugun').html(result);
					$('.gugun').removeAttr("disabled");
				}
			});
		});
		
		$(".gugun").on("change", function(){
			$.getJSON("${ pageContext.request.contextPath }/address/emd/" + $(".gugun").val(), function(data) {
				if(data.length > 0) {
					console.log(data);
					var result = '<option disabled selected hidden="true" value="emd">읍/면/동</option>';
					$(data).each(function(){
						result += '<option value='+this+'>'+this+'</option>';
					});
					$('.emd').html(result);
					$('.emd').removeAttr("disabled");
				}
			});
		});
	});
</script>
<style type="text/css">
	
	#wrap {
		padding: 0px;
		margin-top: 70px;
	}
	#searchBox{
		height: 70px;
		background:#f2f2f2;
	}
	#concon {
		display : none;
	}
	#radios div{
		padding:0px;
	}
	#result div {
		border-radius: 25px;
		padding:20px;
	}
	#result div:hover{
		background: aliceblue;
	}
	.material-icons {
		vertical-align: middle;
		display: inline-block;
	}
	.material {
		vertical-align: middle;
		display: inline-block;
	}
	.target{
		display:inline-block;
		position:relative;
		background:royalblue;
		color:white;
		font-weight:bold;
		width:30px; 
		height:30px; 
		border-radius:50%; 
		font-size:9pt; 
		padding-left:10px;
		margin: 0 auto 5px;
		-webkit-transition:height .35s ease-in-out;
	}
	#info {
		position: absolute;
	    top: 0;
	    left: 0;
	    width: 334px;
	    padding: 19px 20px 0;
	    border: 1px solid #8d8d8d;
	    background-color: #fff;
	    line-height: 15px;
	}

	#header {
		position: relative;
	    padding: 0 0 7px 0;
	    border-bottom: 2px solid #474c5b;
	    line-height: 22px;
	}
	#flex {
		overflow: hidden;
	    zoom: 1;
	}
	#con {
    	position: relative;
	}
	#detail {
	    padding: 15px 3px 10px;
	    line-height: 20px;
	    zoom: 1;
	    width: 328px;
	}
	#thumb {
		display: inline;
	    float: right;
	    padding-left: 18px;
    }
	#btns{
		margin: 0 3px 16px;
	    font-size: 9px;
    }
</style>
	<div id="wrap" class="container-fluid">
		<div id="searchBox" class="container-fluid">
<!-- 			<form action="" method="post"> -->
				<div class="row" style="display: list-item;	padding: 0 64px;">
					<div class="col-xs-2">
						<div class="form-group has-feedback">
							<input id="search" type="text" class="form-control " placeholder="검색어를 입력하세요.">
						<span class="glyphicon glyphicon-search form-control-feedback text-primary" aria-hidden="true"></span>
						</div>
					</div>
						<div class="col-xs-2">
							<select name="category" class="form-control category">
							  <option disabled selected hidden="true" value="category">대분류</option>
							</select>
						</div>
						<div class="col-xs-2">
							<select name="subcategory" class="form-control sub-category" disabled>
							  <option disabled selected hidden="true" value="subcategory">소분류</option>
							</select>
						</div>
						<div id="radios" class="col-xs-2">
						<label class="radio-inline"><input type="radio" name="tradeType" value="all" checked>전체</label>
						<label class="radio-inline"><input type="radio" name="tradeType" value="S">교환</label>
						<label class="radio-inline"><input type="radio" name="tradeType" value="F">나눔</label>
						<label class="radio-inline"><input type="radio" name="tradeType" value="W">구함</label>
						</div>
						<div class="col-xs-1">
							<select id="sd" name="sd" class="form-control sido" required="required">
								  <option disabled selected hidden="true" value="sd">시/도</option>
								  <option value="서울특별시">서울특별시</option>
								  <option value="경기도">경기도</option>
								  <option value="부산광역시">부산광역시</option>
								  <option value="인천광역시">인천광역시</option>
								  <option value="경상남도">경상남도</option>
								  <option value="경상북도">경상북도</option>
								  <option value="대구광역시">대구광역시</option>
								  <option value="충청남도">충청남도</option>
								  <option value="충청북도">충청북도</option>
								  <option value="전라남도">전라남도</option>
								  <option value="전라북도">전라북도</option>
								  <option value="강원도">강원도</option>
								  <option value="대전광역시">대전광역시</option>
								  <option value="광주광역시">광주광역시</option>
								  <option value="울산광역시">울산광역시</option>
								  <option value="제주특별자치도">제주특별자치도</option>
								  <option value="제주특별자치시">제주특별자치시</option>
							</select>
						</div>
						<div class="col-xs-1">
							<select id="sgg" name="sgg" disabled class="form-control gugun">
								  <option disabled selected hidden="true" value="sgg">시/군/구</option>
							</select>
						</div>
						<div class="col-xs-1">
							<select id="emd" name="emd" disabled class="form-control emd">
								<option	disabled selected hidden="true" value="emd">읍/면/동</option>
							</select>
						</div>
						<div class="col-xs-1"><input id="btn" class="form-control btn btn-primary" type="submit" value="검색"></div>	
				</div>				
<!-- 			</form> -->
		</div>
			<div id="init"><div id="mapmap" style="width:100%;height:100%;"></div></div>
			<div id="concon">
				<div class="row">			
					<div class="col-xs-3" style="background: white; padding: 0px; height: 100%; overflow: scroll;">
						<table id="result">
								
							</table>
							<div><nav class="text-center">
						<ul id="paging" class="pagination"></ul>
					</nav></div>
					</div>
					
					<div id="submap" class="col-xs-9" style="padding: 0px;">
						<div id="map" style="width:100%;height:100%;" ></div>
					</div>
				</div>
				
			</div>	
</div>
<script>
	var institute = new naver.maps.LatLng(37.499029, 127.032866),
	option = {
			center : institute,
			logoControl : false,
			zoom : 9
			},
	map = new naver.maps.Map('mapmap', option);
	$(function(){
		var getResultList = function(page) {
			$.ajax({
				url:'map/list',
				type: 'post',
				contentType: "application/json; charset=UTF-8",
				dataType: 'json',
				data: JSON.stringify({
					"page" : page,
					"title" : $('#search').val(),
					"category" : $("#category option:selected").val(),
					"subcategory" : $("#subcategory option:selected").val(),
					"tradeType" : $("input:radio[name='tradeType']:checked").val(),
					"sd" : $("#sd option:selected").val(),
					"sgg": $("#sgg option:selected").val(),
					"emd" :$("#emd option:selected").val()
				}),
				error:function(){
					alert('오류발생');
				},
				success: function(data){
					console.log(data);
					var lnglat = new naver.maps.Point(data.list[0].lng, data.list[0].lat);
					var resultOption = {
							center : lnglat,
			           		logoControl : false,
				    		zoom : 10
				    	};
			         var resultMap = new naver.maps.Map('map', resultOption);
					
					var str = "";
					for(var page = data.paging.startPage; page<=data.paging.endPage; page++){
						str += '<li><a href = "#">'+page+'</a></li>';
					}
					var details = [] ;
					for(var i = 0 ; i < data.list.length; i++){
						var badge = "";
						if(data.list[i].tradeType =='S'){
							badge = '<span class="label label-primary">물물</span>';
						}
						if(data.list[i].tradeType =='F'){
							badge = '<span class="label label-success">나눔</span>';
						}
						if(data.list[i].tradeType =='W'){
							badge = '<span class="label label-warning">구함</span>';
						}
						var detail = '<tr><td style="width:1%;vertical-align: middle;" ><a class="thumbnail"><img style="width:100px;height:100px"></a></td>'
						+'<td><div id="result'+i+'" style="margin: 20px; margin-left: 32px; height: 120px;">'
			 			+'<a>'+badge+'&nbsp;' +data.list[i].title+'</a>'+'<br>'+data.list[i].roadAddrPart
			 			+ '<br><nobr><i id="face'+i+'" class="material-icons md-18">face</i>&nbsp;'+data.list[i].writerNickname+'</nobr></div></td><tr>';
					 	$('#result').append(detail);
					 	details.push(detail);
					 	if(i<data.list.length-1){
					 		$('#result').append('<hr style="margin:0px;">');
					 	}
					}
					$('#paging').html(str);
					
					var markers = [];
					var tooltips = [];
			        var	infos = [];
			       
			        
			        for(var i = 0 ; i < data.list.length; i++){
						
						var position = new naver.maps.LatLng(
								data.list[i].lat,
								data.list[i].lng
						);
						var marker = new naver.maps.Marker({
								map : resultMap,
								position : position,
								title : i,
								icon: {
									url: '/moolmool/resources/images/'+data.list[i].tradeType+'N.png',
							        origin: new naver.maps.Point(0, 0)
								},
								zIndex: 100
						});
						
						var conStr = [
										'<div id="info">',
										'<div id="content">',
											'<div id="header"><div id="flex">'+'<h3 style="margin: 0;padding: 0;">'+data.list[i].title+'<a id="closeBtn" type="button" class="close" aria-label="Close"><span  aria-hidden="true">&times;</span></a></h3>'+'</div></div>',
											'<div id="con">',
												'<div id="detail">'+
												'<div id="detfl"><dl><dd>'+data.list[i].roadAddrPart+ data.list[i].addrDetail +'</dd>'+
												'<dd style="margin: 3px 0 2px;">'+'<a href="#" class="btn btn-default btn-xs disabled">지번</a>&nbsp;'+data.list[i].sido + data.list[i].sigugun + data.list[i].dongmyun + data.list[i].addrDetail +'</dd>'+
												'<dd>'+data.list[i].content+'</dd></dl></div>'
												+'</div>',
												'<div id="btns"><a class="btn btn-default btn-xs" href="/moolmool/trade/'+data.list[i].tno+'" ><font color="red">></font>구경가기</a></div>',
											'</div>',
										'</div>',
										'<div id="close"></div>',
										'</div>'
							           ].join('');
						var info = new naver.maps.InfoWindow({
	        				content: conStr
	        			});
						var tooltip = new naver.maps.Marker({
							map: resultMap,
							position: position,
							icon : {
							 	content : '<div class="text-center" style="height:20px; background:#f2f2f2; color:black; border:solid 1px black; font-weight:bold;">'+	data.list[i].title +'</div>',
						        origin: new naver.maps.Point(0, 0),
						        anchor: new naver.maps.Point(-15, 25)
							    }			
						});
						
						tooltip.setVisible(false);
						
						markers.push(marker);
						infos.push(info);
						tooltips.push(tooltip);
					} //for문
			naver.maps.Event.addListener(resultMap, 'idle', function() {
					    updateMarkers(resultMap, markers);
			});
					
			function updateMarkers(resultMap, markers) {

			    var mapBounds = resultMap.getBounds();
			    var mark, pos;

			    for (var i = 0; i < markers.length; i++) {
			    	mark = markers[i]
			    	pos = mark.getPosition();
			    	console.log(pos);
			        if (mapBounds.hasLatLng(pos)) {
			            showMarker(resultMap, mark);
			        } else {
			            hideMarker(resultMap, mark);
			        }
			    }
			}//update
			function showMarker(resultMap, marker) {

			    if (marker.setMap()) return;
			    marker.setMap(resultMap);
			}//show
			function hideMarker(resultMap, marker) {

			    if (!marker.setMap()) return;
			    marker.setMap(null);
			}//hide
			
						
			$('#result div a').click(function(){
				console.log($(this).parents().attr('id').replace('result',''));
				var index = $(this).parents().attr('id').replace('result','');
				if (infos[index].getMap()) {
					infos[index].open(resultMap, markers[index]);
		        } else {
		        	infos[index].open(resultMap, markers[index]);
		        }
			});
			$('#result div a').mouseover(function(){
				var index = Number($(this).parents().attr('id').replace('result',''));
				markers[index].setIcon({url: markers[index].getIcon().url.replace('N','Y')});
				tooltips[index].setVisible(true);
				console.log(tooltips[index]);
			});
			$('#result div a').mouseleave(function(){
				var index = Number($(this).parents().attr('id').replace('result',''));
				markers[index].setIcon({url: markers[index].getIcon().url.replace('Y','N')});
				tooltips[index].setVisible(false);
				console.log(tooltips[index]);
			});
			
			function getClickHandler(i) {
			    return function(e) {
			        var m = markers[i],
			            inf = infos[i];
			        if (inf.getMap()) {
			            inf.close();
			        } else {
			            inf.open(resultMap, m);
			        }
			    }
			}//click
			
			function getOverHandler(i) {
				return function(e) {
					var type = data.list[i].tradeType;
					markers[i].setIcon({url:'/moolmool/resources/images/'+type+'Y.png'});
					tooltips[i].setVisible(true);
					$('#result'+i).css('border','solid 0.2px #0275d8');
					$('#face'+i).css('color','#0275d8');
				}
			}
			function getOutHandler(i) {
				return function(e) {
					var type = data.list[i].tradeType;
					markers[i].setIcon({url:'/moolmool/resources/images/'+type+'N.png'});
					tooltips[i].setVisible(false);
					$('#result'+i).css('border','');
					$('#face'+i).css('color','');
				}
			}

			for (var i=0; i<markers.length; i++) {
			    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
			    naver.maps.Event.addListener(markers[i], 'mouseover', getOverHandler(i));
			    naver.maps.Event.addListener(markers[i], 'mouseout', getOutHandler(i));
			    
			}
			
				}//success
			});//ajax
		}//getresultlist()

		$("#paging").on("click","a", function(){
			$('#result').empty();
			$('.target').remove();
			getResultList($(this).text());
		});
		
		$('#btn').click(function(e){
			e.preventDefault();
			$('#result').empty();
			$('#paging').empty();
			$('.target').remove();
			
			$('#init').css('display','none');
			$("#concon").css('display','block');
			$('#map').css('width','100%');
			$('#map').css('height','100%');
			getResultList(1);
		});
		$('#close').click(function(e){
			e.preventDefault();
		});
		
		
		
	});

	</script>
