<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">

//AJAX 객체 생성
var xmlHttp =null;
function createXMLHttpRequest() {
 var xmlReq = null;

 if (window.XMLHttpRequest) { // IE 7.0 이상, Non-Microsoft browsers
     xmlReq = new XMLHttpRequest();
 } else if (window.ActiveXObject) {
     try {
         // XMLHttpRequest in later versions of Internet Explorer
         xmlReq = new ActiveXObject("Msxml2.XMLHTTP");
     } catch (e1) {
         try {
             // Try version supported by older versions of Internet Explorer
             xmlReq = new ActiveXObject("Microsoft.XMLHTTP");
         } catch (e2) {
             // Unable to create an XMLHttpRequest with ActiveX
         }
     }
 }

 return xmlReq;
}

//var xmlHttp =null;
function send() {
	var num1 = document.getElementById("num1").value;
	var num2 = document.getElementById("num2").value;
	var oper = document.getElementById("oper").value;
	
	//alert(num1+":"+num2+":"+oper);
	var query;
	query = "num1="+num1 + "&num2="+num2;
	query += "&oper="+oper;
	
	var url = "test3_ok.jsp";
	
	//AJAX 객체 생성
	xmlHttp = createXMLHttpRequest();
	//서버에서 처리하고 결과를 전송할 자바스크립트 함수지정
	//callback <-서버가 돌려줬을때 어떠한 자바 스크립트 함수를 할것인지, ()괄호 X
	xmlHttp.onreadystatechange = callback;
	//GET 방식
	xmlHttp.open("POST", url, true);	//설정
	//xmlHttp:setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlHttp.setRequestHeader("Content-Type", 
	"application/x-www-form-urlencoded");
	xmlHttp.send(query);				//데이터 전송 요청
	
	//POST방식으로 전달하고 싶은경우는 open메소드의 설정을 GET -> POST
	//쿼리스트링을 제거한다 text2_ok.jsp? + query -> text2_ok.jsp
	//contentType을 명시 -> xmlHttp:serRequestHeader("Content-Type","application/x-www-form-urlencoded");
}

function callback(){
	if(xmlHttp.readyState==4){	//모든요청응답완료 : ready응답코드는 pdf에..
		if(xmlHttp.status==200){//서버로부터의상태코드()
			printData();
		}
	}
}

function printData(){
	var lay = document.getElementById("resultLayout");
	//서버에서 txt로 전송했기때문에 text로 받는다
	var result = xmlHttp.responseText;	
	lay.innerHTML = result;
}
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
		<input type="button" value=" = " onclick="send();"><br>
		
		<hr>
		<div id = resultLayout></div>

</body>
</html>

