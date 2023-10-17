<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Home Page</title>
  </head>
  <body>
    <h1>Home Page</h1>

    <form method="post" >
      <input type="hidden" id="employeeIDField" name="employeeIDon" value="">
      <input type="submit" value="See Task" />
    </form>
  
  <script>
      var employeeIDon = localStorage.getItem("employeeID");
      var usernameOn = localStorage.getItem("username");
      var passwordOn = localStorage.getItem("password");
      console.log("employeeIDon: " + employeeIDon);
      console.log("usernameOn: " + usernameOn);
      console.log("passwordOn: " + passwordOn);

      document.getElementById("employeeIDField").value = employeeIDon;
  </script>
  

<table border="1">
  <thead>
    <tr>
      <td>Employee ID</td>
      <td>Hotel Location</td>
      <td>Hotel Name</td>
      <td>Date</td>
      <td>Start Time</td>
      <td>End Time</td>
      <td>Task</td>
    </tr>
  </thead>
  <tbody>

    <%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
      String employeeIDStr = request.getParameter("employeeIDon");
      String user = "root";
      String pass = "Ken30526296@";
      try {
        int employeeID2 = Integer.parseInt(employeeIDStr);
        out.println("Employee ID: " + employeeID2 );
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false",user, pass);
        String query = "SELECT * FROM Shift WHERE EmployeeID = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, employeeID2);
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
        %>
        <tr>
        <td><%= rs.getInt(2) %></td>
        <td><%= rs.getString(3) %></td>
        <td><%= rs.getString(4) %></td>
        <td><%= rs.getString(5) %></td>
        <td><%= rs.getString(6) %></td>
        <td><%= rs.getString(7) %></td>
        <td><%= rs.getString(8) %></td>
        </tr>
        <%
        }
        rs.close();
        ps.close();
        con.close();
        } catch (NumberFormatException e) {
        out.println("Invalid employee ID format");
        }
        catch(SQLException e) {
        out.println("SQLException caught: " + e.getMessage());
        }
        
    } 
  %>
</tbody>
</table>
</body>
</html>