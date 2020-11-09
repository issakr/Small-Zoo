<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" errorPage ="error.jsp"%>
<%@ page errorPage ="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tiere</title> 
    </head>
    <body>
        <h4>
            <b><c:out value="Sie beobachten ${animal.animalName} und ${animal.animalName} beobachtet böse zurück."/></b><br/>
        </h4>
        <img src="<c:url value="images/${animal.image}.jpg" />" alt="${animal.animalName}" width="200" height="200"><br/><br/>
        <c:choose>
            <c:when test="${animal.hunger == 0}">
                <c:out value="Das Tier ${animal.animalName} hat kein Hunger." />
            </c:when>
            <c:otherwise>
            <h5>
                <b><c:out value="Hunger:${animal.hunger}"/></b><br/>
            </h5>
            <form action="feed" method="POST">
                <input type="submit" value="Füttern" name="fuettern"/>
            </form>
            </c:otherwise>
        </c:choose>
        <br/><br/>
        <form action="compound" method="POST">
            <input type="submit" value="zurück zum Gehege" name="zurueckCompundbutton"/>
        </form>
    </body>
</html>