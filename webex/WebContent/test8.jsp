<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript">

$("#btnSend").click(function(){
	//aa
	var num1 = $("#num1").val();
	var num2 = $("#num2").val();
	var oper = $("#oper").val();
	var url = "text8_ok.jsp";
	var query = "n1="+num1+"&n2="+num2;
	query+="&oper="+oper;
	
	$.ajax({
		type:"POST"
		,url:url
		,data:query
		,success:function(data){
			$("#resultLayout").html(data);
			$("#num1").val("");
			$("#num2").val("");
			$("#oper").val("add");
		}
		,error:function(e){
			alert(e.responseText);
		}
	});
});
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
		<input type="button" id="btnSend" value=" = "><br>
		
		<hr>
		<div id = resultLayout></div>

</body>
</html>

