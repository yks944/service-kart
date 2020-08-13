<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import='DAO.GetData,DTO.UserDTO' %>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <meta http-equiv="Cache-Control" content="no-cache" />
     
         <link rel="stylesheet" href="stylesheet.css">
       
        <script src="myjs/signinjs.js"></script>

       
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 
       
        <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-firestore.js"></script>
        <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-auth.js"></script>
    
        <script src="myjs/signinjs.js"></script>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
       
 
       
        <title>Service Kart</title>
        <link rel="icon" href="images/house.png" type = "image/x-icon">
        <script>

           var firebaseConfig = {
                apiKey: "AIzaSyCf8Orhqf9teF-4OUvUL3VHotD1IpPLvJs",
                authDomain: "serviceskart-b8177.firebaseapp.com",
                databaseURL: "https://serviceskart-b8177.firebaseio.com",
                projectId: "serviceskart-b8177",
                storageBucket: "serviceskart-b8177.appspot.com",
                messagingSenderId: "175433748970",
                appId: "1:175433748970:web:5029cf2ff709517d686293"
            };

            firebase.initializeApp(firebaseConfig);

            $(document).ready(function () {
                firebase.auth().onAuthStateChanged(function (user) {
                    if (user) {
                        // User is signed in.
                        console.log("signed in");
                        console.log(user.uid);
                        $("#btn").hide();
                        $("#navbarDropdownMenuLink").show();
                        $("#img1").attr("src", user.photoURL)
                        document.getElementById("navbarDropdownMenuLink").innerHTML = user.displayName;
                    } else {
                        // No user is signed in.
                        $("#btn").click(function () {
                            signin();
                        });

                    }
                });
            }); 
            function update(name, id)
            {
                console.log(id);
                console.log(name);
                var houseno = document.getElementById("1").value;
                var locality = document.getElementById("2").value;
                var area = document.getElementById("3").value;
                var city = document.getElementById("4").value;
                var mobile=document.getElementById("5").value;
                var fulladdress = houseno + "," + locality + "," + area + "," + city;

                var mydata = {username: name, add: fulladdress, uid: id,mno:mobile};
                $.post("UpdateAddress", mydata, processresponse);
            }
            function processresponse(data)
            {   $("#div1").css("color","#0066ff");
                $("#div1").text(data);
                $("#div1").fadeOut(5000);
            }
            function chk()
            {

            }
        </script>
       
    </head>
    
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="index.html"><img alt="" src="images/house.png" height=30 width=30></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="index.html">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Contact</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">About Us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"><button class="loginBtn loginBtn--google btn-danger" id='btn'>Login With Google</button></a>
      </li>
      <li class="nav-item dropdown">
        <button class="nav-link dropdown-toggle btn btn-danger" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="display:none;">
          Dropdown link
        </button>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="Profile.jsp">Profile</a>
            <a class="dropdown-item" href="MyServices.jsp">MyService</a>
          <a class="dropdown-item" onclick='signout()' href="">Logout</a>
         
        </div>
      </li>
    </ul>
  </div>
</nav> 
       <%
            String name = (String) session.getAttribute("name");
       		String uid=(String)session.getAttribute("id");
        //	out.print("<h1>"+name+"</h1>");
            String img = null;
            String email = null;
            String address = null;
            String id = null;
            String mobile=null;
            if (uid== null) {
            	%>
                <script>
                alert("To View Your Profile Please Login First");
                window.location="index.html";
                </script>
            <%} else {
                img = (String) session.getAttribute("img");
                email = (String) session.getAttribute("email");
                id = (String) session.getAttribute("id");

                address = GetData.getAddress(id);
                mobile=GetData.getMobile(id);
                out.print("<center>");
//                out.print("<div style='margin-top:12px;'");
                
              out.print("<div class='shadow p-3 mb-5 rounded profile' style=' max-width:800px;margin-left:auto;margin-right:auto;margin-top:80px;border-radius:10px;'>");
                out.print("<div><img src='' style='border-radius:50%;margin-top:5px;' id='img1' height='100' width='100'></div>");
                out.print("<div style='margin-top:12px;'");
                 out.print("<div><input type='text' value='" + name + "' size='35' readonly style='text-align:center;border:0px;'></div>");
                out.print("<div><input type='text' value='" + email + "' size='35' readonly style='text-align:center;border:0px;'></div>");
                out.print("</div>");
               out.print("</div>");
//               out.print("</div>");
                out.print(" <hr class='my-4'>");
                if (address != null ) {
                   
//                     out.print("<div class='col-sm-6'><img src='images/14593-mortgage-loader.gif' width='500px' height='300px'></div>");
//                      out.print("<div class='col-sm-6>'");
                    out.print("<h1>Address</h1>");
                   
                    String arr[] = address.split(",");
                    String srr[] = {"House No.", "Locality", "Area", "City"};
                    
                    out.print("<table>");
//                   out.print("<div>");
                    int elementid = 1;
                    for (int i = 0; i < arr.length-1; i++) {
                        out.print("<div><tr><td>" + srr[i] + "</td><td><input type='text' value='" + arr[i] + "' size='50'  id='" + elementid + "' required  style=' padding: 5px;'></td></tr></div>");
                        elementid += 1;
                    }
                     out.print("<div><tr><td>City</td><td><input type='text' value='Bhopal' size='50'  id='4' required  style=' padding: 5px;' readonly></td></tr></div>");
                    if(mobile!=null){
                    out.print("<div><tr><td>Mobile No.</td><td><input type='text' value='"+mobile+"' size='50' required id='5'  style=' padding: 5px;'></td></tr></div>");
                    
                    }
                    else
                    {
                           out.print("<div><tr><td>Mobile No.</td><td><input type='text'  size='50' required id='5'  style=' padding: 5px;'></td></tr></div>");
                    }
//                    out.print("</div>");
                    out.print("</table>");
                    
                    out.print("<button onclick=\"update('" + name + "','" + id + "' )\" class='btn btn-primary btn-lg' style='margin-top:10px;'>Update");
                    out.print("</button>");
//                        out.print("</div>");
//                         out.print("</div>");
                } 
            else {
                    out.print("<h1>Address</h1>");
//                    out.print("<img src='images/14593-mortgage-loader.gif' width='500' height='300'>");
                    String srr[] = {"House No.", "Locality", "Area", "City"};
                    out.print("<table>");

                      // out.print("<div class='yash'>");
                    out.print("<div><tr><td>House No.</td><td><input type='text'  size='50'  id='1'   style=' padding: 5px;'></td></tr></div>");
                    out.print("<div><tr><td>Locality</td><td><input type='text'  size='50'  id='2' required   style=' padding: 5px;'></td></tr></div>");
                    out.print("<div><tr><td>Area</td><td><input type='text'  size='50'  id='3' required   style=' padding: 5px;'></td></tr></div>");
                    out.print("<div><tr><td>City</td><td><input type='text'  size='50'  id='4' required   style=' padding: 5px;' value='Bhopal' readonly></td></tr></div>");
                   if(mobile!=null){
                    out.print("<div><tr><td>Mobile No.</td><td><input type='text' value='"+mobile+"' size='50' required id='5' style=' padding: 5px;'></td></tr></div>");
                    }
                    else
                    {
                           out.print("<div><tr><td>Mobile No.</td><td><input type='text'  size='50' required id='5'style=' padding: 5px;'></td></tr></div>");
                    }
                  // out.print("</div>");
                    out.print("</table>");

                    out.print("<button onclick=\"update('" + name + "','" + id + "' )\" class='btn btn-primary btn-lg' style='margin-top:10px;'>Update");
                    out.print("</button>");
                }
                out.print("<div id='div1'></div>");
               
                out.print("</div>");
                 out.print("</center>");
            }

        %> 

        <!-- <footer class="footer" style="margin-top:210px;">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <h5><i class="fa fa-road"></i>Service Kart</h5>
                <div class="row">
                    <div class="col-6">
                        <ul class="list-unstyled">
                            <li><a href="">Product</a></li>
                            <li><a href="">Benefits</a></li>
                            <li><a href="">Partners</a></li>
                            <li><a href="">Team</a></li>
                        </ul>
                    </div>
                    <div class="col-6">
                        <ul class="list-unstyled">
                            <li><a href="">Documentation</a></li>
                            <li><a href="">Support</a></li>
                            <li><a href="">Legal Terms</a></li>
                            <li><a href="">About</a></li>
                        </ul>
                    </div>
                </div>
                <ul class="nav">
                    <li class="nav-item"><a href="" class="nav-link pl-0"><i class="fa fa-facebook fa-lg"></i></a></li>
                    <li class="nav-item"><a href="" class="nav-link"><i class="fa fa-twitter fa-lg"></i></a></li>
                    <li class="nav-item"><a href="" class="nav-link"><i class="fa fa-github fa-lg"></i></a></li>
                    <li class="nav-item"><a href="" class="nav-link"><i class="fa fa-instagram fa-lg"></i></a></li>
                </ul>
                <br> -->
            </div>
<!--            <div class="col-md-2">
                <h5 class="text-md-right">Send Feedback</h5>
                <hr>
            </div>-->
<!--            <div class="col-md-5">
                <form action="SendMail" method="post">
                    <fieldset class="form-group">
                        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                    </fieldset>
                    <fieldset class="form-group">
                        <textarea class="form-control" id="exampleMessage" placeholder="Message"></textarea>
                    </fieldset>
                    <fieldset class="form-group text-xs-right">
                        <button type="button" class="btn btn-secondary-outline btn-light">Send</button>
                    </fieldset>
                </form>
            </div>-->
        <!-- </div>
    </div>
</footer> -->



    </body>
</html>
