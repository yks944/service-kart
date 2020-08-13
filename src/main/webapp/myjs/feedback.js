/**
 * 
 */
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$("#feedbtn").click(function(){
    var email=document.getElementById("exampleInputEmail1");
    var msg=document.getElementById("exampleMessage");
    var data={email:email,message:msg};
    console.log("clicked");
    $.post("SendFeedback",data,processresponse);
});
function processresponse(data)
{
    if(data=="sent")
    {
        var ref=document.getElementById("sentmsg");
        ref.innerHTML=data;
    }
}

