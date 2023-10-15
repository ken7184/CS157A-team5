<%@ page import="java.sql.*" %>
<html>
<head>
    <title>MyHotels</title>
</head>
<body>
  <form method="post">
    <h1>MyHotels Management System</h1>
    <font size="5" color="black">
        <input type = "radio" name = "id" value = "CreateAccount"> Create Account<BR>
        <input type = "radio" name = "id" value = "Login"> Log in<BR>
    </font>
    <br>
    <input type="submit" value="Confirm">
  </form>
    <%
      String selectedOption = request.getParameter("id");
      if (selectedOption != null) {
        if (selectedOption.equals("CreateAccount")) {
            response.sendRedirect("createAccountPage.jsp"); 
        } else if (selectedOption.equals("Login")) {
            response.sendRedirect("loginPage.jsp"); 
        } else {
            out.println("Invalid option selected."); // Handle invalid selections
        }
      }
    %>
</body>
</html>
