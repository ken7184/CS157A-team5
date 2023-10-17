<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Login Page</title>
  </head>
  <body>
    <h1>Login Page</h1>
    <form method = "post">
      <table style="width: 50%">
          <tr>
              <td>UserName:  </td>
              <td><input type = "text" name = "user_name" required/></td>
          </tr>
  
          <tr>
              <td>Password: </td>
              <td><input type = "text" name = "password" required/></td>
          </tr>
      
      </table>
      <input type="submit" value="Login" />
    </form>

    <%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
      String userName = request.getParameter("user_name");
      String userPassword = request.getParameter("password");
      if (userName != null && userPassword != null) {
        String user;
        user = "root";
        String password = "password";
        try {
          java.sql.Connection con; 
          Class.forName("com.mysql.jdbc.Driver");
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false",user, password);
          Statement stmt = con.createStatement();
          String query = "SELECT ID, UserName, Password FROM Employee WHERE UserName = '" + userName + "'";
          ResultSet rs = stmt.executeQuery(query);
          if (rs.next()) {
            String dbPassword = rs.getString("Password");
            int employeeID = rs.getInt("ID");
            if(userPassword.equals(dbPassword)) {
              %> 
              <script>
                localStorage.setItem("username", "<%= userName %>");
                localStorage.setItem("password", "<%= userPassword %>");
                localStorage.setItem("employeeID", "<%= employeeID %>");
                
                window.location.href = "./homePage.jsp";
            </script>
    <%    
          }
            else {
    %>          
              <p>Your password is wrong</p>
    <%
            }
          }
          else {
    %>
            <p>Your User name is wrong</p>
    <%
          } 
      
          rs.close();
          stmt.close();
          con.close();
        } 
        catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
      }
    }
    %>
  </body>
</html>

