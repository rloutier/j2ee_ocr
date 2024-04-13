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

</body>
</html>