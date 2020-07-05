<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html> 
  <head> 
    <title>Zoo</title> 
  </head> 
  <body> 
    <h1><b>Wilkommen in Zoo</b></h1> 
    <h2>Welches Gehege möchten Sie besuchen?</h2>
    <h3>Schauen Sie auf unsere Karte</h3>
    <form method="POST" action="<c:url value='/hallo'/>">
    <c:choose>
      <c:when test="${a}">
          <p>Sie haben noch keine Gehege ausgewaelt!</p>
        </c:when>
        <c:otherwise>
         ${a}
        </c:otherwise>
      </c:choose>
    </form>
  </body> 
</html> 