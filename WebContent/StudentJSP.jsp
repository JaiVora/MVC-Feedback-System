<!-- Author: Jai Vora
	 StudentJSP loads student information based on StudentID 
 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StudentJSP</title>
</head>
<body>
<h1>Student Survey form for ${studentbean.getStudentId()}</h1>
<ul>
	<li>User Name: ${studentbean.getUsername()}</li>
	<li>Address: ${studentbean.getAddress()}</li>
	<li>ZipCode: ${studentbean.getZip()}</li>
	<li>City: ${studentbean.getCity()}</li>
	<li>State: ${studentbean.getState()}</li>
	<li>Phone: ${studentbean.getPhone()}</li>
	<li>Email: ${studentbean.getEmail()}</li>
	<li>URL: ${studentbean.getLink()}</li>
	<li>Date: ${studentbean.getDate()}</li>
	<li>Year: ${studentbean.getYear()}</li>
	<li>Likelihood: ${studentbean.getLikelihood()}</li>
	<li>How did you get to know about the university ${studentbean.getInterest()}</li>
	<li>Comments: ${studentbean.getComment()}</li>
	<li>What do you like about Campus: ${studentbean.getCs()}</li> 
</ul>


</body>
</html>