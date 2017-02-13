<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/jquery.fullPage.css" />
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/swiper.min.css" />
<script src="${ pageContext.request.contextPath }/resources/js/jquery.fullPage.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/scrolloverflow.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		if('<c:out value="${ msg}"/>'.length > 0){
			alert('<c:out value="${ msg}"/>');
		}

		$('#fullpage').fullpage({
			anchors: ['firstPage', 'secondPage', '3rdPage'],
			verticalCentered: true,
			menu: '#fullpage-menu',
			afterLoad: function(anchorLink, index){
				if(anchorLink == 'firstPage'){
					$("header nav").addClass("is-transparent");
				} else {
					$("header nav").removeClass("is-transparent");
				}
			}
		});
		
		$.getJSON('${ pageContext.request.contextPath }/trade/category/list', function(data){
			$(data).each(function(){
				$(".category").append('<option value='+this.name+'>'+this.name+'</option>');
			});
		});
		
		$(".category").on("change", function(){
			$(".sub-category").html("");
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
					var result = '<option disabled selected hidden="true">지역선택(시/군/구)</option>';
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
					var result = '<option	disabled selected hidden="true">지역선택(읍/면/동)</option>';
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
<style>
.box {
	display: inline-block;
	width: 4.5%;
	padding-bottom: 4.5%;
	background: #fff;
}
.box-blue {
	background: #0275d8;
}
.swiper-container {
	height: 50%;
}
.swiper-slide {
	text-align: center;
	color: #fff;
	font-size: 18px;
	background: rgba(0, 0, 0, 0.4);
	
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}
#fullpage div.radio-group {
	margin-bottom: 0;
	padding-left: 20px;
}
#fullpage .addr-form select {
	margin-bottom: 5px;
}

div.col-md2.thumbnail img {
	width:100%;
	height:100%;
}

div a.thumbnail {
	background: transparent;
	border: none;
}
</style>

<div id="fullpage">

	<div class="section" id="section0">
		<div class="container container-top">
			<div class="panel first-panel pull-right">
				<form action="map/search" method="POST">
					<div class="row">
						<div class="form-group col-xs-6">
							<select class="form-control category" name="category">
								 <option disabled selected hidden="true" value="category">대분류</option>
							</select>
						</div>
						<div class="form-group col-xs-6">
							<select class="form-control sub-category" name="subcategory" disabled>
								<option disabled selected hidden="true" value="subcategory">소분류</option>
							</select>
						</div>
					</div>
					
					<div class="row">
						<div class="form-group radio-group col-xs-12 col-sm-4">
							<div class="radio radio-primary col-xs-3 col-sm-12">
								<input type="radio" name="tradeType" id="optionsRadios1" value="all" checked>
								<label for="optionsRadios1">전체</label>
							</div>
							<div class="radio radio-primary col-xs-3 col-sm-12">
								<input type="radio" name="tradeType" id="optionsRadios2" value="S">
								<label for="optionsRadios2">교환</label>
							</div>
							<div class="radio radio-primary col-xs-3 col-sm-12">
								<input type="radio" name="tradeType" id="optionsRadios3" value="F">
								<label for="optionsRadios3">나눔</label>
							</div>
							<div class="radio radio-primary col-xs-3 col-sm-12">
								<input type="radio" name="tradeType" id="optionsRadios4" value="W">
								<label for="optionsRadios4">구함</label>
							</div>
						</div>
						
						<div class="col-xs-12 col-sm-8">
							<div class="form-group addr-form">
								<select class="form-control sido" name="sd">
								  <option disabled selected hidden="true" value="sd">지역선택 (시/도)</option>
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
								<select class="form-control gugun" disabled name="sgg">
								  <option disabled selected hidden="true" value="sgg">지역선택(시/군/구)</option>
								</select>
								<select class="form-control emd" disabled name="emd">
								  <option disabled selected hidden="true" value="emd">지역선택(읍/면/동)</option>
								</select>
							</div>
						</div>
					</div>
				
					<div class="form-group has-feedback">
						<input type="search" id="search" name="title" class="form-control " placeholder="검색어를 입력하세요.">
						<span class="glyphicon glyphicon-search form-control-feedback text-primary" aria-hidden="true"></span>
					</div>
					
					<input  class="form-control btn btn-primary" type="submit" value="검색">
				</form>
			</div>
		</div>
	</div>
	
	<div class="section" id="section1">
		<div class="container container-top">
		
			<div class="row">
			  <div class="col-sm-2">
			  </div>
			  <div class="col-sm-2">
			    <a href="#" class="thumbnail" style="height:100%;">
			      <img class="img-thumbnail" src="imgsource" alt="물품">
			    </a>
			  </div>
			  <div class="col-sm-2">
			    <a href="#" class="thumbnail" style="height:100%;">
			      <img class="img-thumbnail" src="imgsource" alt="물품">
			    </a>
			  </div>
			  <div class="col-sm-2">
			    <a href="#" class="thumbnail" style="height:100%;">
			      <img class="img-thumbnail" src="imgsource" alt="물품">
			    </a>
			  </div>
			  <div class="col-sm-2 hidden-xs ">
			    <a href="#" class="thumbnail" style="height:100%;">
			      <img class="img-thumbnail" src="imgsource" alt="물품">
			    </a>
			  </div>
			  <div class="col-sm-2">
			  </div>
			</div>
			<div class="row hidden-xs ">
			  <div class="col-sm-2">
			  </div>
			  <div class="col-sm-2">
			    <a href="#" class="thumbnail" style="height:100%;">
			      <img class="img-thumbnail" src="imgsource" alt="물품">
			    </a>
			  </div>
			  <div class="col-sm-2">
			    <a href="#" class="thumbnail" style="height:100%;">
			      <img class="img-thumbnail" src="imgsource" alt="물품">
			    </a>
			  </div>
			  <div class="col-sm-2">
			    <a href="#" class="thumbnail" style="height:100%;">
			      <img class="img-thumbnail" src="imgsource" alt="물품">
			    </a>
			  </div>
			  <div class="col-sm-2">
			    <a href="#" class="thumbnail" style="height:100%;">
			      <img class="img-thumbnail" src="imgsource" alt="물품">
			    </a>
			  </div>
			  <div class="col-sm-2">
			  </div>
			</div>
			<div class="row hidden-xs ">
			  <div class="col-sm-2">
			  </div>
			  <div class="col-sm-2">
			    <a href="#" class="thumbnail" style="height:100%;">
			      <img class="img-thumbnail" src="imgsource" alt="물품">
			    </a>
			  </div>
			  <div class="col-sm-2">
			    <a href="#" class="thumbnail" style="height:100%;">
			      <img class="img-thumbnail" src="imgsource" alt="물품">
			    </a>
			  </div>
			  <div class="col-sm-2">
			    <a href="#" class="thumbnail" style="height:100%;">
			      <img class="img-thumbnail" src="imgsource" alt="물품">
			    </a>
			  </div>
			  <div class="col-sm-2">
			    <a href="#" class="thumbnail" style="height:100%;">
			      <img class="img-thumbnail" src="imgsource" alt="물품">
			    </a>
			  </div>
			  <div class="col-sm-2">
			  </div>
			</div>
			
			</div>
			
	</div> 
	
	
	
	<div class="section" id="section2">
		<!-- <div class="container container-top">
			<div class="panel third-panel col-sm-8 col-centered">
				<h1>제작</h1>
				<h5>copyright wappl</h5>
			</div>
		</div> -->
		<div class="swiper-container col-sm-6 col-centered">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					물물넷은 물물교환 방식에 전문 운영기법을 도입, 품목별로 쉽게 찾을 수 있으며
					<br>
					 즉석에서 상대방과 흥정할 수 있게 하는 물물교환 플랫폼을 제공하는 회사이다.
					<br>
					copyrightⓒ wappl
				</div>
				<div class="swiper-slide">
					 2016년 8월 말에 설립된 이후 꾸준히 업계 1위를 달리고 있으며
					 <br>
					 최근에는 서버에서 관리하고 있는 데이터만 20만건에 돌파하였다. 
					 <br>
					copyrightⓒ wappl
				</div>
				<div class="swiper-slide">
					여동을 시작으로 뛰어난 기술력을 갖춘 사원들이 모여 화목한 분위기 속에 개발 중이며  
					<br>
					이러한 개발 분위기 속에 가장 취업하고 싶은 회사 1위를 장식하였다.(2016. KBS)
					<br>
					copyrightⓒ wappl
				</div>
				<div class="swiper-slide">
					대부분 모든 상품을 취급하며 사용자간 교환을 유도하는 형태로<br>
					 상대방과 흥정을 통해 거래하기 때문에 사용할수록 정감있고 재미를 더해 준다.<br>
					copyrightⓒ wappl
				</div>
			</div>
    </div>
	</div>
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/swiper.min.js"></script>
	<script>
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        paginationClickable: true,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: 2500,
        autoplayDisableOnInteraction: false
    });

    
  </script>
</div>

<nav class="navbar navbar-fixed-bottom text-center interactive-button-first" id="fullpage-menu">
  <div class="container">
    	<a data-menuanchor="firstPage" href="#firstPage">물물검색</a> 
    	<a data-menuanchor="secondPage" href="#secondPage">물물교환</a> 
    	<a data-menuanchor="3rdPage" href="#3rdPage">물물소개</a>
  </div>
</nav>
