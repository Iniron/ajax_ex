<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="text1_ok.jsp" method="post">
		<input type="text" name="num1"><br>
		<select name="oper">
			<option value="add">���ϱ�</option>
			<option value="sub">����</option>
			<option value="mul">���ϱ�</option>
			<option value="div">������</option>
		</select>
		<input type="text" name="num2">
		<input type="submit" value=" = "><br>
	</form>
</body>
</html>