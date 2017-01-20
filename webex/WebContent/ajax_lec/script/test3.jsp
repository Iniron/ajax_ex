<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">

//AJAX ��ü ����
var xmlHttp =null;
function createXMLHttpRequest() {
 var xmlReq = null;

 if (window.XMLHttpRequest) { // IE 7.0 �̻�, Non-Microsoft browsers
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
	
	//AJAX ��ü ����
	xmlHttp = createXMLHttpRequest();
	//�������� ó���ϰ� ����� ������ �ڹٽ�ũ��Ʈ �Լ�����
	//callback <-������ ���������� ��� �ڹ� ��ũ��Ʈ �Լ��� �Ұ�����, ()��ȣ X
	xmlHttp.onreadystatechange = callback;
	//GET ���
	xmlHttp.open("POST", url, true);	//����
	//xmlHttp:setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlHttp.setRequestHeader("Content-Type", 
	"application/x-www-form-urlencoded");
	xmlHttp.send(query);				//������ ���� ��û
	
	//POST������� �����ϰ� �������� open�޼ҵ��� ������ GET -> POST
	//������Ʈ���� �����Ѵ� text2_ok.jsp? + query -> text2_ok.jsp
	//contentType�� ��� -> xmlHttp:serRequestHeader("Content-Type","application/x-www-form-urlencoded");
}

function callback(){
	if(xmlHttp.readyState==4){	//����û����Ϸ� : ready�����ڵ�� pdf��..
		if(xmlHttp.status==200){//�����κ����ǻ����ڵ�()
			printData();
		}
	}
}

function printData(){
	var lay = document.getElementById("resultLayout");
	//�������� txt�� �����߱⶧���� text�� �޴´�
	var result = xmlHttp.responseText;	
	lay.innerHTML = result;
}
</script>
</head>
<body>


	<input type="text" id="num1">
		<select id="oper">
			<option value="add">���ϱ�</option>
			<option value="sub">����</option>
			<option value="mul">���ϱ�</option>
			<option value="div">������</option>
		</select>
		<input type="text" id="num2">
		<input type="button" value=" = " onclick="send();"><br>
		
		<hr>
		<div id = resultLayout></div>

</body>
</html>

