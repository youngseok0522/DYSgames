<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../common/top.jsp" %>

<style> 
body {
	height: 100vh; 
	background: #fff; 
	/* #1B2838 */
} 
.input-form { 
	text-align: center;
	max-width: 800px; 
	margin-top: 10%; 
	padding: 32px; 
	background: #fff; 
	-webkit-border-radius: 10px; 
	-moz-border-radius: 10px; 
	border-radius: 10px; 
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
} 

#footerFixed{
    position: absolute !important;
  }
</style> 

<body> 
	<div class="container" style="margin-bottom: 150px;"> 
		<div class="input-form-backgroud row"> 
			<div class="input-form col-md-12 mx-auto"> 
				<h4 class="mb-3">회원가입이 완료되었습니다.</h4>
				<h4 class="mb-3">DYS GAMES에 오신것을 환영합니다!</h4>
				<h4 class="mb-3"><a href="${root}login">로그인</a> 후 이용 가능합니다.</h4>
			</div>
		</div>
	</div>	
</body>



<%@ include file="../common/footer.jsp" %>