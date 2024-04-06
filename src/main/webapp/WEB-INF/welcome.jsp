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

    <p>
        Avec une variable et EL (?): 
        <c:out value="${unknownVariable}" default="EMPTY"/>
    </p>

    <p>
        Default inside tag:
        <c:out value="${unknownVariable}">EMPTY</c:out>
    </p>

    <c:set var="dummyVar" value="Winter's coming!" scope="page" />
    <p><c:out value="${dummyVar}"/></p>

    <!-- Pour modifier "un bean" on utilise: -->
    <%-- <c:set target="${author}" property="name" value="Dahl" />
    <=> author.name = "Dahl" --%>

    <c:remove var="dummyVar" scope="page" />
</body>
</html>