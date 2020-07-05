<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html> 
  <head> 
    <title>Zoo</title> 
  </head> 
  <body> 
    <h1><b>Wilkommen in Zoo</b></h1> 
    <h2>Welches Gehege möchten Sie besuchen?</h2>
    <h3>Schauen Sie auf unsere Karte</h3>
    <form method="POST" action="<c:url value='/showAllCompounds'/>">
    <c:choose>
      <c:when test="${empty compounds}">
          <p>Sie haben noch keine Gehege ausgewaelt!</p>
        </c:when>
        <c:otherwise>
          <c:forEach items="${compounds}" var="Compound">
            <tr>
              <td>
                ${Compound.getCompoundName()}
              </td>
            </tr>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </form>
  </body> 
</html> 