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
	
	//�� �ʱ�ȭ
	$("#num1").val("");
	$("#num1").val("");
	$("#num1").val("add");
	
	var query = "num1="+num1+"&num2="+num2;
	query+="&oper="+oper;
		
	var url = "text6_ok.jsp?" + query;
	
	// AJAX GET ���
	// GET����� ó���� �� �ִ� �ι�° ���
	$("#resultLayout").load(url);
	
}
</script>

</head>
<body>


	<input type="text" id="num1">
		<select id="oper">
			<option value="add">���ϱ�</option>
			<option value="sub">����</option>
			<option value="mul">���ϱ�</option>
			<option value="div">������</option>
		</select>
		<input type="text" id="num2">
		<input type="button" value=" = " onclick="send();"><br>
		
		<hr>
		<div id = resultLayout></div>

</body>
</html>

