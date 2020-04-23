<!-- Author: Jai Vora
     index.jsp file is the survey form page where user fills in the information
 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
    <head>
        <title>CS Department Survey</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <style>
            .gmu
            {
               color: #006633;
               background-color: #FFCC33; 
            }
        </style>
        <script type="text/javascript">
        if(document.cookie){
                var myCookie = unescape(document.cookie);
                var cookieTokens = myCookie.split("=");
                name = cookieTokens[1];
            }
            else{
                name = window.prompt("Please enter your name");
                document.cookie = "name=" + escape(name);
                
            }
            var today = new Date();
            var time = today.getHours();
            if(time < 12){
                document.writeln("<h2>Good Morning "+name + ", welcome to SWE642 Assignment</h2>");
            }
            if(time > 12 && time < 17){
                document.writeln("<h2>Good Afternoon "+name + ", welcome to SWE642 Assignment</h2>");
            }
            if(time >= 17){
                document.writeln("<h2>Good Evening "+name  + ", welcome to SWE642 Assignment</h2>" );
            }
            document.writeln( "<a href = 'javascript:wrongPerson()'> " + "Click here if you are not " + name + "</a>" );
            function wrongPerson(){
                document.cookie =  "name=null;" +" expires=Thu, 01-Jan-95 00:00:01 GMT";
                location.reload();

            }
        function validateForm() {
            var x = document.forms["usrname"]["data"].value;
            var jpt = x.split(',');
            if(jpt.length < 10)
            {
                	alert("Enter atleast 10 values separated by a comma");
                	return false;
            }
            console.log("Coming here");
            var temp = new Array();
            temp = x.split(",");
            for (a in temp ){
                temp[a] = parseInt(temp[a], 10); // Explicitly include base as per Álvaro's comment
            }
                for(b in temp){
                if(temp[b] > 100 || temp[b] < 1){
                    alert("Values should be between 1 and 100");
                    return false;
                    }
                }
            }
            
            
            function validate(){
                var x = document.forms["usrname"]["username"].value;
                var RegExpression = /^[a-zA-Z\s]*$/;  
                var result = x.match(RegExpression);
                if(result == null){
                    document.forms["usrname"]["username"].value = "";
                    alert("Only Alphabets in the Username Field");
                    document.forms["usrname"]["username"].focus();
                    return false;
                }
                var exp = /^[a-z0-9\s]+$/i;
                var address = document.forms["usrname"]["address"].value;
                var result2 = address.match(exp);
                if(result2 == null){
                    document.forms["usrname"]["address"].value = "";
                    alert("Address cannot have special characters");
                    document.forms["usrname"]["address"].focus();
                    return false;
                }
                var checkboxs=document.getElementsByName("cs");
                var count = 0;
                for(var i=0,l=checkboxs.length;i<l;i++)
                {
                if(checkboxs[i].checked)
                    {
                    count++;
                    }
                }
                if(count < 2){
                    alert("Please check atleast 2 boxes");
                    return false;
                }
                var emailText = document.forms["usrname"]["email"].value;
                var patternn = /^[a-zA-Z0-9\-_]+(\.[a-zA-Z0-9\-_]+)*@[a-z0-9]+(\-[a-z0-9]+)*(\.[a-z0-9]+(\-[a-z0-9]+)*)*\.[a-z]{2,4}$/;
                if (!patternn.test(emailText)) {
                    document.forms["usrname"]["email"].value = "";
                    alert('Bad email address: ' + emailText);
                    document.forms["usrname"]["email"].focus();
                    return false;
                }
                var interested = document.getElementsByName("interest");
                var ischecked_method = false;
                for ( var i = 0; i < interested.length; i++) {
                if(interested[i].checked) {
                    ischecked_method = true;
                    break;
                    }
                }
                if(!ischecked_method){ 
                    alert("Please select one of the radio buttons");
                    return false;
                }
        }     
        </script>
    </head>
    <!-- This page is a Survey form asking people a few questions about the University -->
    <body style="background-color: lightgray">
        <center>
            <h1 style="border: 5px solid #006633; box-shadow: 5px 5px #888888;" class="gmu">CS Department Survey</h1>
            <div class="w3-row">
                <div class="w3-col s6 w3-Blue-Gray"> 
                    <h5>Please provide your valuable feedback!</h5>
                </div>
                <div class="w3-col s6 w3-dark-grey w3-center">
                    <h5>Thank you for your time!</h5>
                </div>
            </div>
        </center>
        <p style="color: red" class="w3-container">Fields marked <span style="color: red">(*)</span> are Required Fields </p>
        <form name="usrname" autocomplete="on" class="w3-container" onsubmit = "return validate()" action="controller" method ="POST" >
            <label>User Name: <span style="color: red">*</span></label><br>
            <input type="text" name="username" autocomplete="on" required  autofocus>
            <br><br>
            <label>Street Address: </label><br>
            <input type="text" name="address">
            <br><br>
            <label>Zip Code: <span style="color: red">*</span><br>
            <input type="text" name="zip" onblur="jai()" required>
            <br><br>
            <label>City:</label><br>
            <input type="text" name="city">
            <br><br>
            <label>State:</label><br>
            <input type="text" name="state">
            <br><br>
            <label>Telephone Number: </label><br>
            <input type="tel" name="phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}">
            <span>(Format: 123-456-7890)</span>
            <br><br>
            <label>Email: <span style="color: red">*</span></label><br>
            <input type="text" name="email" placeholder="someone@example.com">
            <br><br>
            <label>URL: </label><br>
            <input type="url" name="link" placeholder="https://www.example.com">
            <br><br>
            <label>Date of Survey: </label><br>
            <input type="date" name="date" >
            <br><br>
            <label>What did you like the most on the campus: <span style="color: red">(Please select atleast two checkboxes)</span> </label><br>
            <label><input type="checkbox" name="cs" value="Students">Students</label>   
            <label><input type="checkbox" name="cs" value="Location">Location</label>
            <label><input type="checkbox" name="cs" value="Campus">Campus</label>
            <label><input type="checkbox" name="cs" value="Atmosphere">Atmoshphere</label>
            <label><input type="checkbox" name="cs" value="Dorm">Dorm Rooms</label>
            <label><input type="checkbox" name="cs" value="Sport">Sports</label>
            <br>
            <br>
            <label>How did you become interested in this University:<span style="color: red">*</span> </label><br>
            <label><input type="radio" name="interest" value="friends">Friends</label><br>
            <label><input type="radio" name="interest" value="tv">Television</label><br>
            <label><input type="radio" name="interest" value="internet">Internet</label><br> 
            <label><input type="radio" name="interest" value="other">Other</label><br> 
            <br>
            <br>
            <label for="comments">Additional Comments: </label><br>
            <textarea id="comment" name="comment" rows="5" cols="40" placeholder="Write something.."></textarea>
            <br>
            <br>
            <label>High School Graduation Month: </label>
            <input list="month" name="mo">
            <datalist id="month">
                <option value="January">
                <option value="February">
                <option value="March">
                <option value="April">
                <option value="May">
                <option value="June">
                <option value="July">
                <option value="August">
                <option value="September">
                <option value="October">
                <option value="November">
                <option value="December">    
            </datalist> 
            <label>Year: </label>
            <input type="number" name="year" placeholder="YYYY" >
            <br>
            <br>
            <label>What is the likelihood of you recommending this School to other prospective students: </label><br>
            <select name="like">
                  <option value="Very Likely">Very Likely</option>
                  <option value="Likely">Likely</option>
                  <option value="Unlikely">Unlikely</option>
            </select>
            <br>
            <br>
            <label>Data: <span style="color: red">*</span></label><br>
            <input type="text" name ="data"  id="data" onblur="return validateForm()" required><br>
            <label>Student ID: <span style="color: red">* (Please enter a unique ID)</span></label><br>
            <input type = "text" name = "sid" required><br><br>
            <input type="submit" value="Submit">
            <input type="reset" value="Reset" >
        </form>
        <a href="https://www2.gmu.edu/"><img style="position:fixed; right:0px; bottom: 0px;" src="gmu.jpg"></a>
    </body>
</html> 