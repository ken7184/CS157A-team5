<%@ page import="java.sql.*"%>
<html>
    <head>
        <title>Create Employee Account</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="stylesheet" href="navbar.css"/>
        <style>
            .header-text{
                background-color: lightblue;
                font-size: 100px;
                text-align: center;
              }
    
            .hotel-location-text{
                font-size: 24px;
                text-align: start;
                padding-bottom: 16px;
            }
            .table{
                width: 100%;
            }
            .error-message{
                font-size: 16px;
                margin-left: 48px;
                color: red;
          }
        </style>
      </head>
      <body>
        <%@ include file="navbar.jspf" %>
        <h1 class="header-text">Create Employee Account</h1>
  <body>
    <div class="page-wrap">
        <div class="content">
        <form method = "post">
        <table style="width: 50%">

            <tr>
                <td>Name: </td>
                <td><input type = "text" name = "name" required/></td>
            </tr>
        
            <tr>
                <td>UserName: </td>
                <td><input type = "text" name = "user_name" required/></td>
            </tr>
        
            <tr>
                <td>Password: </td>
                <td><input type = "text" name = "password" required/></td>
            </tr>

            <tr>
                <td>Re-Enter Password: </td>
                <td><input type = "text" name = "re_password" required/></td>
            </tr>
        
            <tr><td>Enter your role: </td></tr>
            <tr><td>1. Hotel Manger</td></tr>
            <tr><td>2. Housekeeper</td></tr>
            <tr><td>3. Front Desk</td></tr>
            <tr><td>4. Security</td></tr>
            <tr><td>5. Maintenance & Bellhops</td></tr>
            <tr><td>6. Others</td></tr>
            <tr><td><input type = "text" name = "role" required></td></tr>

            <tr>
                <td>Hotel Location: </td>
                <td><input type = "text" name = "hotel_location" required/></td>
            </tr>

            <tr>
                <td>Hotel Name: </td>
                <td><input type = "text" name = "hotel_name" required/></td>
            </tr>


        </table>
        <input type="submit" value="Submit" />
        </form>
        <form action="loginPage.jsp" method="post">
            <button type="submit" name="submitBtn" value="text1">Go back to login</button><br>
        </form>
        </div>
    </div>
    <%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String name = request.getParameter("name");
        String userName = request.getParameter("user_name");
        String userPassword = request.getParameter("password");
        String rePassword = request.getParameter("re_password");
        String role = request.getParameter("role");
        String hotelLocation = request.getParameter("hotel_location");
        String hotelName = request.getParameter("hotel_name");

        
        if (userPassword != null && rePassword != null && userPassword.equals(rePassword)) {
            int roleN = Integer.parseInt(role);
            if (roleN >= 1 && roleN <= 6) {
    %>
    <% 
            String user;
            user = "root";
            String password = "Ken30526296@";
            try {
                java.sql.Connection con; 
                Class.forName("com.mysql.cj.jdbc.Driver"); 
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, password);
            
                String checkId = "SELECT UserName FROM Employee WHERE UserName = ?";
                PreparedStatement ps = con.prepareStatement(checkId);
                ps.setString(1, userName);
                ResultSet rs2 = ps.executeQuery();    
                if (rs2.next()) {
                    out.println("<h2 class='error-message'>Username already exists: " + userName + "</h2>");
                } else {
                    String checkPs = "SELECT Password FROM Employee WHERE Password = ?";
                    PreparedStatement ps1 = con.prepareStatement(checkPs);
                    ps1.setString(1, userPassword);
                    ResultSet rs1 = ps1.executeQuery();
                    if (rs1.next()) {
                        out.println("<h2 class='error-message'>Password already in use</h2>");
                    } else {
                        String sql = "INSERT INTO Employee (HotelLocation, HotelName, Name, Role, Username, Password) VALUES (?, ?, ?, ?, ?, ?)";
                        PreparedStatement preparedStatement = con.prepareStatement(sql);
                        preparedStatement.setString(1, hotelLocation);
                        preparedStatement.setString(2, hotelName);
                        preparedStatement.setString(3, name);
                        preparedStatement.setString(4, role);
                        preparedStatement.setString(5, userName);    
                        preparedStatement.setString(6, userPassword);
            
                        preparedStatement.executeUpdate();
                        preparedStatement.close();
                        con.close();
                        out.println("<h2 class = 'error-message'>New Account is successfully created.</h2>");
                    } 
                }
            }  
        catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
    <%
            } 
            else {
    %>
                <p>Invalid role number</p>
    <%
            }
        } 
        else {
    %>
            <p>Passwords do not match</p>
    <%
        }
    }
    %>
  </body>
</html>

