<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/xml; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("userId");
	
	
	String pass="true";
	if(userId.equals("test"))
		pass="false";
	
	
	//���̽� ������ ����� �پ�
	//{"Ű1":"��1", "Ű2":"��2"} Ű���� ��Ÿ��ǥ�� ���´�
	
	StringBuffer sb = new StringBuffer();
	sb.append("{");
	sb.append("\"userId\""+":\""+userId+"\"");
	sb.append(",\"pass\""+":\""+pass+"\"");
	sb.append("}");
		
	out.print(sb.toString());	//������ Ŭ���̾�Ʈ�� ����
	
%>