<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />
<%@ include file="../common/top.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
$("document").ready(function (){
	$("div.title").css("cursor", "pointer").click(function(){
		let no = $(this).attr("id");	
		$("#writeNo").val(no);
		$("#f").attr("action", "${root}gameView");
		$("#f").submit();
	});


	$("#allSelect").click(function() {
		console.log(this.checked); // true or false
		$(".chkbox").prop('checked', this.checked);
		console.log($(".chkbox").length); // 선택된 개수 
	});
	
	$(".chkbox").click(function() {
		console.log($(".chkbox:checked").length); // 누적된 체크 수 
		if($(".chkbox:checked").length==5) // 출력된 게시글의 max(5개)
			$("#allSelect").prop('checked', true); // 전체선택 체크박스 체크 입력
		else
			$("#allSelect").prop('checked', false);
	});

});
</script>

<center>
<form id="f" method="get" >
	<input type="hidden" id="writeNo" name="writeNo"/>
	<input type=hidden name="proc" value="deletes" />
	<input type=hidden name="formpath" value="delete" />
<table style="width: 650px; ">
	<tr><td colspan=5><hr/></td></tr>
	<tr>
		<th style="width: 40px; height:20px; text-align: center;">선택</th>
		<th style="width: 610px; height:20px; text-align: center;">타이틀</th>
	</tr>
	<c:forEach var="list" items="${gameList }">
		<tr>
			<td style="width: 40px; height:40px;" align="center">
				<input class="chkbox" name="checks" value="${list.no }" type="checkbox" />
			</td>
			<td style="width: 610px; height:40px;" align="center">
				<div id="${list.no }" class="title">${list.title }</div>
			</td>
		</tr>
	</c:forEach>
	<tr><td colspan=5><hr/></td></tr>
	<tr>
		<td colspan=2><input type="checkbox" id="allSelect"/>전체선택</td>
		<td colspan=3 align="right">
			<input type="button" value='등록' style="width: 100px;" onclick="location.href='${root}gameRegistration'" />
			<input type="button" value='삭제' style="width: 100px; "/>
			<!-- <button formaction="#" style="width: 100px; ">삭제</button> -->
		</td>
	</tr>
	<tr><td colspan=5><hr/></td></tr>
</table>
</form>

${page }
<form action="${root }boardProc" method="post">
	<table>
		<tr>
			<td>
				<input type=text name="search"/>
				<input type=button name="searchBtn" value='검색' style="width: 80px; "/>
			</td>
		</tr>
	</table>
</form>
</center>

<%@ include file="../common/footer.jsp" %>