<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Equipment Create/View Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
$(document).ready(function(){
	document.getElementById('lol').style.visibility = 'hidden';
	document.getElementById('EditSubmit').style.visibility = 'hidden';
	document.getElementById('DeleteSubmit').style.visibility = 'hidden';
	$("#AddCheck").click(function(){
		
		var Validation = true;
		
		//NameChecker	
		var checkName =  $("#CheckName").val();
			
		if( /^[^-\s][a-zA-Z_\s-]+$/.test(checkName))
		{
			$('#NameMsg').html("Correct");
		}
		else
		{
			$('#NameMsg').html("Name is not entered correctly");
			Validation = false;
		}
		
		//NumberChecker	
		var CheckNum =  $("#CheckNum").val();
			
		if( /^[0-9]+$/.test(CheckNum))
		{
			$('#NumMsg').html("Correct");
		}
		else
		{
			$('#NumMsg').html("Not every character is number");
			Validation = false;
		}
	
		//Submission upon completion
		if(Validation == true)
		{
			//$("#FormComplete").css('display','block');
			//$('#form1').submit();
			//document.getElementById("form1").submit();
			//document.forms['form1'].submit();
			//form.submit();
			//document.myform.submit();
			document.getElementById('lol').click();
		}
	});
	
$("#EditCheck").click(function(){
		
		var Validation = true;
		
		//Product Group
		
		if( $('input[name=id]:checked').val())
		{
		
			
		
		}
		else
		{
		
			$('#DialCheck').html("Please select an option");
			Validation = false;
		
		}
		
		if(Validation == true){
			
			document.getElementById('EditSubmit').click();
		}
	
	});	

$("#DeleteCheck").click(function(){
	
	var Validation = true;
	
	//Product Group
	
	if( $('input[name=id]:checked').val())
	{
	
		
	
	}
	else
	{
	
		$('#DialCheck').html("Please select an option");
		Validation = false;
	
	}
	
	if(Validation == true){
		
		document.getElementById('DeleteSubmit').click();
	}

});	

});


</script>
<style>
body{
 background-image:url(https://i.imgur.com/j8Hd5eh.jpg?1);
 background-size:cover;
 color:white;
 text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
 text-align: center;
 font-family: sans-serif;
}
h1{
 font-family: 'Octin Spraypaint', sans-serif;
 font-size: 300%;
}
form{
 border:5px solid white;
 border-radius: 20px;
}
</style>



</head>
<body>

<form action="NavigationServlet" method="post" id = "form1" name = "form1">
<h1>CREATE EQUIPMENT<span id = "tester"></span></h1>
Description: <input type="text" name="description" id = "CheckName"><span id = "NameMsg"></span>
Weight: <input type="number" name="weight" id = "CheckNum"> oz. <span id = "NumMsg"></span>
<input type="submit" value="Add Item" name="doThis" id = "lol">
<input type="button" value="Add Item" name="doThis" id = "AddCheck">
</form><br />

<!-- ******************************** LIST VIEWER **************************** -->

<form method="post" action="NavigationServlet">
<h1>EXISTING EQUIPMENT</h1>
<table>
<tr><span id = "DialCheck"></span></tr>
<c:forEach items="${requestScope.allItems}" var="currentitem">
<tr>
	<td><input type="radio" name="id" value="${currentitem.id}"></td>
	<td>${currentitem.description}</td>
	<td>${currentitem.weight} oz.</td>
</tr>
</c:forEach>
</table>
<input type="button" value="Edit Item" name="doThis" id = "EditCheck">
<input type="button" value="Delete Item" name="doThis" id = "DeleteCheck"><br />
<input type="submit" value="Edit Item" name="doThis" id = "EditSubmit">
<input type="submit" value="Delete Item" name="doThis" id = "DeleteSubmit"><br />
</form><br />

<input type="button" onclick="location.href='Index.html';" value="Return to Home Page"/>
</body>
</html>