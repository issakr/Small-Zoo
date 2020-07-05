<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html> 
  <head> 
    <title>Zoo</title> 
  </head> 
  <body> 
    <h1><b>Wilkommen in Zoo</b></h1> 
    <h2>Welches Gehege möchten Sie besuchen?</h2>
    <h3>Schauen Sie auf unsere Karte</h3>
    <form method="POST" action="check-compound">
      <c:forEach	items="${compounds}" var="compound">
        <input type="radio" name="compoundName" value="${compound.compoundName}"/>
          ${compound.compoundName}
      </c:forEach>
      <br/>
      <input type="submit" value="Gehe zum Gehege" name="buttonGehege"/>
	    	<c:if test="${not empty chooseCompound}">
			    <p><span style="color: rgb(255, 0, 0);">
	        	Sie haben kein Gehege ausgewählt!</span></p> 
		    </c:if>
      
    </form>

    


  </body> 
</html> 