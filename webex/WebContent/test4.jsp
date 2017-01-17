<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">

//AJAX ��ü ����
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

var xmlHttp =null;
function send() {
	var name = document.getElementById("name").value;
	var content = document.getElementById("content").value;
	
	//alert(num1+":"+num2+":"+oper);
	var query;
	query = "name=" + name + "&content=" + content;
	
	var url = "text4_ok.jsp";
	
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
	var xml = xmlHttp.responseXML;	//�������� XML�� �����߱⶧���� XML�� �޴´�
	
	//console.log(xml);
	
	var s;
	var root = xml.getElementsByTagName("guest")[0];
	var dataCount = xml.getElementsByTagName("dataCount")[0].firstChild.nodeValue;
	
	//alert(dataCount);
	
	s = "������ ����: " + dataCount + "<br>";
	
	var records = root.getElementsByTagName("record");
	for(var i=0; i<records.length; i++){
		var item = records[i];
		
		var num = item.getAttribute("num");
		var name= item.getElementsByTagName("name")[0].firstChild.nodeValue;
		var content = item.getElementsByTagName("content")[0].firstChild.nodeValue;
		
		s+="��ȣ:"+num+"<br>";
		s+="�̸�:"+name+"<br>";
		s+="����:"+content+"<br>";
		s+="=================<br>";
		
		
	}
	
	lay.innerHTML=s;
}

</script>
</head>
<body>


	�̸�: <input type="text" id="name"><br>
	<textarea row="5" cols="40" id="content"></textarea>
	<button type="button" onclick="send();">������</button>

</body>
</html>

