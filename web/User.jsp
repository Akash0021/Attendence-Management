<%-- 
    Document   : User
    Created on : 22 Mar, 2019, 8:25:02 PM
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
    <a href="emailClient.jsp"></a>
        <title>Attendance</title>
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
                    <li class="active"><a href="User.jsp">Attendance list</a></li>
                     <li><a href="Month.jsp">Report </a></li>  
                    <li><a href="Signup.jsp">Log Out</a></li>  
                </ul>
           </div> 
        </nav>
        </div>
        <br>
         <div class="container" align="center">
            <h2> Attendance List</h2>
         </div>
        <br><br><br>
        <div align="center">
        <table class="table table-bordered table-striped" style="width: 70%">
            <tr>
                <th style="width: 15%">Username</th>
                <th style="width: 15%">Present</th>
                <th style="width: 15%">Absent</th>
                <th style="width: 15%">Overall</th>
                <th style="width: 15%">Percentage</th>
            </tr>
                 <%

                            int i = 0, m = 0, n = 0;
                            float a[];
                            a = new float[100];
                            float temp = 0;

                            try {
                                String query = "select *from report";
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fantastic", "root", "root");
                                Statement stm = conn.createStatement();
                                ResultSet rs = stm.executeQuery(query);

                                while (rs.next()) {
                                    m++;
                                    a[i] = rs.getFloat("percent");
                                    i++;
                                }
                                
                                for (i = 0; i < m; i++) {
                                    for (int j = 1; j < m - i; j++) {
                                        if (a[j - 1] > a[j]) {
                                            temp = a[j - 1];
                                            a[j - 1] = a[j];
                                            a[j] = temp;
                                        }
                                    }
                                }
                            } catch (Exception e) {
                            }

                        %>
            
            
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fantastic", "root", "root");
                    String query = "select *from report  order by percent desc";
                    Statement stm = conn.createStatement();
                    ResultSet rs = stm.executeQuery(query);
                    
                      while (rs.next()) {
                    %>
                     <tr>
                        <td><%=rs.getString("username")%></td>
                        <td><%=rs.getFloat("present")%></td>
                        <td><%=rs.getFloat("absent")%></td>
                         <td><%=rs.getFloat("overall")%></td>
                         <td><%=rs.getFloat("percent")%></td>
                    </tr>
                    <%
                    
                        }
                        
                } catch (Exception e) {
                             e.printStackTrace();
                }
            %>
                </table>
        </div>
    </body>
</html>
