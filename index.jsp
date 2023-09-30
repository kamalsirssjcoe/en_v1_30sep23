<%@  page   import="java.util.*"  %>
<%@  page   import="javax.mail.*"  %>
<%@  page   import="javax.mail.internet.*"  %>

<html>
<head>
<title> Kamal Classes </title>
<style>
	* { font-size:40px; }
	textarea {resize:none}
</style>
</head>
<body>
<center>
<h1> Fill the Form </h1>
<form method="POST">
<input type="text" name="name" placeholder="enter name " required/>
<br><br>
<input type="number" name="phone" placeholder="enter phone" required/>
<br><br>
<textarea name="query" placeholder="enter query" rows=4 cols=30 required></textarea>
<br><br>
<input type="Submit" name="btn" />
<br><br>
</form>

	<%
	if (request.getParameter("btn") != null)
	{
		String name = request.getParameter("name");
		long phone = Long.parseLong(request.getParameter("phone"));
		String query = request.getParameter("query");
	
		// mail kahan se jayega
		Properties p = System.getProperties();
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", 587);
		p.put("mail.smtp.auth", true);
		p.put("mail.smtp.starttls.enable", true);

		// appka un and pw ka authentication
		Session ms = Session.getInstance(p, new Authenticator(){
		public PasswordAuthentication getPasswordAuthentication() {
				String un = "kctesterjune@gmail.com";
				String pw = "kplrgiitapamjxmd";
				return new PasswordAuthentication(un, pw);
		}
		});

		try {
		// mail ko draft karke bhejo
		MimeMessage msg = new MimeMessage(ms);
		String subject = "enquiry from " + name;
		msg.setSubject(subject);
		String txt = "name  = " + name + " phone = " + phone + "query = " + query;
		msg.setText(txt);
		msg.setFrom(new InternetAddress("kctesterjune@gmail.com"));
		msg.addRecipient(Message.RecipientType.TO , new InternetAddress("classeskamalsir@gmail.com") );
		Transport.send(msg);
		}
		catch(Exception e ) {
			out.println("issue -->" + e);
		}
	}
	%>	
</center>
</body>
</html>





