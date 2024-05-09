<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Welcome</title>
</head>
<body>
    <%@ include file="links.html" %>
    <p>Welcome on my humble website!</p>

    <!-- This is gonna be "escaped" ie HTML/XML tags will NOT be processed... -->
    <p><c:out value="<em>Here's a test for JSTL proper installation!</em>"/></p>

    <!-- This is displayed AS IS, and can be dangerous ! -->
    <%= "<em>Here's a test for JSTL proper installation!</em>" %>

    <c:set var="aMsg" scope="page" value="Winter's coming!"/>
    <p>
        JSTL display with a variable via EL: 
        <c:out value="${aMsg}" default="EMPTY"/>
    </p>

    <c:remove var="aMsg" scope="page" />
    <p>
        Here with a default "inside tag":
        <c:out value="${aMsg}">EMPTY</c:out>
    </p>
    
    <!-- Pour modifier "un bean" on utilise: -->
    <%-- <c:set target="${author}" property="name" value="Dahl" />
    ===> author.name = "Dahl" --%>

    <!-- Test "simple, sans else ni elseif"-->
    <c:if test="${ 50 > 10}"> 50 est grand, plus que 10 [v1]</c:if>

    <!-- Avec qq attributs optionnels : la valeur boolean du test memorisee-->
    <c:if test="${ 50 > 10 }" var="resultat" scope="session"> 50 est grand, plus que 10 [v2]</c:if>
    <p><c:out value="${resultat}">EMPTY</c:out></p>

    <!-- Conditions "multiples" possibles-->
    <c:choose>
        <c:when test="${ 50 < 10 }">Cas AA</c:when>
        <c:when test="${unknown == true}">Cas BB</c:when>
        <c:when test="${resultat}">Cas CC</c:when>
        <c:otherwise>RIEN NE VA PLUS</c:otherwise>
    </c:choose>

    <!-- Loop JSTL -->
    <p>
        <!-- WARN: les bornes sont inclusives...!!! quel foutoir ;-) -->
        <c:forEach var="i" begin="1" end="5" step="1">
            A loop message repeated <c:out value="${i}"/> time(s)
            <br>
        </c:forEach>
    </p>

    <p>
        <!-- Une version "vraie" for each, comme Java pour des Iterables -->
        <c:forEach items="${titles}" var="title" varStatus="status">
            Title num <c:out value="${status.count}"/> is : <c:out value="${title}"/>; I love it ! 
            <br>
        </c:forEach>
    </p>

    <p>
        <!-- Une version parsing de String, avec delimiteurs integres et tout! -->
        <c:forTokens var="token" items="This is A @ long:string@delimited in an:exotic way!!!" delims=" :@">
            <c:out value="${token}"/>
            <br>
        </c:forTokens>
    </p>
</body>
</html>