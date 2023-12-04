<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Check roomInven</title>
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
        
        .table{
            width: 100%;
        }
    </style>
  </head>
  <body>
  
    <%@ include file="navbar.jspf" %>
    <div class="title-section">
      <h2 class="title">Room Inventory</h2>
      <hr class="solid" style="border-top: 1px solid; opacity: 0.2;">
    </div>
    <form method="post" action="">
      <input class="button" type="submit" name="Check" value="Show All Rooms" style="margin-left: 48px;">
      <input class="button" type="submit" name="Check" value="Room Needs Restocking" style="margin-left: 48px;">
    </form>  

    <%
    String buttonClicked = request.getParameter("Check");

    String user = "root";
    String pass = "password";

    String query = "SELECT * FROM Room";

    if ("Show All Rooms".equalsIgnoreCase(buttonClicked)) {
      query = "SELECT * FROM Room";
  }

    if ("Room Needs Restocking".equalsIgnoreCase(buttonClicked)) {
        query = "SELECT * FROM Project.room WHERE Juice < 2 OR AppleJuice < 2 or Beer < 2";
    }

    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, pass);
        PreparedStatement ps = con.prepareStatement(query);
        
        ResultSet rs = ps.executeQuery();
    %>
    <table class="table is-bordered is-striped is-narrow is-hoverable" style="width: 95%; margin: 0px 48px;">
      <thead>
          <th>Hotel Location</th>
          <th>Hotel Name</th>
          <th>Room Number</th>
          <th>Juice</th>
          <th>Apple Juice</th>
          <th>Beer</th>
      </thead>
      <tbody>
        <% while(rs.next()) { %>
        <tr>
          <td><%= rs.getString("HotelLocation") %></td>
          <td><%= rs.getString("HotelName") %></td>
          <td><%= rs.getString("roomNumber") %></td>
          <td><%= rs.getInt("Juice") %></td>
          <td><%= rs.getInt("AppleJuice") %></td>
          <td><%= rs.getInt("Beer") %></td>
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
