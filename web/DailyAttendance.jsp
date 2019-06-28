<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Attendance</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script>
            [type = "date"] {
            background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat) ;
            }
            [type = "date"]:: - webkit - inner - spin - button {
            display: none;
            }
            [type = "date"]:: - webkit - calendar - picker - indicator {
            opacity: 0;
            }

            /* custom styles */
            body {
            padding: 4em;
            background: #e5e5e5;
            font: 13px / 1.4 Geneva, 'Lucida Sans', 'Lucida Grande', 'Lucida Sans Unicode', Verdana, sans - serif;
            }
            label {
            display: block;
            }
            input {
            border: 1px solid #c4c4c4;
            border - radius: 5px;
            background - color: #fff;
            padding: 3px 5px;
            box - shadow: inset 0 3px 6px rgba(0, 0, 0, 0.1);
            width: 190px;
            }
        </script>
        
        <script  type="text/javascript">

    function preventBack() {
        window.history.forward();
    }
    setTimeout("preventBack()", 0);
    window.onload = function () {
        null;
    };

</script>
           <style>
            body  {
                background-image: url("folder/background.tif");
                background-color: #cccccc;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="active">Attendance Management System</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="Adimin.jsp">Home</a></li>
                    <li  class="active"><a href="DailyAttendance.jsp">Daily Attendance</a></li>
                    <li><a href="Monthly.jsp">Monthly Report</a></li>
                    <li><a href="Report.jsp">Create Report</a></li>
                    <li><a href="emailClient.jsp">Message</a></li>
                    <li><a href="Signup.jsp">Log out</a></li>
                </ul>
            </div>
        </nav>

        <div class="container" align="center">
            <h2>Daily Attendance</h2>
            <br><br><br><br>
            <form class="form-inline" action="Attendance" method="post">
                <div class="form-group">
<!--                    <input type="text" class="form-control"  placeholder="user"  name="username"required="required">-->
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
                <br><br><br>
                <div class="form-group">
                    <select class="form-control" id="pwd" placeholder="Enter status" name="status"required="required" >
                        <option value="">Choose status</option>
                        <option value="present">Present</option>
                        <option value="absent">Absent</option>    
                    </select>
                </div>
                <br><br><br>
                <div class="form-group">
                    <input type="date" name="date" id="dateofbirth"  required="required">
                </div>
                <br><br><br>
                <div>
                    <button type="submit" class="btn btn-default" value="save">Submit</button>
                </div>
            </form>
            <br><br>
       
        </div>

    </body>
</html>
