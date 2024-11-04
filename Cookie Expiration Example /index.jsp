 <%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.io.IOException" %>
<%
    Cookie[] cookies = request.getCookies();
    Cookie tempCookie = null;
    boolean cookieExists = false;

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("tempCookie".equals(cookie.getName())) {
                tempCookie = cookie;
                cookieExists = true;
                break;
            }
        }
    }

    if (tempCookie == null) {
        tempCookie = new Cookie("tempCookie", "This is a temporary cookie");
        tempCookie.setMaxAge(60); // Expires in 1 minute
        response.addCookie(tempCookie);
        out.println("A new temporary cookie has been created.");
    } else {
        out.println("The temporary cookie is still present.");
    }
%>
