<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Message send</title>
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
                        <li class="active"><a href="Message.jsp">Message</a></li>
                        <li><a href="Signup.jsp">Log out</a></li>
                    </ul>
                </div> 
            </nav>
        </div>
        <br>
         <div class="container" align="center">
            <h2> Contact US</h2>
         </div>
        <br><br><br>
        <div class="container" align="center">
          
            <form action="SendMail" method="post">
                  <div class="form-group">
<!--                    <input type="text" class="form-control"  placeholder="user"  name="username"required="required">-->
                                    <center>
                                            <select class="form-control" name="username" style="width: 250px;">
                                                <option value=" ">Select username</option>
                                               
                                                
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
             
                <div align="center">
                <button type="submit" class="btn btn-default">Send</button>
                </div>
            </form>
        </div>

    </body>
</html>

