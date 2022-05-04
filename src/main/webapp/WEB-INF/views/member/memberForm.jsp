<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	function daumPost(){
		new daum.Postcode({
			onComplete : function(data) {
				var addr = "";
				if (data.userSelectedType === "R") {//도로명 주소일 경우( R )
					addr = data.roadAddress;
				} else {//지번일 경우( J )
					addr = data.jibunAddress;
				}
				document.getElementById("zipcode").value = data.zonecode;
				document.getElementById("address1").value = addr;		
				document.getElementById("address2").focus();
			}
		}).open();
	}
	
	function sendAuth(){
		var email = $("#email").val();
		// 이메일 정규식
		var email_reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		if(email == ""){
			alert("이메일을 입력해주세요.");
			return;
		}
		
		if(!email_reg.test(email)){
			alert("이메일 형식에 맞게 입력해 주세요.");
			$("#email").focus();
			return;
		}
		
		$.ajax({
			url : "sendAuth",
			type : "POST",
			data : email,
			contentType : "application/json;charset=utf-8",
			dataType : "text",
			success : function(result){
				alert(result);
			},
			error : function(request, status, error){
				alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		})
	}
	
	function sendAuthCheck(){
		var authNum = document.getElementById('authNum').value;
		if(authNum == ""){
			alert('인증번호를 입력해주세요.');
			return;
		}
		
		$.ajax({
			url : "authCheck",
			type : "POST",
			data : authNum,
			contentType : "application/json;charset=utf-8",
			dataType : "text",
			success : function(result) {
				$("#checkResult").text(result);
				$("#checkResult").css("color", "red");
				if(result === "인증 성공"){		
					$("#checkResult").css("color", "#0D6EFD");
					$("#authNum").attr("readonly", true);
					$("#authCheck_B").attr("disabled", true);
				}			
			},
			error : function() {
				alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		})
	}
	
	function memberProc() {
		var id = $("#id").val();
		var pw = $("#pw").val();
		var pwCheck = $("#pwCheck").val();
		var email = $("#email").val();
		var address1 = $("#address1").val();
		var idCheck = $("#idCheck").val();
		
		// 아이디 영어 소문자로 시작하는 4~16자의 영문, 숫자
		var id_reg = /^[a-z]+[a-z0-9]{3,15}$/g;
		// 비밀번호 8~16자의 영문, 숫자
		var pw_reg = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;	
		// 이메일
		var email_reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		if(id == ""){
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return;
		}
		
		if(!id_reg.test(id)){
			alert("아이디 형식에 맞게 입력해 주세요.");
			$("#id").focus();
			return;
		}
		
		if(idCheck != id){
			alert("아이디 중복확인을 해주세요.");
			$("#id").focus();
			return;
		}
		
		if(pw == ""){
			alert("비밀번호를 입력해주세요.");
			$("#pw").focus();
			return;
		}
		
		if(pwCheck == ""){
			alert("비밀번호 확인을 입력해주세요.");
			$("#pwCheck").focus();
			return;
		}
		
		if(!pw_reg.test(pw)){
			alert("비밀번호 형식에 맞게 입력해 주세요.");
			$("#pw").focus();
			return;
		}
		
		if(pwCheck != pw){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			$("#pw").focus();
			return;
		}
		
		if(email == ""){
			alert("이메일을 입력해주세요.");
			$("#email").focus();
			return;
		}
		
		if(!email_reg.test(email)){
			alert("이메일 형식에 맞게 입력해 주세요.");
			$("#email").focus();
			return;
		}
		
		if(address1 == ""){
			alert("주소를 입력해주세요.");
			$("#address1").focus();
			return;
		}
		document.getElementById('f').submit();
	}
	
	$(function(){
		$("#email").on("keydown", function(){
			$("#authNum").val("");
			$("#checkResult").text("");
			$("#authNum").attr("readonly", false);
			$("#authCheck_B").attr("disabled", false);
			
			$.ajax({
				url : "sessionRemove",
				success : function() {
					
				},
				error : function() {
					alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			})
		})
	})
	
	//아이디 중복체크
	$(function(){
		$("#idExist_B").on("click", function(){
			var id = $("#id").val();
			// 아이디 영어 소문자로 시작하는 4~16자의 영문, 숫자
			var id_reg = /^[a-z]+[a-z0-9]{3,15}$/g;
			
			if(id == ""){
				alert("아이디를 입력해주세요.");
				return;
			}	
			
			if(!id_reg.test(id)){
				alert("아이디 형식에 맞게 입력해 주세요.");
				$("#id").focus();
				return;
			}
			
			$.ajax({
				url : "idExist",
				type : "POST",
				data : id,
				contentType : "application/json;charset=utf-8",
				dataType : "text",
				success : function(result){
					if(result == "사용 가능한 아이디입니다."){
						$("#idCheck").val(id);
					}
					else{
						$("#idCheck").val("");
					}
					alert(result);
				},
				error : function(){
					alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			})
		})
	})
	
	//비밀번호 & 비밀번호체크
	$(function(){	 
		var pw = $("#pw");
		var pwCheck = $("#pwCheck");
		
		$("#pw").on("keyup", function(){
			if(pw.val() === pwCheck.val()){	
				$("#pwResult").text("비밀번호 일치");
				$("#pwResult").css("color", "#0D6EFD");
			}
			else{
				$("#pwResult").text("비밀번호 불일치");
				$("#pwResult").css("color", "red");
			}
		})
		
		$("#pwCheck").on("keyup", function(){
			if(pw.val() === pwCheck.val()){	
				$("#pwResult").text("비밀번호 일치");
				$("#pwResult").css("color", "#0D6EFD");
			}
			else{
				$("#pwResult").text("비밀번호 불일치");
				$("#pwResult").css("color", "red");
			}
		})
	})
	
	
	
</script>


<body> 

	<div class="container" style="margin-bottom: 150px;"> 
		<div class="input-form-backgroud row"> 
			<div class="input-form col-md-12 mx-auto"> 
				<h4 class="mb-3">회원가입</h4> 
				<hr class="mb-3">
				<form action="memberProc" class="validation-form" method="post" id="f" novalidate> 		
					<input type="hidden" id="idCheck" value="">
					<div class="row">
						<div class="col-md-8"> 
							<label for="name">아이디&nbsp;</label><span class="text-muted" style="font-size: 10pt;">(4~16자의 영문자, 숫자)</span> 
							<input type="text" class="form-control" id="id" name="id" required> 
							<div class="invalid-feedback"> 아이디를 입력해주세요. </div>
						</div> 
						<div class="col-md-2 pt-sm-4 mb-3">
							<input type="button" value=" 중복 체크 " id="idExist_B" style="height: 38px;" onclick="">
						</div>
					</div>
					
					<div class="col-md-12 mb-3"> 
						<label for="password">비밀번호&nbsp;</label><span class="text-muted" style="font-size: 10pt;">(8~16자의 영문자, 숫자)</span> 
						<input type="password" class="form-control" id="pw" name="pw" placeholder="" value="" required> 
						<div class="invalid-feedback"> 비밀번호를 입력해주세요. </div> 
					</div> 
					
					<div class="col-md-12 mb-3"> 
						<label for="password">비밀번호 확인</label> 
						<input type="password" class="form-control" id="pwCheck" name="pwCheck" placeholder="" value="" required> 
						<div class="invalid-feedback"> 비밀번호확인을 입력해주세요. </div> 
						<label id="pwResult" style="font-weight: bold;"></label>
					</div> 
				
					<div class="row">
						<div class="col-md-8"> 
							<label for="email">이메일</label> 
							<input type="email" class="form-control" id="email" name="email" placeholder="email@example.com" required> 
							<div class="invalid-feedback"> 이메일을 입력해주세요. </div>
							<label></label>
						</div> 
						<div class="col-md-2 pt-sm-4"> 
							<input type="button" value="인증번호 발송" style="height: 38px;" onclick="sendAuth()">
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-8 mb-3">
							<label for="auth">인증번호 확인</label>
							<input type="text" class="form-control" id="authNum">
							<div class="invalid-feedback"> 인증번호를 입력해주세요. </div> 
							<label for="checkResult" id="checkResult" style="font-weight: bold;">${checkResult }</label>
						</div>
						<div class="col-md-2 pt-sm-4 mb-3">
							<input type="button" value="인증번호 확인" id="authCheck_B" style="height: 38px;" onclick="sendAuthCheck()">
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-8 mb-3">
							<label for="zipcode">우편번호</label>
							<input type="text" class="form-control" id="zipcode" name="zipcode" readonly="readonly">
							<div class="invalid-feedback"> 우편번호를 입력해주세요. </div> 
						</div>
						<div class="col-md-2 pt-sm-4 mb-3">
							<input type="button" value="우편번호 검색" style="height: 38px;" onclick="daumPost()">
						</div>
					</div>
					
					<div class="mb-3"> 
						<label for="address">주소</label> 
						<input type="text" class="form-control" id="address1" name="address1" placeholder="" readonly="readonly" required> 
						<div class="invalid-feedback"> 주소를 입력해주세요. </div> 
					</div> 
					<div class="mb-3"> 
						<label for="address2">상세주소<span class="text-muted">&nbsp;(선택)</span></label> 
						<input type="text" class="form-control" id="address2" name="address2" placeholder=""> 
					</div> 
					
					<hr class="mb-4"> 
					<div class="custom-control custom-checkbox"> 
						<input type="checkbox" class="custom-control-input" id="aggrement" required> 
						<label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label> 
					</div> 
					<div class="mb-4"></div> 
					<!-- <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>  -->
				</form> 
					<input type="button" value="가입완료" class="btn btn-primary btn-lg btn-block" onClick="memberProc()">
			</div> 
		</div>
	</div> 
	
	<script> 
		window.addEventListener('load', () => { 
			const forms = document.getElementsByClassName('validation-form'); 
		
			Array.prototype.filter.call(forms, (form) => { 
				form.addEventListener('submit', function (event) { 
					if (form.checkValidity() === false) { 
						event.preventDefault();
						event.stopPropagation(); 
					} 
				form.classList.add('was-validated');
				}, false);
			}); 
		}, false); 
	</script> 

</body>


<%@ include file="../common/footer.jsp" %>