/**
 * 
 */
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 function signin()
  {

var provider = new firebase.auth.GoogleAuthProvider();
      firebase.auth().signInWithPopup(provider).then(function(result) {
 
  var token = result.credential.accessToken;

  var user = result.user;
  var details={name:user.displayName,img:user.photoURL,email:user.email,id:user.uid};
 

  $("#btn1").hide();
  $("#navbarDropdownMenuLink").show();

document.getElementById("navbarDropdownMenuLink").innerHTML=user.displayName;
  console.log(user.displayName+""+user.emailVerified+""+user.uid);

  $.post("SessionAdd",details);
}).catch(function(error) {
  // Handle Errors here.
  var errorCode = error.code;
  var errorMessage = error.message;
  // The email of the user's account used.
  var email = error.email;
  // The firebase.auth.AuthCredential type that was used.
  var credential = error.credential;
  // ...
});
  }
  function signout()
  {
      firebase.auth().signOut().then(function() {
  console.log("signout");

 $("#btn").show();
 $("#navbarDropdownMenuLink").hide();
 $("#name").text("");
 $("#mail").text("");
 $("#userimg").attr("src","");
 $("#userimg").attr("alt","");
 window.location="SessionAdd?delsession=session";
// signOut();
}).catch(function(error) {
  // An error happened.
});
  }