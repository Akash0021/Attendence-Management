package Jdbc;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import javax.mail.Message.RecipientType;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author AKASH
 */
public class SendMail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SendMail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendMail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.user", "akashjadhav9aa6@gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.debug", "true");
        props.put("mail.smtp.socketFactory.port", 465);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");
        String username=request.getParameter("username");
        String getEmail = null;
        try{
                Class.forName("com.mysql.jdbc.Driver");       
                Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/fantastic","root","root");
                String Query = "select  email from registration where username ='"+username+"'";
                PreparedStatement stm = con.prepareStatement(Query);
                ResultSet rst = stm.executeQuery();      
                if(rst.next())
                {
                        getEmail = rst.getString("email");
                }
                
                String query = "select percent from report where username LIKE '"+username+"'";
                PreparedStatement statmnt = con.prepareStatement(query);
                ResultSet result = statmnt.executeQuery();                    
                 if (result.next())
            {   
                double fetchedAttendance = result.getDouble("percent");               
                Session session = Session.getDefaultInstance(props, null);
                session.setDebug(true);
                MimeMessage message = new MimeMessage(session);
                message.setText("Your Attendance is " + fetchedAttendance);
                message.setSubject("Attendance for your this month");
                message.setFrom(new InternetAddress("akashjadhav9aa6@gmail.com"));
//                message.addRecipient(RecipientType.TO, new InternetAddress(getEmail.getText().trim()));
                message.saveChanges();
                Transport transport = session.getTransport("smtp");
                transport.connect("smtp.gmail.com", "my_gmail_id", "my_gmailpassword");
                transport.sendMessage(message, message.getAllRecipients());
                transport.close();
                      
            }
            
        }
        catch(Exception e)
        {
                e.printStackTrace();  
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
