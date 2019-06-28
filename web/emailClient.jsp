<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <style>
            body  {
                background-image: url("folder/background.tif");
                background-color: #cccccc;
            }
        </style>
        <script>
            body {
            padding: 4em;
            background: #e5e5e5;
            font: 13px / 1.4 Geneva, 'Lucida Sans', 'Lucida Grande', 'Lucida Sans Unicode', Verdana, sans - serif;
            }
            label {
            display: block;
            }
            input {
            border: 2px solid #c4c4c4;
            border - radius: 4px;
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
        <title>Email client</title>
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
                        <li><a href="Report.jsp">Create Report</a></li>
                        <li class="active"><a href="emailClient.jsp">Message</a></li>
                        <li><a href="Signup.jsp">Log out</a></li>
                    </ul>
                </div> 
            </nav>
        </div>
        <br>
        <div align="center">
            <h2>CONTACT US :</h2>
            <br><br>
            <form action="MailDispatcherservlet" method="post">

                <div class="form-group">
                    <!--                    <input type="text" name="email" size="30" placeholder="To" required="required">-->
                    <center>
                        <select class="form-control" name="email" style="width: 250px;">
                            <option value=" ">Select mail address</option>


                            <%
                                try {
                                    String query = "select * from registration";
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fantastic", "root", "root");
                                    Statement stm = conn.createStatement();
                                    ResultSet rs = stm.executeQuery(query);
                                    while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("email")%>"><%=rs.getString("email")%></option>
                            <%
                                    }
                                } catch (Exception e) {

                                }
                            %>  
                        </select>
                    </center>


                </div>
                <br>


                <div class="form-group">
                    <input type="text" name="subject" size="50" placeholder="Subject" required="required">
                </div>
                <br>

                <div class="form-group">
                    <textarea name="message" cols="50" rows="6" placeholder= "Message" required="required"></textarea>
                </div>
                <br><br><br>

                <div align="center">
                    <button type="submit" class="btn btn-default">Send</button>
                </div>
            </form>
        </div>
    </body>
</html>
