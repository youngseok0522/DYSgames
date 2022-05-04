<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:url var="root" value="/"/>

<%@ include file="../common/top.jsp" %>

<style> 
body {
	min-height: 100vh; 
	background: #fff; 
	/* #1B2838 */
} 
.input-form { 
	max-width: 500px; 
	margin-top: 80px; 
	padding: 32px; 
	background: #fff; 
	-webkit-border-radius: 10px; 
	-moz-border-radius: 10px; 
	border-radius: 10px; 
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
} 
</style> 

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">

<script>
	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear: true,
		yearSuffix: '년'
	});

	$(function () {
	  $('.datepicker').datepicker();
	});
	
	function gameRegiProc(){
		var title = $("#title").val();
		var link = $("#link").val();
		var price = $("#price").val();
		var launching = $("#launching").val();
		var genre = $("#genre").val();
		var publisher = $("#publisher").val();
		var developer = $("#developer").val();
		var platform = $("#platform").val();
		var language = $("#language").val();
		var explanation = $("#explanation").val();
		
		if(title == ""){
			alert("타이틀을 입력해주세요.");
			$("#title").focus();
			return;
		}
		if(link == ""){
			alert("영상 링크를 입력해주세요.");
			$("#link").focus();
			return;
		}
		if(price == ""){
			alert("판매가를 입력해주세요.");
			$("#price").focus();
			return;
		}
		if(launching == ""){
			alert("출시일을 입력해주세요.");
			$("#launching").focus();
			return;
		}
		if(genre == ""){
			alert("장르를 입력해주세요.");
			$("#genre").focus();
			return;
		}
		if(publisher == ""){
			alert("퍼블리셔를 입력해주세요.");
			$("#publisher").focus();
			return;
		}
		if(developer == ""){
			alert("개발사를 입력해주세요.");
			$("#developer").focus();
			return;
		}
		if(platform == ""){
			alert("플랫폼을 입력해주세요.");
			$("#platform").focus();
			return;
		}
		if(language == ""){
			alert("언어를 입력해주세요.");
			$("#language").focus();
			return;
		}
		if(explanation == ""){
			alert("상세설명을 입력해주세요.");
			$("#explanation").focus();
			return;
		}
		
		document.getElementById('f').submit();
	}
</script>

<body> 

	<div class="container" style="margin-bottom: 150px;"> 
		<div class="input-form-backgroud row"> 
			<div class="input-form col-md-12 mx-auto"> 
				<div class="mb-3">
					<span style="font-size: 20pt;">등록</span><span>&nbsp;(모든 값 필수 입력)</span>
				</div> 
				<hr class="mb-3">
				<form action="gameRegiProc" class="validation-form" method="post" id="f" novalidate> 		
					<div class="mb-3"> 
						<label for="title">타이틀<span class="text-muted"></span></label> 
						<input type="text" class="form-control" id="title" name="title" placeholder=""> 
					</div> 
					<div class="mb-3"> 
						<label for="link">영상 링크<span class="text-muted"></span></label> 
						<input type="text" class="form-control" id="link" name="link" placeholder=""> 
					</div> 
					<div class="mb-3"> 
						<label for="price">판매가<span class="text-muted"></span></label> 
						<input type="text" class="form-control" id="price" name="price" placeholder=""> 
					</div>
					<div class="mb-3"> 
						<label for="launching">출시일<span class="text-muted"></span></label> 
						<input class="form-control datepicker" id="launching" name="launching" placeholder="">
					</div>
					<div class="mb-3"> 
						<label for="genre">장르<span class="text-muted"></span></label> 
						<input type="text" class="form-control" id="genre" name="genre" placeholder=""> 
					</div>
					<div class="mb-3"> 
						<label for="publisher">퍼블리셔<span class="text-muted"></span></label> 
						<input type="text" class="form-control" id="publisher" name="publisher" placeholder=""> 
					</div>
					<div class="mb-3"> 
						<label for="developer">개발사<span class="text-muted"></span></label> 
						<input type="text" class="form-control" id="developer" name="developer" placeholder=""> 
					</div>
					<div class="mb-3"> 
						<label for="platform">플랫폼<span class="text-muted"></span></label> 
						<input type="text" class="form-control" id="platform" name="platform" placeholder=""> 
					</div>
					<div class="mb-3"> 
						<label for="language">언어<span class="text-muted"></span></label> 
						<input type="text" class="form-control" id="language" name="language" placeholder=""> 
					</div>
					<div class="mb-3">
						<label for="explanation">상세설명<span class="text-muted"></span></label>
						<br>
						<textarea style="width:100%; height: 150px;" id="explanation" name="explanation"></textarea>
					</div>
					
					<hr class="mb-4"> 
			
					<div class="mb-4"></div> 
					<!-- <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>  -->
				</form> 
					<input type="button" value="등록" class="btn btn-primary btn-lg btn-block" onClick="gameRegiProc()">
			</div> 
		</div>
	</div> 	

</body>


<%@ include file="../common/footer.jsp" %>