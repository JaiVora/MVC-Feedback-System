<!--  author: Jai Vora
This page is displayed when the mean is greater than 90 -->
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Winner</title>
</head>
<body style="background-color:#358C94">
	<center>
		<h1>Congratulations you have won, You get two movie tickets!!</h1>
		<br>
		<br>
		<h2><b>Standard Deviation:  ${bean.getstD()} | Mean:  ${bean.getMean()}</b></h2>
	</center>
	<h2>Thank you for filling out the survey form</h2><br>
	<h3>List of registered students</h3>
        <ul>
        <%
            List<String> li= (List<String>)session.getAttribute("studentid"); 
    	    //li.add(name);
            for (String aLi : li) {
        %>
        <li><b><a style="color: black" href="controller?method=doPost()&param=<%=aLi%>"><%= aLi %></a></b></li>
        <%
            }
        %>
        </ul>
</body>
</html>