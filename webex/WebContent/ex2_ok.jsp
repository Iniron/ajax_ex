<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("EUC-KR");

	String name = request.getParameter("name");
	String content = request.getParameter("content");

	JSONObject ob = new JSONObject();
	ob.put("count", 5);
	
	JSONArray arr = new JSONArray();
	for(int i=1; i<=5; i++){
		JSONObject o = new JSONObject();
		o.put("num", i);
		o.put("name", name+"-"+i);
		o.put("content", content+"-"+i);
		
		arr.add(o);
	}
	ob.put("list", arr);
	
	out.print(ob.toString());	
%>








