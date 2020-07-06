<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage ="error.jsp"%>
    <%@ page errorPage ="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html> 
  <head> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gehege</title> 
  </head>
  <body>   
    <h1>
      <b>
        <c:out value="Sie sind hier: ${compound.compoundName}" />
      </b>
    </h1> 
    <h3>Sie sehen diese Tiere:</h3>
    <br/>
    <form method="POST" action="check-animal">
      <c:forEach	items="${animals}" var="animal">
        <c:if test="${animal.isHidden() == false}">
          <input type="radio" name="animalName" value="${animal.animalName}"/>
          <c:out value="${animal.animalName}	"/>
        </c:if>
      </c:forEach>

      <input type="submit" value="Gehe zum Tier" name="buttonTier"/>
      <c:choose>  
        <c:when test="${not empty chooseAnimal}">
			    <p><span style="color: rgb(255, 0, 0);">
	        	Sie haben kein Tier ausgewählt!</span></p> 
		    </c:when>
       </c:choose>
          <h3>Diese Tiere verstecken sich:</h3>
          <ul>
            <c:forEach	items="${animals}" var="animal">
              <c:if test="${animal.isHidden() == true}">
                <li><c:out value="${animal.animalName}"/></li><br/>
		  	     </c:if>
           </c:forEach>
          </ul>
    </form>
    <form action="/" method="POST">
      <input type="submit" value="zurück zur Karte" name="zurueckbutton"/>
    </form>
  </body>
</html>