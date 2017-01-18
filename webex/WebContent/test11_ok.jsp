<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/xml; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("userId");
	
	
	String pass="true";
	if(userId.equals("test"))
		pass="false";
	
	
	//제이슨 데이터 만드는 바업
	//{"키1":"값1", "키2":"값2"} 키값은 쌍타옴표로 묶는다
	
	StringBuffer sb = new StringBuffer();
	sb.append("{");
	sb.append("\"userId\""+":\""+userId+"\"");
	sb.append(",\"pass\""+":\""+pass+"\"");
	sb.append("}");
		
	out.print(sb.toString());	//서버가 클라이언트로 전송
	
%>