<%@ page import="java.sql.*"%>
<html>
    <head>
      <title>Check Employee's page</title>
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

          .delete-message{
            font-size: 16px;
            margin-left: 48px;
          }
      </style>
    </head>
    <body>
    
      <%@ include file="navbar.jspf" %>
      <div class="title-section">
        <h2 class="title">Check Employee's Shift</h2>
        <hr class="solid" style="border-top: 1px solid; opacity: 0.2;">
      </div>

      <div style="width: 50%; margin: 16px 48px; height: 24px;">
        <form method="post" action="">
          <input type="text" name="employeeIDInput" placeholder="Enter Employee ID" style="width: 45%; height: 100%;">
          <input type="submit" name="showByID" value="Search" style="width: 10%; height: 100%;">
        </form>
      </div>
  
    <%
    String buttonClicked = request.getParameter("showByID");
    String employeeIDInput = request.getParameter("employeeIDInput");

    String user = "root";
    String pass = "Ken30526296@";

    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, pass);
        
        String query;
        PreparedStatement ps;

        if ("Search".equalsIgnoreCase(buttonClicked) && employeeIDInput != null && !employeeIDInput.isEmpty()) {
          int employeeID = Integer.parseInt(employeeIDInput);
          query = "SELECT EmployeeID, HotelLocation, HotelName, Date, StartTime, EndTime, Task, AssignedRoom FROM Shift WHERE EmployeeID = ?";
          ps = con.prepareStatement(query);
          ps.setInt(1, employeeID);
        } else {
          query = "SELECT EmployeeID, HotelLocation, HotelName, Date, StartTime, EndTime, Task, AssignedRoom FROM Shift";
          ps = con.prepareStatement(query);
        }  
        
        String employeeIDtoDelete = request.getParameter("deleteShift");

          if (employeeIDtoDelete != null && !employeeIDtoDelete.isEmpty()) {
            
            String deleteQuery = "DELETE FROM Project.Shift WHERE EmployeeID = ?";
            PreparedStatement psDelete = con.prepareStatement(deleteQuery);
            psDelete.setInt(1, Integer.parseInt(employeeIDtoDelete));
            int affectedRows = psDelete.executeUpdate();
    
            if (affectedRows > 0) {
              // Record deleted successfully
              out.println("<h2 class='delete-message'>Record deleted successfully.</h2>");
            } else {
              // Record not found or error in deletion
              out.println("<h2 class='error-message'>Error: Unable to delete the record.</h2>");
            }
        }

        ResultSet rs = ps.executeQuery();
        if (!rs.isBeforeFirst()) { // Check if ResultSet is empty
          out.println("<h2 class='error-message'>No data found for Employee ID: " + employeeIDInput + "</h2>");
        } else {
    %>
    <table class="table is-bordered is-striped is-narrow is-hoverable" style="width: 95%; margin: 0px 48px;">
      <thead>
          <th>Employee Id</th>
          <th>Hotel Location</th>
          <th>Hotel Name</th>
          <th>Date</th>
          <th>Start Time</th>
          <th>End Time</th>
          <th>Task</th>
          <th>Assigned Room</th>
          <th>Delete</th>
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
          <td>
            <form method="post">
              <input type="hidden" name="deleteShift" value="<%= rs.getInt("EmployeeID") %>" />
              <button type="submit" class="button is-danger is-outlined">
                  <span class="icon is-small">
                      <i class="fas fa-times"></i>
                  </span>
              </button>
            </form>
          </td>
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
