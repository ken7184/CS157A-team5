<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Shift Page</title>
  </head>
  <body>
    <h1>Employee Shift</h1>

    <script>
      window.onload = function() {
          const employeeIDon = localStorage.getItem("employeeID");
          const queryParams = "?employeeIDon=" + encodeURIComponent(employeeIDon);
          const targetURL = window.location.pathname + queryParams;
          if (window.location.search != queryParams) {
              window.location.href = targetURL;
          }
      };
  </script>
    <%
    String employeeIDStr = request.getParameter("employeeIDon");
    if (employeeIDStr != null && !employeeIDStr.trim().isEmpty()) {
      String user = "root";
      String pass = "Ken30526296@";
      try {
        int employeeID2 = Integer.parseInt(employeeIDStr);
        out.println("Employee ID: " + employeeID2 );
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false",user, pass);
        String query = "SELECT HotelLocation, HotelName, Date, StartTime, EndTime, Task, AssignedRoom FROM Shift WHERE EmployeeID = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, employeeID2);
        ResultSet rs = ps.executeQuery();
      %>
        <table border="1">
          <thead>
            <tr>
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
    <%
        while(rs.next()) {
    %>
        <tr>
        <td><%= rs.getString("HotelLocation") %></td>
        <td><%= rs.getString("HotelName") %></td>
        <td><%= rs.getString("Date") %></td>
        <td><%= rs.getString("StartTime") %></td>
        <td><%= rs.getString("EndTime") %></td>
        <td><%= rs.getString("Task") %></td>
        <td><%= rs.getString("AssignedRoom") %></td>
        </tr>
    <%
        }
        rs.close();
        ps.close();
        con.close();
        } catch (NumberFormatException e) {
        out.println("Click the See Task Button");
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