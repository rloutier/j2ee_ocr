<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Login page</title>
</head>
<body>
    <%@ include file="links.html" %>

    <!-- Forms in JSTL -->
    <c:if test="${!empty form.fileName}">
        <p>
            <c:out value='File "${form.fileName}" (${form.fileDescription}) has been uploaded !'/>
        </p>
        <br>
    </c:if>

    <!-- Basic HTML form -->
    <form method="post" action="upload" enctype="multipart/form-data">
        <p>
            <label for="file-description">File description: </label>
            <input type="text" name="file-description" id="file-description" />
        </p>
        <p>
            <label for="file-upload">File to upload (àéïôù): </label>
            <input type="file" name="file-upload" id="file-upload" />
        </p>
        
        <input type="submit" />
    </form>
</body>
</html>