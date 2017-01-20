<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>	<!-- 공백제거 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css">
<style type="text/css">
.title {
	font-weight: bold;
	font-size:13pt;
	margin-bottom:10px;
	font-family: 나눔고딕, "맑은 고딕", 돋움, sans-serif;
}
</style>

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function(){
	listPage(1);
});

function listPage(page) {
	var url="<%=cp%>/guest/list.do";
	
	$.post(url,{pageNo:page},function(data){
		printGuest(data);
	},"json");
}

function printGuest(data) {
	//$("#listGuest").show();

	var dataCount=data.dataCount;
	var pageNo=data.pageNo;
	var paging=data.paging;
	
	var out="";
	if(dataCount!=0) {
		out="<table style='width: 600px; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;'>";
		for(var idx=0; idx<data.list.length; idx++) {
			var num=data.list[idx].num;
			var name=data.list[idx].name;
			var content=data.list[idx].content;
			var created=data.list[idx].created;
			
			out+="<tr height='30' bgcolor='#EEEEEE' style='border: 1px solid #DBDBDB;'>";
			out+="  <td width='50%' style='padding-left: 5px;'>"+ name+"</td>";
			out+="  <td width='50%' align='right' style='padding-right: 5px;'>" + created;
			out+=" | <a onclick='deleteGuest(\""+num+"\", \""+pageNo+"\");'>삭제</a></td>" ;
			out+="</tr>";
			out+="<tr height='50'>";
			out+="   <td colspan='2' style='padding: 5px;' valign='top'>"+content+"</td>";
			out+="</tr>";
		}
		out+="<tr height='30'>";
		out+="  <td colspan='2' align='center'>";
		out+=paging;
		out+="  </td>";
		out+="</tr>";
		out+="</table>";
	}
	
	$("#listGuest").html(out);
}

$(function(){
	$("#btnSend").click(function(){
		  var query=$('form[name=guestForm]').serialize();
		  var url="<%=cp%>/guest/insert.do";
		  
		  $.ajax({
			 type:"post"
			 ,url:url
			 ,data:query
			 ,dataType:"json"
			 ,success:function(data){
				 console.log(data.state);
				 listPage(1);
				 
				 $("#name").val("");
				 $("#content").val("");
			 }
		  	 ,beforeSend:check
		  	 ,error:function(e){
		  		 console.log(e.responseText);
		  	 }
		  });
		  
	});
});

function check() {
	var name=$("#name").val().trim();
	var content=$("#content").val().trim();
	
	if(! name) {
		alert("이름을 입력하세요 !!!");
		$("#name").focus();
		return false;
	}
	
	if(! content) {
		alert("내용을 입력하세요 !!!");
		$("#content").focus();
		return false;
	}
	
	return true;
}

function deleteGuest(num, page) {

}
</script>

</head>
<body>

	<table style="width: 600px; margin: 30px auto 0px; border-spacing: 0px;">
	<tr height="40">
		<td align="left" class="title">
			<span style="font-weight: bold;">| 방명록</span>
		</td>
	</tr>
	</table>

    <form name="guestForm">
    <table style="width: 600px; margin: 0px auto; margin-top: 5px;">
         <tr height="40">
         		<td width="520">
         		   작성자 :
         		   <input type="text" name="name" id="name" class="boxTF" size="30">
         		</td>
         		<td width="80">&nbsp;</td>
         </tr>
             
		<tr height="50">
			<td width="520" align="left">
			    <textarea rows="5" cols="85" class="boxTF" name="content" id="content" style="width:515px; height: 45px;"></textarea>
			</td>
			<td width="80" align="right">
			   <button type="button" id="btnSend" class="btn"
			           style="width: 60px; height: 52px;">등록</button> 
			</td>
		</tr>           
     </table>
     </form>
        
     <div id="listGuest"></div>

</body>
</html>