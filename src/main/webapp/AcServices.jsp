<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import='ServiceImages.Images,java.util.*' %>
    <%@include file="index2.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
 <center><h2 style="padding-top:30px;padding-left:10px;">Ac Services</h2></center><br>
<main role="main">
<div class="album py-5 bg-light">
    <div class="container">
    <div class="row">
    
<%
	
	Map<String,String>mp=Images.getAcServiceImages();

	for(String Acsubser:mp.keySet())
	{%>
	
	 <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
           <img class="card-img-top" src="<%=mp.get(Acsubser)%>" height=250 width=250>
            <div class="card-body">
              <h3 class="card-text"><%=Acsubser %></h2>
			 <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                <a href='Confirm.jsp?service=<%=Acsubser%>'>  <button type="button" class="btn btn-sm btn-outline-secondary">Book Now</button></a>
                
                </div>
               
              </div>
            </div>
          </div>
        </div>
   
      <% }%>

       
   

   
        
        
       
           
       
      </div>
     
        </div>
        </div>
</main>
<!-- <footer class="footer">
    <div class="container">
        <div class="row">
          <div class="col-md-2">
                <h5 class="text-md-right">Send Feedback</h5>
                <hr>
            </div>
           <div class="col-md-5">
                <form action="SendFeedback" method="post">
                    <fieldset class="form-group">
                        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" name="email">
                    </fieldset>
                    <fieldset class="form-group">
                        <textarea class="form-control" id="exampleMessage" placeholder="Message" name="message"></textarea>
                    </fieldset>
                    <fieldset class="form-group text-xs-right">
                        <button type="button" class="btn btn-secondary-outline btn-light" id="feedbtn">Send</button>
                       
    
                    </fieldset>
                    <div id="sentmsg"></div>
                </form>
            </div>
       </div>
    </div>
</footer>      -->  	
</body>
</html>
