<%@ page isErrorPage="true" import="java.io.*" %>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Error</title>
</head>
<body>
 
    <img src="images/error.jpg" alt="Error.image" width="1200" height="400">
<h2>Es gibt einen Fehler</h2>
 
Message:
<%=exception.getMessage()%>
 
 
<h3>StackTrace:</h3>
<%
  StringWriter stringWriter = new StringWriter();
  PrintWriter printWriter = new PrintWriter(stringWriter);
  exception.printStackTrace(printWriter);
  out.println("<pre>");
  out.println(stringWriter);
  out.println("</pre>");
  printWriter.close();
  stringWriter.close();
%>
 
</body>
</html>