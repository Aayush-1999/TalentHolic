
package osa.services;

import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
/**
 * This class details about the process for sending mail.
 * 
 * @author
 */
public class SendMail {
  private static Logger log = Logger.getLogger(SendMail.class.getCanonicalName());

  //mail id from which the mail has to be sent
  private static String fromAddress = "talentholicth@gmail.com";
  
  
  public void send(String toAddress, String subject, String msgBody)throws IOException {
	  
	  
	  Properties props = new Properties();
	  Session session = Session.getDefaultInstance(props, null);

	 

	  try {
	      Message msg = new MimeMessage(session);
	      msg.setFrom(new InternetAddress(fromAddress));
	      InternetAddress to = new InternetAddress(toAddress);
	      msg.addRecipient(Message.RecipientType.TO, to);
	      msg.setSubject(subject);
	      msg.setText(msgBody);
	      Transport.send(msg);
	      

	      } catch (AddressException addressException) {
    } catch (MessagingException messageException) {
    }
  }
}




/*Properties props = new Properties();
Session session = Session.getDefaultInstance(props, null);
String htmlBody = "<table border=1><tr><td>100</td> <td>200</td> <td>300</td></tr><tr><td>400</td><td>500</td><td>600</td</tr></table>";

Multipart mp = new MimeMultipart();
MimeBodyPart htmlPart = new MimeBodyPart();

try {
htmlPart.setContent(htmlBody, "text/html");

mp.addBodyPart(htmlPart);


Message msg = new MimeMessage(session);
msg.setFrom(new InternetAddress(fromAddress));
InternetAddress to = new InternetAddress(toAddress);
msg.addRecipient(Message.RecipientType.TO, to);
msg.setSubject(subject);


msg.setContent(mp);



Transport.send(msg, new InternetAddress[] { to });
*/
