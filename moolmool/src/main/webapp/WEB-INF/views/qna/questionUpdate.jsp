<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	$(function(){
		$("#isPrivateChk").change(function(){
			if($("#isPrivateChk").is(":checked")){
				$("#isPrivate").val('Y');
				
			} else {
				$("#isPrivate").val('N');
			}
		});
	});
</script>
<Section class="container container-top">
	<h4><strong>Q&amp;A</strong></h4>
	<form:form method="put">
		<div class="form-group">
			<input class="form-control" type="text" name="title" id="title" value="${ questionVO.title }">
		</div>
		<div class="form-group">
			<textarea class="form-control" name="content" id="content" rows="20" placeholder="질문을 입력해 주세요!" style="resize:none;" required="required">${ questionVO.content }</textarea>	
		</div>
		<label>
			<c:set var="isPrivate" value="${ questionVO.isPrivate }" />
			<input type="checkbox" name="isPrivateChk" id="isPrivateChk" <c:if test="${ isPrivate eq 'Y'.charAt(0) }"> checked="checked" </c:if>> 비공개
			<input type="hidden" name="isPrivate" id="isPrivate" value="${ isPrivate }">
		</label>
		<div class="form-group text-center">
			<input type="submit" value="수정" class="btn btn-primary"/>&nbsp;&nbsp;
			<input type="button" value="뒤로" class="btn btn-default" onclick="history.back()" />
		</div>
	</form:form>
</Section>
