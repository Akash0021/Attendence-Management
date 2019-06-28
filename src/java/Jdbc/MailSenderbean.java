/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Jdbc;

//import java.util.Properties;
//import javax.ejb.Stateless;
//import javax.mail.Message;
//import javax.mail.Session;
//import javax.mail.Transport;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

//@Stateless
public class MailSenderbean {

    public void sendEmail(String fromEmail, String username, String password, String toEmail, String subject, String message_from_user) {

        try {

//        Properties props = System.getProperties();
//        props.put("mail.smtp.host", "smtp.gmail.com");
//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.port", "587");
//        props.put("mail.smtp.pocketFactory.class", "javax.net.ssl.SSLSocketFactory");
//        props.put("mail.smtp.pocketFactory.port", "465");
//        props.put("mail.smtp.pocketFactory.fallback", "false");
//        
//        
//        Session mailSession = Session.getDefaultInstance(props,null);
//        mailSession.setDebug(true);
//        
//        Message mailMessage = new MimeMessage(mailSession);
//        mailMessage.setFrom(new InternetAddress(fromEmail));
//        mailMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
//        mailMessage.setContent(message, "text/html");
//        mailMessage.setSubject(subject);
//        
//        Transport transport = mailSession.getTransport("smtp");
//        transport.connect("smtp.gmail.com", username, password);
//        
//        transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
//            final String username = username;
//            final String password = "password";

            Properties prop = new Properties();
            prop.put("mail.smtp.host", "smtp.gmail.com");
            prop.put("mail.smtp.port", "587");
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.starttls.enable", "true"); //TLS

            Session session = Session.getInstance(prop,
                    new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

            try {

                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(fromEmail));
                message.setRecipients(
                        Message.RecipientType.TO,
                        InternetAddress.parse("to_username_a@gmail.com, to_username_b@yahoo.com")
                );
                message.setSubject(subject);
                message.setText(message_from_user);

                Transport.send(message);

                System.out.println("Done");

            } catch (MessagingException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
