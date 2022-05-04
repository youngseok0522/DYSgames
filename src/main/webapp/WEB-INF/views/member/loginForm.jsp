<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:url var="root" value="/"/>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<%@ include file="../common/top.jsp" %>

<link href="${path}/resources/css/login.css" rel="stylesheet" />

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

#id_line.input_row
{
	height: 0px;
}
#pw_line.input_row
{
	height: 0px;
}

#loginBtn
{
	width: 388;
	margin: 0px 0px 0px 25px;
}
#error_msg{
	margin: 0px 0px 10px 30px;
}


  #footerFixed{
    position: absolute !important;
  }
</style> 
<c:if test="${not empty msg}">
	<script>alert("${msg}");</script>
</c:if>
<script type="text/javascript">

function checkInputValue() {
	if (window.event.keyCode == 13) {

		var id = document.getElementById("id");
		var pw = document.getElementById("pw");
		var msg = document.getElementById("error_msg");
		
		if(id.value==""){
			id.focus();
			msg.innerHTML="아이디를 입력해주세요.";
		}else if(id.value!="" && pw.value==""){
			pw.focus();
			msg.innerHTML="비밀번호를 입력해주세요.";
		}else{
			document.getElementById('f').submit();
		}
		
		if(id.value!="" && pw.value==""){
			pw.focus();
			msg.innerHTML="비밀번호를 입력해주세요.";
		}
	} 
}

function loginProc() {
	var id = document.getElementById("id");
	var pw = document.getElementById("pw");
	var msg = document.getElementById("error_msg");
	
	if(id.value==""){
		id.focus();
		msg.innerHTML="아이디를 입력해주세요.";
		return;
	}else if(pw.value==""){
		pw.focus();
		msg.innerHTML="아이디를 입력해주세요.";
		return;
	}else{
		document.getElementById('f').submit();
		return;
	}
	
	if(id.value!="" && pw.value==""){
		pw.focus();
		msg.innerHTML="비밀번호를 입력해주세요.";
		return;
	}
	
	document.getElementById('f').submit();
}

</script>
<body>

	<div class="container"> 
		<div class="input-form-backgroud row"> 
			<div class="input-form col-md-14 mx-auto"> 
				<h4 class="mb-3">로그인</h4> 
				<hr class="mb-3">
				<form action="loginProc" class="validation-form" method="post" id="f" novalidate> 		
					
					<div class="panel_inner" role="tabpanel" aria-controls="loinid">
                                <div class="id_pw_wrap">
                                    <div class="input_row" id="id_line">
                                        <div class="icon_cell" id="id_cell">
                                            <span class="icon_id">
                                                <span class="blind">아이디</span>
                                            </span>
                                        </div>
                                        <input type="text" id="id" name="id" placeholder="아이디" title="아이디"
                                               class="input_text" maxlength="41"
                                               value="" onkeyup="checkInputValue()">
                                        <span role="button" class="btn_delete" id="id_clear" style="display: none;">
                                            <span class="icon_delete">
												<span class="blind">삭제</span>
                                            </span>
                                        </span>
                                    </div>
                                    <div class="input_row" id="pw_line">
                                        <div class="icon_cell" id="pw_cell">
                                            <span class="icon_pw">
                                                <span class="blind">비밀번호</span>
                                            </span>
                                        </div>
                                        <input type="password" id="pw" name="pw" placeholder="비밀번호" title="비밀번호"
                                               class="input_text" maxlength="16" onkeyup="checkInputValue()">
                                        <span role="button" class="btn_delete" id="pw_clear" style="display: none;">
                                            <span class="icon_delete">
                                                <span class="blind">삭제</span>
                                            </span>
                                        </span>
                                    </div>
                                </div>
                         </div>
				</form> 
				
					<div id="error_msg"></div>
					<input type="button" value="로그인" class="btn btn-primary btn-lg btn-block" id="loginBtn" onClick="loginProc()">
			</div> 
		</div>
	</div> 
	<ul class="find_wrap" id="find_wrap">
                <li><a target="_blank" href="#" class="find_text">비밀번호 찾기</a></li>
                <li><a target="_blank" href="#" class="find_text">아이디 찾기</a></li>
                <li><a target="_blank" href="#" class="find_text">회원가입</a></li>
    </ul>
    
</body>

<%@ include file="../common/footer.jsp" %>