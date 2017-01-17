<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
function send(){
	var num1 = $("#num1").val();
	var num2 = $("#num2").val();
	var oper = $("#oper").val();
	
	//값 초기화
	$("#num1").val("");
	$("#num1").val("");
	$("#num1").val("add");
	
	var url = "text5_ok.jsp";
	
	// AJAX GET 방식
	// GET방식을 처리할 수 있는 첫번째 방식
	$.get(url, {num1:num1, num2:num2, oper:oper}, function(data){
		$("#resultLayout").html(data);
	});
	//위의 코드에서 num1:num1 -> 앞의 num1은 서버에서 전달 받을 파라미터의 이름, 뒤는 변수명
	//function(data)에서 data -> 서버에서 돌아온 데이터
}
</script>

</head>
<body>


	<input type="text" id="num1">
		<select id="oper">
			<option value="add">더하기</option>
			<option value="sub">빼기</option>
			<option value="mul">곱하기</option>
			<option value="div">나누기</option>
		</select>
		<input type="text" id="num2">
		<input type="button" value=" = " onclick="send();"><br>
		
		<hr>
		<div id = resultLayout></div>

</body>
</html>

