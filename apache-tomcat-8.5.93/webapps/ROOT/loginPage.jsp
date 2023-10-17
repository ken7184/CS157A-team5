<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Login Page</title>
    <style>
      .heading-text{
        margin: 25px 30px 50px 30px;
      }
      .input-box {
        display: flex;
        width: 50%;
        border: 1px solid #ccc;
        padding: 10px;
        margin: auto;
        flex-direction: column;
       
        max-width: 20%;
        gap: 20px;
      }

      .form{
        display: flex;
        flex-direction: column;
        gap: 20px;
      }

      .createAccount-link{
        color: black;
      }
      .error-message{
        color: red;
        text-align: center;
      }
    </style>
  </head>
  <body>
    <h1 class="heading-text">Welcome to MyHotel!</h1>
    <div class="input-box">
    <form class="form" method="post">
      
        <label for="user_name">Username:</label>
        <input type="text" name="user_name" required/>
        <label for="password">Password:</label>
        <input type="password" name="password" required/>
        <input type="submit" value="Login" />
      
    </form>
     <a class="createAccount-link" href="createAccountPage.jsp">
          <text>Create Account</text>
        </a>
      </div>

    <%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
      String userName = request.getParameter("user_name");
      String userPassword = request.getParameter("password");
      if (userName != null && userPassword != null) {
        String user;
        user = "root";
        String password = "Ken30526296@";
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
              <p class="error-message">Your password is wrong</p>
    <%
            }
          }
          else {
    %>
            <p class="error-message">Your User name is wrong</p>
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