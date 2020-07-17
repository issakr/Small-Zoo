<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage ="error.jsp"%>
    <%@ page errorPage ="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- @author Sakr, Issam & Wagner, David-->

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
    <form method="POST" action="check-animal"> <!--Request zuordnen-->
      <c:forEach	items="${animals}" var="animal"> <!--Tierliste des Geheges durchlaufen-->
        <c:if test="${animal.isHidden() == false}"> <!--Prüfen ob es sich nicht versteckt-->
          <input type="radio" name="animalName" value="${animal.animalName}"/> <!--Dann Single Choice Button ausgeben und Tiernamenzuordnen-->
          <c:out value="${animal.animalName}	"/><!--entsprechenden Tiernamen ausgeben-->
        </c:if>
      </c:forEach>

      <input type="submit" value="Gehe zum Tier" name="buttonTier"/> <!--Absende Button-->
       
        <c:if test="${not empty chooseAnimal}"> <!--Prüfe ob Gehege ausgewählt ist-->
			    <p><span style="color: rgb(255, 0, 0);"> <!--Textfarbe ändern-->
	        	Sie haben kein Tier ausgewählt!</span></p> <!--Fehlermeldung-->
		    </c:if>
       
          <h3>Diese Tiere verstecken sich:</h3>
          <ul>
            <c:forEach	items="${animals}" var="animal"> <!--Tierliste des Geheges durchlaufen-->
              <c:if test="${animal.isHidden() == true}"> <!--Prüfen ob es sich  versteckt-->
                <li><c:out value="${animal.animalName}"/></li><br/> <!-- mit Listenpunkt ausgeben-->
		  	     </c:if>
           </c:forEach>
          </ul>
    </form>
    
    <form action="/" method="POST"> <!--Request zuordnen-->
      <input type="submit" value="zurück zur Karte" name="zurueckbutton"/> <!--Absende Button-->
    </form>
  </body>
</html>