<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Manage Billing</title>
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
      <h2 class="title">Manage Billing</h2>
      <hr class="solid" style="border-top: 1px solid; opacity: 0.2;">
    </div>

    <div style="width: 50%; margin: 16px 48px; height: 24px;">
      <form method="post" action="">
        <input type="text" name="RN" placeholder="Enter Reservation Number" style="width: 45%; height: 100%;">
        <input type="submit" name="ReservationNumber" value="Search" style="width: 10%; height: 100%;">
      </form>
    </div>
  
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
        
        if ("Search".equalsIgnoreCase(buttonClicked) && reservationNumberInput != null && !reservationNumberInput.isEmpty()) {
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
        if (!rs.isBeforeFirst()) { // Check if ResultSet is empty
          out.println("<h2 class='error-message'>No data found for reservation number: " + reservationNumberInput + "</h2>");
        } else {
    %>
    <table class="table is-bordered is-striped is-narrow is-hoverable" style="width: 95%; margin: 0px 48px;">
      <thead>
          <th>Booking Number</th>
          <th>Total Price</th>
          <th>Room Price</th>
          <th>Cleaning Fee</th>
          <th>Service Price</th>
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
