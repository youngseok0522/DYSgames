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
</script>

<body> 
	<c:set var="game" value="${game}"/>
	<div class="container" style="margin-bottom: 150px;"> 
		<div class="input-form-backgroud row"> 
			<div class="input-form col-md-12 mx-auto"> 
				<div class="mb-3">
					<span style="font-size: 20pt;">수정</span><span>&nbsp;(모든 값 필수 입력)</span>
				</div> 
				<hr class="mb-3">
				<form action="${root}gameModificationProc" class="validation-form" method="post" id="f" novalidate> 
					<input type="hidden" name="no" value="${game.no}"/>		
					<div class="mb-3"> 
						<label for="title">타이틀<span class="text-muted"></span></label> 
						<input type="text" class="form-control" id="title" name="title" value="${game.title}"> 
					</div> 
					<div class="mb-3"> 
						<label for="title">영상 링크<span class="text-muted"></span></label> 
						<input type="text" class="form-control" id="link" name="link" value="${game.link}"> 
					</div> 
					<div class="mb-3"> 
						<label for="title">판매가<span class="text-muted"></span></label> 
						<input type="text" class="form-control" id="price" name="price" value="${game.price}"> 
					</div>
					<div class="mb-3"> 
						<label for="title">출시일<span class="text-muted"></span></label> 
						<input class="form-control datepicker" id="launching" name="launching" value="${game.launching}">
					</div>
					<div class="mb-3"> 
						<label for="title">장르<span class="text-muted"></span></label> 
						<input type="text" class="form-control" id="genre" name="genre" value="${game.genre}"> 
					</div>
					<div class="mb-3"> 
						<label for="title">퍼블리셔<span class="text-muted"></span></label> 
						<input type="text" class="form-control" id="publisher" name="publisher" value="${game.publisher}"> 
					</div>
					<div class="mb-3"> 
						<label for="title">개발사<span class="text-muted"></span></label> 
						<input type="text" class="form-control" id="developer" name="developer" value="${game.developer}"> 
					</div>
					<div class="mb-3"> 
						<label for="title">플랫폼<span class="text-muted"></span></label> 
						<input type="text" class="form-control" id="platform" name="platform" value="${game.platform}"> 
					</div>
					<div class="mb-3"> 
						<label for="title">언어<span class="text-muted"></span></label> 
						<input type="text" class="form-control" id="language" name="language" value="${game.language}"> 
					</div>
					<div class="mb-3">
						<label for="title">제품 설명<span class="text-muted"></span></label>
						<br>
						<textarea style="width:100%; height: 150px;" id="explanation" name="explanation">${game.explanation}</textarea>
					</div>
					
					<hr class="mb-4"> 
					
					<div class="mb-4"></div> 
					<!-- <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>  -->
					<input type="submit" value="수정" class="btn btn-primary btn-lg btn-block">
					<input type="reset" value="취소" class="btn btn-white btn-lg btn-block" style="border-color: #dddddd;"/>	
				</form> 
			</div> 
		</div>
	</div> 	

</body>


<%@ include file="../common/footer.jsp" %>