<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="index2.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Service Kart</title>
  
<script type="text/javascript">
function show()
{
	$("#spinner").show();
}
</script>
</head>
<body>
<%
String id=(String)session.getAttribute("id");
if(id==null)
{%>
	<script>
	alert("To Avail Services Please Login First");
	window.location="index.html";
	</script>
<%}

String service=request.getParameter("service");
if(service==null)
{%>
<script>
alert("Before Confirming Please Avail Some Services");
window.location="index.html";
</script>
<%} %>
<div class="shadow p-3 mb-5 bg-white rounded" style=' max-width:800px;margin-left:auto;margin-right:auto;margin-top:100px;border-radius:10px;text-align:center;'>

<h1>Consult Service</h1>
<h3><%=service %></h3>
<br>
<form action="SmsServlet">
<h2>When would you like to consult?</h2><br>
<input type="radio" name='time'checked value='Within 90 minutes'><b>Within 90 minutes</b><br>
<input type="radio" name='time' value='After 90 minutes'><b>After 90 minutes</b><br>
<input type="radio" name='time' value='Tomorrow'><b>Tomorrow</b><br>
<input type="hidden" value="<%=service%>" name="service"><br>
<input type="hidden" value="consulting" name="consulting"><br>
<input type="submit" value="Confirm booking" class="btn btn-danger btn-lg btn-block" onclick="show()">
</form>
<br>
<div class="spinner-grow text-danger" role="status" style="display:none;" id="spinner">
  <span class="sr-only">Loading...</span>
</div>
</div>

</body>
</html>