<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#userId").change(function(){
		var userId = $("#userId").val();
		if(!userId){
			$("#userId").focus();
			return;
		}
		
		var url = "test11_ok.jsp"
		
		$.post(url, {userId:userId}, function(data){
			//console.log(data);
			var uid = data.userId;
			var pass = data.pass;
			
			var out=uid+"���̵�� ";
			if(pass=="true"){
				out+="��� �����մϴ�."
				$("#userIdState").html(out);
			}else{
				out+="����� �� �����ϴ�."
				$("#userIdState").html(out);
				$("#userIdState").val("");
				$("#userId").focus();
				return false;
			}
			
		}, "json");
	});
});


</script>
</head>
<body>


	<form action="" method="post">
		���̵�: <input type="text" name="userId" id="userId">
		<span id="userIdState"></span>
		<br>		
		�н�����: <input type="password" name="userPwd" id="userPwd">
	</form>

</body>
</html>

