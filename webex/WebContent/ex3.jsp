<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#btnSend").click(function(){
		var query=
			$('form[name=guestForm]').serialize();
		var url="ex3_ok.jsp?" + query;
		
		//ajax를 처리할 수 있는 또다른 방법
		//단 get방식만 처리할 수 있다. 서버에서 클라이언트로 json으로 던져줄 경우 사용시 편리함(ex, 교통정보)
		$.getJSON(url, function(data){
			var out;
			out = "개수: " + data.count;
			for(var i=0; i<data.list.length; i++){
				var num=data.list[i].num;
				var name=data.list[i].name;
				var content=data.list[i].content;
				
				out+="<br>번호:"+num;
				out+="<br>이름:"+name;
				out+="<br>내용:"+content;
				out+="<br>==========<br>"
			}
			$("#name").val("");
			$("#content").val("");
			
			$("#resultLayout").html(out);
		});
	});
});

function check() {
	if(!$("#name").val()){
		$("#name").focus();
		return false;
	}
	if(!$("#content").val()){
		$("#content").focus();
		return false;
	}

}



</script>


</head>
<body>

<form name="guestForm">
	이름: <input type="text" name="name" id="name"><br>
	<textarea rows="5" cols="50" name="content" id="content"></textarea>	
	<button type="button" id="btnSend">보내기</button>
</form>

<hr>
<div id="resultLayout"></div>












</body>
</html>