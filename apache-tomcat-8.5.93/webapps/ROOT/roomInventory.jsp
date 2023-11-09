<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Home Page</title>
  </head>
  <body>
    <h1>Check Room Inventory(Full quantity = 2)</h1>

    <form method="post" action="">
      <input type="submit" name="Check" value="Check">
    </form>
  
    <%
    String buttonClicked = request.getParameter("Check");

    String user = "root";
    String pass = "Ken30526296@";

    String query = "SELECT * FROM Project.roomInven";

    if ("Check".equalsIgnoreCase(buttonClicked)) {
        query = "SELECT * FROM Project.roomInven WHERE Juice < 2 OR AppleJuice < 2 or Beer < 2";
    }

    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, pass);
        PreparedStatement ps = con.prepareStatement(query);

        ResultSet rs = ps.executeQuery();
    %>
    <table border="1">
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
