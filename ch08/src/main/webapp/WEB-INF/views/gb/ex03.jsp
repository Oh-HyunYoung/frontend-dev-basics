<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="${pageContext.request.contextPath }/jquery/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

var render = function(vo, mode){
	var htmls =
		"<li data-no=''>" +
		"	<strong>" + vo.name + "</strong>" +
		"	<p>" + vo.message + "</p>" +
		"	<strong></strong>" +
		"	<a href='' data-no='"+vo.no+"'>삭제</a>" + 
		"</li>";

	$("#list-guestbook")[mode? "prepend" : "append"](htmls);
}



var fetch = function(){
	$.ajax({
		url: "${pageContext.request.contextPath}/guestbook/api?sno=10",
		type: "get",
		dataType: "json",
		success:function(response){
			if(response.result === 'fail'){
				console.error(response.message);
				return;
			}
			response.data.forEach(function(vo){
			render(vo);
			});
		}
	});	
}

$(function(){
	// 삭제 다이알로그 jQuery 객체 미리 만들기
	var $dialogDelete = $("#dialog-delete-form").dialog({
		autoOpen: false,
		modal: true,
		buttons:{
			"삭제": function(){
				console.log("삭제하기")
				/*
					$.ajax({
						url:"${pageContext.request.contextPath}/guestbook/api/10",
						type: "delete",
						dataType: "json",
						success:function(response){
							if(response.result === 'fail'){
								console.error(response.message);
								return;
							});
						response.data.forEach(function(vo){
							render(vo);
						});
					}
					});
						*/
			},
			"취소": function(){
				console.log("삭제 다이알로그의 폼 데이터 리셋하기");
				$(this).dialog('close');
			}
		}
	});
	// 메시지 삭제 버튼 click 이벤트 처리(Live Event)
	$(document).on('click', "#list-guestbook li", function(event){
		event.preventDefault();
		console.log($(this).data("no"));
		$("#hidden-no").val($(this).data("no"));
		$dialogDelete.dialog('open');
	});
	
	
	//최초 리스트 가져오기
	fetch();
})

</script>
</head>
<body>
		<div id="guestbook">
				<h1>방명록</h1>
				<form id="add-form" action="" method="post">
					<input type="text" id="input-name" placeholder="이름">
					<input type="password" id="input-password" placeholder="비밀번호">
					<textarea id="tx-content" placeholder="내용을 입력해 주세요."></textarea>
					<input type="submit" value="보내기" />
				</form>
				<ul id="list-guestbook"></ul>
			</div>
				<div id="dialog-delete-form" title="메세지 삭제" style="display:none">
  				<p class="validateTips normal">작성시 입력했던 비밀번호를 입력하세요.</p>
  				<p class="validateTips error" style="display:none">비밀번호가 틀립니다.</p>
  				<form>
 					<input type="password" id="password-delete" value="" class="text ui-widget-content ui-corner-all">
					<input type="hidden" id="hidden-no" value="">
					<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
  				</form>
			</div>
</body>
</html>