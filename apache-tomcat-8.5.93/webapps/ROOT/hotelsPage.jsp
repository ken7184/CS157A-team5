<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Hotels Page</title>
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
    <h1 class="header-text">Hotels</h1>

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
      String pass = "password";
      try {
        int employeeID2 = Integer.parseInt(employeeIDStr);
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false",user, pass);
        String query = "SELECT HotelLocation, HotelName FROM Shift WHERE EmployeeID = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, employeeID2);
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
            String HotelName = rs.getString("HotelName");
            String HotelLocation = rs.getString("HotelLocation");
            out.println("<h2 class='hotel-location-text'>Your Hotel Location: " + HotelName + " in " + HotelLocation + "</h2>");
            out.println("<h2 class='hotel-location-text'>List of Hotels:</h2>");
        }

        String query2 = "SELECT Location, Name FROM Hotel";
        ps = con.prepareStatement(query2);
        rs = ps.executeQuery();
        %>
        <table class="table">
            <thead>
                <tr>
                  <th>Hotel Name</th>
                  <th>Hotel Location</th>
                </tr>
            </thead>
            <tbody>
        <%
        while(rs.next()) {
         %>
                <tr>
                    <td><%= rs.getString("Location") %></td>
                    <td><%= rs.getString("Name") %></td>
                </tr>
    <%
        }
        rs.close();
        ps.close();
        con.close();
        %>
            </tbody>
            </table>
        <%
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