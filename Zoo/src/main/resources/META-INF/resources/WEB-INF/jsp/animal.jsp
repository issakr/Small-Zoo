<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" errorPage ="error.jsp"%>
<%@ page errorPage ="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- @author Sakr, Issam & Wagner, David-->


<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tiere</title> 
    </head>
    <body>
        <h4>
            <c:set var="boese" scope="request" value ="" />
            
            <b><c:out value="Sie beobachten ${animal.animalName} und ${animal.animalName} beobachtet"></c:out> 
                <c:choose>
                    <c:when test="${animal.hunger >= 3}">böse</c:when> <!--Wenn Tier Hunger 3+ ist guckt es böse-->
                    <c:when test="${animal.hunger == 0}">fröhlich</c:when> <!--Wenn Tier Hunger =0 ist guckt es fröhlich-->
                </c:choose>                                                 <!--(sonst keine Eigenschaft)-->
                zurück.</b><br/>
        </h4>
        <img src="<c:url value="images/${animal.image}.jpg" />" alt="${animal.animalName}" width="200" height="200"><br/><br/> <!--Bildname vom Tier auslesen und Bild anzeigen-->
        <c:choose>
            <c:when test="${animal.hunger == 0}"> <!--prüfen ob Tier keinen Hunger hat-->
                <c:out value="Das Tier ${animal.animalName} hat kein Hunger." /> <!-- wenn ja entsprechende Ausgabe-->
            </c:when>
            <c:otherwise>
            <h5>
                <b><c:out value="Hunger:${animal.hunger}"/></b><br/> <!--wenn, nein Hunger anzeigen-->
            </h5>
            <form action="feed" method="POST"><!-- Request zuordnen-->
                <input type="submit" value="Füttern" name="fuettern"/><!--Absende-Button-->
            </form>
            </c:otherwise>
        </c:choose>
        <br/><br/>
        <form action="compound" method="POST"><!-- Request zuordnen-->
            <input type="submit" value="zurück zum Gehege" name="zurueckCompundbutton"/><!--Absende-Button-->
        </form>
    </body>
</html>