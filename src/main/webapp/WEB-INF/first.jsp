<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>First JSP</title>
</head>
<body>
    <%@ include file="links.html" %>
    <p>On first.jsp, we feel good ! Agreed, ${empty name ? "dear visitor" : name} ?! :-)</p>
    <p>Let's display a String array item: ${names[1]}</p>
    <p>
        <% 
            String customMessage = (String) request.getAttribute("customMessage");
            out.println(customMessage);
        %>
        <%= request.getAttribute("customMessage") %>
    </p>
    <p>
       <% 
            final int NB_LINES = 13;
            for (int i=0; i<NB_LINES; i++) {
                for (int j=0; j<=i; j++) {
                    out.print("*");
                }
                out.print("<br>");
            }
        %>
    </p>
</body>
</html>