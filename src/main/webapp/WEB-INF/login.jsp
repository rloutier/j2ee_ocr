<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Login page</title>
</head>
<body>
    <%@ include file="links.html" %>

    <!-- Forms in JSTL -->

    <c:if test="${!empty form.getConnectionMessage()}">
        <p>
            <c:out value="${form.getConnectionMessage()}"/>
        </p>
        <br>
        <br>
    </c:if>

    <!-- Basic HTML form -->
    <form method="post" action="login">
        <p>
            <label for="login">Login: </label>
            <input type="text" id="login" name="login">
        </p>
        <p>
            <label for="password">Password: </label>
            <input type="password" id="password" name="password">
        </p>
        <input type="submit">
    </form>

</body>
</html>