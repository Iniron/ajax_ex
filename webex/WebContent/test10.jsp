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
	$("#btnSend").click(function(){
		var name=$("#name").val().trim();
		var content=$("#content").val().trim();
		
		var query="name="+name
			+"&content="+content;
		
		var url="test10_ok.jsp";
		$.ajax({
			type:"POST"
			,url:url
			,data:query
			,dataType:"xml"	//xml, json, jsonp등, 없으면 text
			,success:function(data){
				var out;
				out="개수 :" + $(data).find("dataCount").text()
				$(data).find("record").each(function(){
					var item=$(this);
					var num=item.attr("num");
					var name=item.find("name").text();
					var content=item.find("content").text();
					
					out+="<br>번호:"+num;
					out+="<br>이름:"+name;
					out+="<br>번호:"+content;
					out+="<br>----------<br>";
				});
				
				$("#resultLayout").html(out);
			}
			,error:function(e){
				console.log(e.responseText);
			}
		});
	});
});


</script>
</head>
<body>


	이름: <input type="text" id="name"><br>
	<textarea rows="5" cols="50" id="content"></textarea>
	<input type="button" id="btnSend" value="send">
	<br>
	
	<hr>
	<div id="resultLayout"></div>

</body>
</html>

