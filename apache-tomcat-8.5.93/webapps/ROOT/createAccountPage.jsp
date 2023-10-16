<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Create Employee Account</title>
  </head>
  <body>
    <h1>Create Employee Account</h1>
    <form method = "post">
    <table style="width: 50%">
        <tr>
            <td>EmployeeID </td>
            <td><input type = "text" name = "employeeId" required/></td>
        </tr>

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
    <%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String id = request.getParameter("employeeId");
        int nId = Integer.parseInt(id);
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
                <p>Your account is created</p>
    <% 
            String user;
            user = "root";
            String password = "Ken30526296@";
            PreparedStatement preparedStatement = null;
            try {
        
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false",user, password);

            String sql = "INSERT INTO Employee (ID, HotelLocation, HotelName, Name, Role, Username, Password) VALUES (?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, nId);
            preparedStatement.setString(2, hotelLocation);
            preparedStatement.setString(3, hotelName);
            preparedStatement.setString(4, name);
            preparedStatement.setString(5, role);
            preparedStatement.setString(6, userName);    
            preparedStatement.setString(7, userPassword);

            preparedStatement.executeUpdate();
        
            out.println("Initial entries in table \"Employee\": <br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Employee");
            while (rs.next()) {
                out.println(rs.getInt(1) + "    " + rs.getString(2) + "    " + rs.getString(3) + "    " + rs.getString(4) + "    " + 
                rs.getString(5) + "    " + rs.getString(6) + "    " + rs.getString(7) +
                "<br/><br/>");
            }
            rs.close();
            stmt.close();
            con.close();
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

