<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,DAO.GetData,DTO.ServicesDTO" %>
    <%@include file="index2.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<script>
function getdetails(servicename)
{
	var mydata={servicename:servicename};
	$.post("GetDetailsController",mydata,processresponse);
}
function processresponse(data)
{	$("#details").show();
	document.getElementById("details").innerHTML="<img src='images/close.png' onclick='emptydiv()' width=30 height=30 style='cursor:pointer;float:right;'>"+data;
}
function emptydiv()
{
	$("#details").animate({
		height:'hide'
	});
}
</script>
<body>

<div class="container-fluid">
<div class="row">
<div class="col-6">
<h1>My Previous Services Acquired</h1><br>
<%
String id=(String)session.getAttribute("id");
if(id==null)
{%>
	<script>
	alert("Before Login You Cannot Take Users Action!!!");
	window.location="index.html";
	</script>
<% }
else{
String name=(String)session.getAttribute("name");
String address=GetData.getAddress(id);
String mobile=GetData.getMobile(id);
ArrayList<ServicesDTO>prev=GetData.getPreviousService(id);
ArrayList<ServicesDTO>curr=GetData.getCurrentService(id);
%>
<%
if(prev.size()==0){%>
	<div class="shadow p-3 mb-5 bg-white rounded" style=' max-width:500px;margin-top:auto;border-radius:10px;text-align:center;'><h3>You don't have any previous history</h3></div>
<%}
else {
for(ServicesDTO obj:prev) 
 
{%><div class="shadow p-3 mb-5 bg-white rounded" style="max-width:500px;margin-top:auto;border-radius:10px;text-align:center;cursor:pointer"  onclick="getdetails('<%=obj.getServicename()%>')">
<h3><%=obj.getServicename()%></h3><br>
	<h3><%=obj.getBookingtime().toDate().toString()%></h3></div>
<% }}%>
<h1>My Current Services Acquired</h1><br>
<%
if(curr.size()==0){%>
<div class="shadow p-3 mb-5 bg-white rounded" style=' max-width:500px;margin-top:auto;border-radius:10px;text-align:center;'><h3>You don't have any current service booking</h3></div>
<%}
else {
for(ServicesDTO obj:curr) 
 
{%><div class="shadow p-3 mb-5 bg-white rounded" style="max-width:500px;margin-top:auto;border-radius:10px;text-align:center;cursor:pointer;"  onclick="getdetails('<%=obj.getServicename()%>')">
<h3><%=obj.getServicename()%></h3><br>
	<h3><%=obj.getBookingtime().toDate().toString()%></h3></div>
<% }}}%>
</div>
<div class="col-6">
<div class="shadow p-3 mb-5 bg-white rounded" style=' max-width:1000px;margin-top:30px;border-radius:10px;text-align:center;display:none;' id="details"></div>
</div>
</div>
</div>
</body>
</html>