<%-- 
    Document   : Monthly
    Created on : 15 Mar, 2019, 7:06:15 PM
    Author     : AKASH
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <style>
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
        <title>Monthly Report</title>
    </head>
    <body>
        <div>
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="active">Attendance Management System</a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li><a href="Adimin.jsp">Home</a></li>
                        <li><a href="DailyAttendance.jsp">Daily Attendance</a></li>
                        <li><a href="Monthly.jsp">Monthly Report</a></li>
                        <li class="active"><a href="Report.jsp">Create Report</a></li>
                        <li><a href="emailClient.jsp">Message</a></li>
                        <li><a href="Signup.jsp">Log out</a></li>
                    </ul>
                </div>
            </nav>
        </div>
        <br>
        <div class="container" align="center">
            <h2>Create Report</h2>
        </div>
        <br><br><br>
        <form action="report" method="post">
            <div class="container" align="center">
                <div class="form-group">
                    Starting date: <input type="date" name="start" id="dateofbirth">
                </div>
                <br>
                <div class="form-group">
                    Ending date:<input type="date" name="end" id="dateofbirth">
                </div>
                <br>
                <div class="form-group">
                    <center>
                        <select class="form-control" name="username" style="width: 250px;">
                            <option value=" ">Select Username</option> 
                            <%
                                try {
                                    String query = "select *from registration";
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fantastic", "root", "root");
                                    Statement stm = conn.createStatement();
                                    ResultSet rs = stm.executeQuery(query);
                                    while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("username")%>"><%=rs.getString("username")%></option>
                            <%
                                    }
                                } catch (Exception e) {

                                }
                            %>  
                        </select>
                    </center>
                </div>
                <br><br>
                <div>
                    <button type="submit" class="btn btn-default" value="save">Submit</button>
                </div>
            </div>    
        </form>
    </body>
</html>
