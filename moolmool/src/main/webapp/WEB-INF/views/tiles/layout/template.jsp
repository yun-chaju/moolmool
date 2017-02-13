<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta charset="utf-8">
<title>물물넷</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/bootstrap-customize.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/awesome-bootstrap-checkbox.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/moolmool.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<style>
html, body {
	height: 100%;
}
</style>
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<%-- <tiles:insertAttribute name="footer" /> --%>
</body>
</html>