# MVC-Feedback-System
Model View Controller Architecture Based Survey Form 

A controller.java Servlet file acts as a front controller that receieves all client requests.
When the form is submitted, it is redirected to the controller.

The controller performs two operations once the form has been submitted.
It uses a StudentDAO object to store the Form Data to a database table using JDBC drivers.
A method is invoked on a DataProcessor object to compute the mean and Standard Deviation which is returned as a 
DataBean object. The servlet stores this bean into a session object. 

If the mean value is less than 90, the servlet forwards the request to SimpleAcknowledgement JSP using the 
RequestDispatcher object else the request is forwarded to WinnerAcknowledgement JSP file.

