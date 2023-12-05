<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Login Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Merriweather:wght@400;700&display=swap">
    <style>
      .header-section{
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 24px 24px;
        gap: 16px;
        width: 600px;
        height: 200px;
        margin: 48px auto;
        background-color: darkblue;
      }
      .heading-text{
        align-items: center;
        font-size: 36px;
        color: white;
        font-family: 'Merriweather', serif;
      }
      .input-box {
        display: flex;
        border-radius: 8px;
        width: 600px;
        border: 1px solid black;
        padding: 10px;
        margin: auto;
        flex-direction: column;
        gap: 20px;
        padding: 16px;
      }

      .form{
        display: flex;
        flex-direction: column;
        gap: 20px;
      }

      .createAccount-link{
        text-decoration: underline;
        color: blue;
      }
      .error-message{
        padding-top: 24px;
        color: red;
        text-align: center;
      }
    </style>
  </head>
  <body>
    <div class="header-section">
      <h1 class="heading-text">Welcome to MyHotel</h1>
      <span class="icon">
        <i class="fas fa-hotel" style="font-size: 24px; color: white;"></i>
      </span>
    </div>
    
    <div class="input-box">
    <form class="form" method="post">
        <label for="user_name">Username:</label>
        <input type="text" name="user_name" required style="height: 24px;"/>
        <label for="password">Password:</label>
        <input type="password" name="password" required style="height: 24px;"/>
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
              session.setAttribute("eId", employeeID);
               
      %> 
              <script>
                localStorage.setItem("username", "<%= userName %>");
                localStorage.setItem("password", "<%= userPassword %>");
                localStorage.setItem("employeeID", "<%= employeeID %>");
                window.location.href = "./Menu.jsp";
              </script>
    <%    
          }
            else {
    %>          
              <p class="error-message">Incorrect Password or Username</p>
    <%
            }
          }
          else {
    %>
            <p class="error-message">Incorrect Password or Username</p>
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