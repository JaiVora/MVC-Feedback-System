<!-- Author: Jai Vora
 This jsp page is directed to, when the mean value is less than 90  -->
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Acknowledgement</title>
</head>
<body style="background-color:#358C94">
	<center>
		<h1>Thank you for filling out the survey form, database is updated.</h1>
		<h2><b>Standard Deviation: ${bean.getstD()} | Mean: ${bean.getMean()}</b></h2>
	</center>
	<h3>List of registered students</h3>
        <ul>
        <%
            List<String> li= (List<String>)session.getAttribute("studentid"); 
    	    //li.add(name);
            for (String aLi : li) {
        %>
        <li><b><a style="color:black" href="controller?method=doPost()&param=<%=aLi%>"><%= aLi %></a></b></li>
        <%
            }
        %>
        </ul>
</body>
</html>