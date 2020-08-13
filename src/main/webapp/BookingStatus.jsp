<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import='DAO.GetData' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service Kart</title>
         <link rel="icon" href="images/house.png" type = "image/x-icon">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </head>
    <body>
    <%
    	String id=(String)session.getAttribute("id");
    	if(id==null)
    	{%>
    	<script>
    	alert("Please Login First!!!")
    	window.location="index.html";
    	</script>
    		
    	<% }
    %>
        <h1 style="text-align:center;">Booking Status</h1>
        <%
            String service=(String)request.getAttribute("ServiceRequired");
        	String time=(String)request.getAttribute("Time");
        	String name=(String)session.getAttribute("name");
        	String uid=(String)session.getAttribute("id");
        	String address=GetData.getAddress(uid);
        	String mobile=GetData.getMobile(uid);
        	if(service==null || time==null)
        	{%>
        		<script type="text/javascript">
        		alert("You Cannot Directly Visit Here Without Any Booking!!!")
        		window.location="index.html";
        		</script>
        <% 	}
            
        %>
        <div class="shadow p-3 mb-5 bg-white rounded" style=' max-width:800px;margin-left:auto;margin-right:auto;margin-top:100px;border-radius:10px;text-align:center;'>
        <h3><b>Name:</b><%=name %></h3><br>
        <h3><b>Address:</b><%=address %></h3><br>
        <h3><b>Mobile:</b><%=mobile %></h3><br>
        <h3><b>Service Acquired:</b><%=service %></h3><br>
        <h3><b>Time:</b><%=time%></h3><br>
         <div id="countdown"> You will be forwarded to home page in 10 seconds</div>
        </div>
       
        <script>
             setTimeout(function(){ window.location="index.html" }, 10000);
             
        </script>
    </body>
</html>
