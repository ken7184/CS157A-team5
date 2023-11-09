<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Home Page</title>
  </head>
  <body>
    <h1>Check employee assigned room</h1>

    <form method="post" action="">
      <input type="text" name="roomNumberInput" placeholder="Enter Room Number">
      <input type="submit" name="roomNumber" value="Show by room number">
    </form>
  
    <%
    String buttonClicked = request.getParameter("roomNumber");
    String roomNumberInput = request.getParameter("roomNumberInput");

    String user = "root";
    String pass = "Ken30526296@";

    String query = "SELECT * FROM Project.Shift s JOIN Project.Employee e on e.id = s.EmployeeID WHERE AssignedRoom IS NOT NULL";

    if ("Show by room number".equalsIgnoreCase(buttonClicked) && roomNumberInput != null && !roomNumberInput.isEmpty()) {
        query = "SELECT * FROM Project.Shift s JOIN Project.Employee e on e.id = s.EmployeeID WHERE AssignedRoom = ?";
    }

    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, pass);
        PreparedStatement ps = con.prepareStatement(query);
        
        if ("Show by room number".equalsIgnoreCase(buttonClicked)) {
            ps.setString(1, roomNumberInput);
        }

        ResultSet rs = ps.executeQuery();
    %>
    <table border="1">
      <thead>
        <tr>
          <td>Employee Id</td>
          <td>Employee Name</td>
          <td>Hotel Location</td>
          <td>Hotel Name</td>
          <td>Date</td>
          <td>Start Time</td>
          <td>End Time</td>
          <td>Task</td>
          <td>Assigned Room</td>
        </tr>
      </thead>
      <tbody>
        <% while(rs.next()) { %>
        <tr>
          <td><%= rs.getInt("EmployeeID") %></td>
          <td><%= rs.getString("Name") %></td>
          <td><%= rs.getString("HotelLocation") %></td>
          <td><%= rs.getString("HotelName") %></td>
          <td><%= rs.getString("Date") %></td>
          <td><%= rs.getString("StartTime") %></td>
          <td><%= rs.getString("EndTime") %></td>
          <td><%= rs.getString("Task") %></td>
          <td><%= rs.getString("AssignedRoom") %></td>
        </tr>
        <% } %>
      </tbody>
    </table>
    <%
        rs.close();
        ps.close();
        con.close();
    } catch (SQLException | ClassNotFoundException e) {
        out.println("Exception caught: " + e.getMessage());
    }
    %>
  </body>
</html>
