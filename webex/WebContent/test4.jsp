<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">

//AJAX 객체 생성
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

var xmlHttp =null;
function send() {
	var name = document.getElementById("name").value;
	var content = document.getElementById("content").value;
	
	//alert(num1+":"+num2+":"+oper);
	var query;
	query = "name=" + name + "&content=" + content;
	
	var url = "text4_ok.jsp";
	
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
	var xml = xmlHttp.responseXML;	//서버에서 XML로 전송했기때문에 XML로 받는다
	
	//console.log(xml);
	
	var s;
	var root = xml.getElementsByTagName("guest")[0];
	var dataCount = xml.getElementsByTagName("dataCount")[0].firstChild.nodeValue;
	
	//alert(dataCount);
	
	s = "데이터 개수: " + dataCount + "<br>";
	
	var records = root.getElementsByTagName("record");
	for(var i=0; i<records.length; i++){
		var item = records[i];
		
		var num = item.getAttribute("num");
		var name= item.getElementsByTagName("name")[0].firstChild.nodeValue;
		var content = item.getElementsByTagName("content")[0].firstChild.nodeValue;
		
		s+="번호:"+num+"<br>";
		s+="이름:"+name+"<br>";
		s+="내용:"+content+"<br>";
		s+="=================<br>";
		
		
	}
	
	lay.innerHTML=s;
}

</script>
</head>
<body>


	이름: <input type="text" id="name"><br>
	<textarea row="5" cols="40" id="content"></textarea>
	<button type="button" onclick="send();">보내기</button>

</body>
</html>

