<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Check roomInven</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="navbar.css"/>
    <style>
        .header-text{
            background-color: lightblue;
            font-size: 80px;
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
    <h1 class="header-text">Check Room Inven(Full quantity = 2)</h1>
    <form method="post" action="">
      <input type="submit" name="Check" value="Check">
    </form>  
    <%
    String buttonClicked = request.getParameter("Check");

    String user = "root";
    String pass = "Ken30526296@";

    String query = "SELECT * FROM Project.roomInven";

    if ("Check".equalsIgnoreCase(buttonClicked)) {
        query = "SELECT * FROM Project.room WHERE Juice < 2 OR AppleJuice < 2 or Beer < 2";
    }

    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, pass);
        PreparedStatement ps = con.prepareStatement(query);

        ResultSet rs = ps.executeQuery();
    %>
    <table class = 'table'>
      <thead>
        <tr>
          <td>Hotel Location</td>
          <td>Hotel Name</td>
          <td>Room Number</td>
          <td>Juice</td>
          <td>Apple Juice</td>
          <td>Beer</td>
        </tr>
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
