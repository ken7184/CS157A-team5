<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Check room assigned page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="navbar.css"/>
    <style>
        .title-section{
          padding: 24px 48px 0px 48px;
        }

        .title{
          font-size: 24px;
          font-weight: 400;
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
    <div class="title-section">
      <h2 class="title">Check Assigned Room</h2>
      <hr class="solid" style="border-top: 1px solid; opacity: 0.2;">
    </div>

    <div style="width: 50%; margin: 16px 48px; height: 24px;">
      <form method="post" action="">
        <input type="text" name="roomNumberInput" placeholder="Enter Room Number" style="width: 45%; height: 100%;">
        <input type="submit" name="roomNumber" value="Search" style="width: 10%; height: 100%;">
      </form>
    </div>

    <%
    String buttonClicked = request.getParameter("roomNumber");
    String roomNumberInput = request.getParameter("roomNumberInput");

    String user = "root";
    String pass = "Ken30526296@";

    String query = "SELECT * FROM Project.Shift s JOIN Project.Employee e on e.id = s.EmployeeID WHERE AssignedRoom IS NOT NULL AND AssignedRoom <> ''";

    if ("Search".equalsIgnoreCase(buttonClicked) && roomNumberInput != null && !roomNumberInput.isEmpty()) {
        query = "SELECT * FROM Project.Shift s JOIN Project.Employee e on e.id = s.EmployeeID WHERE AssignedRoom = ?";
    }

    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, pass);
        PreparedStatement ps = con.prepareStatement(query);
        
        if ("Search".equalsIgnoreCase(buttonClicked)) {
            ps.setString(1, roomNumberInput);
        }

        ResultSet rs = ps.executeQuery();

        if (!rs.isBeforeFirst()) { // Check if ResultSet is empty
          out.println("<h2 class='error-message'>No data found for room number: " + roomNumberInput + "</h2>");
        } else {
    %>
    <table class="table is-bordered is-striped is-narrow is-hoverable" style="width: 95%; margin: 0px 48px;">
      <thead>
          <th>Employee Id</th>
          <th>Employee Name</th>
          <th>Hotel Location</th>
          <th>Hotel Name</th>
          <th>Date</th>
          <th>Start Time</th>
          <th>End Time</th>
          <th>Task</th>
          <th>Assigned Room</th>
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
      }
        rs.close();
        ps.close();
        con.close();
    } catch (SQLException | ClassNotFoundException e) {
        out.println("Exception caught: " + e.getMessage());
    }
    %>
  </body>
</html>
