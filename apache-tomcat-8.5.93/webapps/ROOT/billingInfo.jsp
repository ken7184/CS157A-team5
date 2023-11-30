<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Manage Billing</title>
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
    <h1 class="header-text">Manage Billing</h1>
    <form method="post" action="">
      <input type="text" name="RN" placeholder="Enter Reservation Number">
      <input type="submit" name="ReservationNumber" value="Show by ReservationNumber">
    </form>
  
    <%
    String buttonClicked = request.getParameter("ReservationNumber");
    String reservationNumberInput = request.getParameter("RN");

    String user = "root";
    String pass = "Ken30526296@";

    String query = "SELECT b.BookingNumber, b.price + b.CleaningFee + COALESCE(s.sum_price, 0) AS 'TotalPrice', b.price AS 'RoomPrice', b.CleaningFee AS 'CleaningFee', COALESCE(s.sum_price, 0) AS 'ServicePrice' " +
    "FROM Project.Billing b " +
    "LEFT JOIN ( " +
    "    SELECT BookingNumber, SUM(PRICE) AS 'sum_price' " +
    "    FROM Project.Purchase " +
    "    GROUP BY BookingNumber " +
    ") AS s ON b.bookingNumber = s.BookingNumber ";


    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, pass);
        PreparedStatement ps = con.prepareStatement(query);
        
        if ("Show by ReservationNumber".equalsIgnoreCase(buttonClicked) && reservationNumberInput != null && !reservationNumberInput.isEmpty()) {
          query = "SELECT b.BookingNumber, b.price + b.CleaningFee + COALESCE(s.sum_price, 0) AS 'TotalPrice', b.price AS 'RoomPrice', b.CleaningFee AS 'CleaningFee', COALESCE(s.sum_price, 0) AS 'ServicePrice' " +
          "FROM Project.Billing b " +
          "LEFT JOIN ( " +
          "    SELECT BookingNumber, SUM(PRICE) AS 'sum_price' " +
          "    FROM Project.Purchase " +
          "    GROUP BY BookingNumber " +
          ") AS s ON b.bookingNumber = s.BookingNumber " +
          "WHERE b.BookingNumber = ?";
          ps = con.prepareStatement(query);
          int rn = Integer.parseInt(reservationNumberInput);
          ps.setInt(1, rn);
        }
        ResultSet rs = ps.executeQuery();
    %>
    <table class = 'table'>
      <thead>
        <tr>
          <td>Booking Number</td>
          <td>Total Price</td>
          <td>Room Price</td>
          <td>Cleaning Fee</td>
          <td>Service Price</td>
        </tr>
      </thead>
      <tbody>
        <% while(rs.next()) { %>
        <tr>
          <td><%= rs.getInt("BookingNumber") %></td>
          <td><%= rs.getInt("TotalPrice") %></td>
          <td><%= rs.getInt("RoomPrice") %></td>
          <td><%= rs.getInt("CleaningFee")%></td>
          <td><%= rs.getInt("ServicePrice") %></td>
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
