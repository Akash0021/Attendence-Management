<%-- 
    Document   : Monthly
    Created on : 15 Mar, 2019, 7:06:15 PM
    Author     : AKASH
--%>

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
                        <li><a href="Home.jsp">Home</a></li>
                        <li><a href="User.jsp">Attendance list</a></li>
                        <li class="active"><a href="Month.jsp">Report </a></li>  
                        <li><a href="Signup.jsp">Log Out</a></li>  
                    </ul>
                </div>
            </nav>
        </div>
        <div class="container" align="center">
            <h2>Monthly Report</h2>
        </div>
        <br>
        <form action=" " method="post">
            <div class="container">
                <div class="form-group">
                    Starting date: <input type="date" name="start" >
                </div>
                <br>
                <div class="form-group">
                    Ending date:<input type="date" name="end">
                </div>
                <br><br><br>

                <div class="form-group">
                    <div class="col-md-5">
                        <div class="input-group">
                            <input type="text" name="search" class="form-control" placeholder="Type username to search" autocomplete="off">
                            <div class="input-group-btn">
                                <button type="submit" value="search" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span>Search</button>
                            </div>
                        </div>
                    </div>
                </div>

                <br><br><br><br>

                <table class="table table-bordered table-striped" style="width: 70%">
                    <tr>
                        <th style="width: 15%">Username</th>
                        <th style="width: 15%">Status</th>
                        <th style="width: 15%">Date</th>
                    </tr>
                    <%
                        int overall = 0;
                        int present = 0;
                        int absent = 0;
                        try {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fantastic", "root", "root");
                            String query = "select *from attendance where username='" + request.getParameter("search") + "' AND date between'" + request.getParameter("start") + "'and'" + request.getParameter("end") + "'";
                            Statement stm = conn.createStatement();
                            ResultSet rs = stm.executeQuery(query);

                            while (rs.next()) {

                                overall++;

                                if (rs.getString("status").equals("present")) {
                                    present++;
                                } else if (rs.getString("status").equals("absent")) {
                                    absent++;
                                }
                    %>
                    <tr>
                        <td><%=rs.getString("username")%></td>
                        <td><%=rs.getString("status")%></td>
                        <td><%=rs.getString("date")%></td>
                    </tr>

                    <%

                            }

                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
                </table>
                <br><br>
            </div>
            <div align="center">
                <%                    out.print("Total Month days     : " + overall);
                %>
                <br>                  
                <%
                    out.print("Total Present day :  " + present);
                %>
                <br>
                <%
                    out.print("Total Absent day :  " + absent);
                %>

            </div>

            <br><br>
            <div align="center">
                <button type="submit" class="btn btn-default">Clear</button>
            </div><br><br>
        </form>

    </body>
</html>
