<%-- 
    Document   : Monthly
    Created on : 6 Mar, 2019, 9:16:28 AM
    Author     : AKASH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script  type="text/javascript">

    function preventBack() {
        window.history.forward();
    }
    setTimeout("preventBack()", 0);
    window.onload = function () {
        null;
    };

</script>
        <title>User Page</title>
        <style>
            img
            {
                width: 800px;
                height: 500px;
                border: 2px solid #000;
            }
            body  {
                background-image: url("folder/background.tif");
                background-color: #cccccc;
            }
        </style>
        
        <script  type="text/javascript">

    function preventBack() {
        window.history.forward();
    }
    setTimeout("preventBack()", 0);
    window.onload = function () {
        null;
    };

</script>
    </head>
    <body>
        <div>
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="active">Attendance Management System</a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="Home.jsp">Home</a></li>
                        <li><a href="User.jsp">Attendance list</a></li>
                        <li><a href="Month.jsp">Report </a></li>  
                        <li><a href="Signup.jsp">Log Out</a></li>  
                    </ul>
                </div> 
            </nav>
        </div>
        <br><br><br> 

        <div align="center">
            <!--                        <img src="folder/giphy.gif"/>--> 
            <img src="folder/admin.jpg"/>
        </div>

    </body>
</html>
