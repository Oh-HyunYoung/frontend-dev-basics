<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/jquery/jquery-3.6.0.js"></script>
<script>
$(function(){
	$("button").click(function(){
		$("#data").load("${pageContext.request.contextPath }/api/text");
	});
})
</script>
</head>
<body>
	<h1>AJAX Test: Text Format Data</h1>
	
	<button>데이터 가져오기</button>
	<div id="data"></div>
</body>
</html>