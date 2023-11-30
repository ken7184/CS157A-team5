<%@ page import="java.sql.*"%>
<html>
    <head>
      <title>Check Employee's page</title>
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
      </style>
    </head>
    <body>
    
      <%@ include file="navbar.jspf" %>
      <h1 class="header-text">Check Employee's Shift</h1>
      <form method="post" action="">
        <input type="text" name="employeeIDInput" placeholder="Enter Employee ID">
        <input type="submit" name="showByID" value="Show by ID">
      </form>
  
    <%
    String buttonClicked = request.getParameter("showByID");
    String employeeIDInput = request.getParameter("employeeIDInput");

    String user = "root";
    String pass = "Ken30526296@";

    String query = "SELECT EmployeeID, HotelLocation, HotelName, Date, StartTime, EndTime, Task, AssignedRoom FROM Shift";

    if ("Show by ID".equalsIgnoreCase(buttonClicked) && employeeIDInput != null && !employeeIDInput.isEmpty()) {
        query = "SELECT EmployeeID, HotelLocation, HotelName, Date, StartTime, EndTime, Task, AssignedRoom FROM Shift WHERE EmployeeID = ?";
    }

    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, pass);
        PreparedStatement ps = con.prepareStatement(query);
        
        if ("Show by ID".equalsIgnoreCase(buttonClicked)) {
            int employeeID = Integer.parseInt(employeeIDInput);
            ps.setInt(1, employeeID);
        }

        ResultSet rs = ps.executeQuery();
    %>
    <table class = 'table'>
      <thead>
        <tr>
          <td>Employee Id</td>
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
