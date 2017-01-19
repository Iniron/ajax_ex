<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	int num1 = Integer.parseInt(
			request.getParameter("num1"));
	int num2 = Integer.parseInt(
			request.getParameter("num2"));
	String oper=request.getParameter("oper");
	
	String s="";
	if(oper.equals("add")) {
		s=String.format("%d+%d=%d", num1, num2,
		        num1+num2);
	} else if(oper.equals("sub")) {
		s=String.format("%d-%d=%d", num1, num2,
		        num1-num2);
	} else if(oper.equals("mul")) {
		s=String.format("%d*%d=%d", num1, num2,
		        num1*num2);
	} else if(oper.equals("div")) {
		s=String.format("%d/%d=%d", num1, num2,
		        num1/num2);
	}

	// Thread.sleep(3000);
%>


<b><%=s%></b>






