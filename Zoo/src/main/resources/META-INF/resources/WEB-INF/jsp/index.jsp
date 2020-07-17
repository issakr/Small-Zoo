<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage ="error.jsp"%>
    <%@ page errorPage ="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- @author Sakr, Issam & Wagner, David-->

<html> 
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Zoo</title> 
  </head> 
  <body> 
    <h1><b>Wilkommen in Zoo</b></h1> 
    <h2>Welches Gehege möchten Sie besuchen?</h2>
    <h3>Schauen Sie auf unsere Karte</h3>

    <form method="POST" action="check-compound">
      <c:forEach	items="${compounds}" var="compound">
        <input type="radio" name="compoundName" value="${compound.compoundName}"/>
        <c:out value="${compound.compoundName}" />
      </c:forEach>
      <br/><br/>
      <input type="submit" value="Gehe zum Gehege" name="buttonGehege"/>
       <c:choose>  
          <c:when test="${not empty chooseCompound}">
			      <p><span style="color: rgb(255, 0, 0);">
	          Sie haben kein Gehege ausgewählt!</span></p> 
		      </c:when>
       </c:choose>
    </form>
  </body> 
</html> 