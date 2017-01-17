<%@ page language="java" contentType="text/xml; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
%>



<guest>
	<dataCount>5</dataCount>
	<%for(int n=1; n<=5; n++){ %>
		<record num="<%=n%>">
			<name><%=n%>:<%=name%></name>
			<content><![CDATA[<%=n%>:<%=content%>]]></content>
		</record>
	<%} %>	
</guest>