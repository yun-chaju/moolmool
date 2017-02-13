<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
.fileDrop {
	width: 100%;
	height: 200px;
	border: 1px dotted blue;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: grey;
}
</style>
</head>
<body>
<div class="fileDrop"></div>
<div class="uploadedList"></div>
<input type="text" id="up0" value="">
<input type="text" id="up1" value="">
<input type="text" id="up2" value="">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(function(){
	
	var maxImageCount = 0;
	
	function checkImageType(fileName) {
		var pattern = /jpg|gif|png|jpeg/i;
		return fileName.match(pattern);
	}
	
	$(".fileDrop").on("dragenter dragover", function(e) {
		e.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(e){
		e.preventDefault();
		
		var files = e.originalEvent.dataTransfer.files;
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
					url: 'uploadAjax',
					data: formData,
					dataType: 'text',
					processData: false,
					contentType: false,
					type: 'POST',
					success: function(data) {
						
						var str = "";
						
						if(checkImageType(data)) {
							str= "<div style='display:/'inline-block/''><img src='viewImg?fileName=" + data + "'/></div>";
							$("#up"+idx).val(data);
						} else {
							// 이미지가 아님;
						}
						
						$(".fileDrop").append(str);
					}
				});
				
			} else {
			}
		});
		
		
	});
});
</script>
</body>
</html>