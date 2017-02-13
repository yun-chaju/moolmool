<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="container container-top">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<h4 class="visible-md-block visible-lg-block">
				<strong>&nbsp;</strong>
			</h4>
		</div>
		<div class="col-md-2">
			<div class="list-group has-shadow">
				<a href="#" class="list-group-item active">물물교환 페이지 목록</a>
				<a href="${pageContext.request.contextPath }/trade/all" class="list-group-item active">전체</a>
				<a href="${pageContext.request.contextPath }/trade/swap" class="list-group-item">교환</a>
				<a href="${pageContext.request.contextPath }/trade/free" class="list-group-item">나눔</a>
				<a href="${pageContext.request.contextPath }/trade/wanted" class="list-group-item">구함</a>
			</div>
		</div>
		<div class="col-md-10">
			<div class="panel panel-default">
				<h1>물물교환 초기 화면</h1>
			</div>
		</div>
	</div>
</section>