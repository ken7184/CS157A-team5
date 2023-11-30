<%@ page import="java.sql.*"%>
<html>
    <head>
      <title>check reservation</title>
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
      <h1 class="header-text">Check Reservation</h1>
      <form method="post" action="">
        <input type="text" name="RN" placeholder="Enter Reservation Number">
        <input type="submit" name="ReservationNumber" value="Show by ReservationNumber">
      </form>
    <%
    String buttonClicked = request.getParameter("ReservationNumber");
    String reservationNumberInput = request.getParameter("RN");

    String user = "root";
    String pass = "Ken30526296@";
    String query = "SELECT * FROM Project.ReservationInfo r JOIN Project.Stay s ON r.BookingNumber = s.BookingNumber WHERE r.BookingNumber = ?";

    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, pass);
        
        if ("Show by ReservationNumber".equalsIgnoreCase(buttonClicked) && reservationNumberInput != null && !reservationNumberInput.isEmpty()) {
            int rn = Integer.parseInt(reservationNumberInput);
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, rn);
            ResultSet rs = ps.executeQuery();
    %>
    <table class = 'table'>
      <thead>
        <tr>
          <td>Booking Number</td>
          <td>Guest Id</td>
          <td>Number of Rooms</td>
          <td>Number of Guests</td>
          <td>Start Date</td>
          <td>End Date</td>
          <td>Reservation Date</td>
          <td>Booking Site</td>
          <td>Special Request</td>
          <td>Hotel Name</td>
          <td>Hotel Location</td>
          <td>Room Number</td>
          <td>Check In</td>
          <td>Check Out</td>
        </tr>
      </thead>
      <tbody>
        <% while(rs.next()) { %>
        <tr>
          <td><%= rs.getInt("BookingNumber") %></td>
          <td><%= rs.getInt("GuestID") %></td>
          <td><%= rs.getString("NumberOfRooms") %></td>
          <td><%= rs.getString("NumberOfGuests") %></td>
          <td><%= new Date(rs.getTimestamp("StartDate").getTime()) %></td>
          <td><%= new Date(rs.getTimestamp("EndDate").getTime()) %></td>
          <td><%= new Date(rs.getTimestamp("ReservationDate").getTime()) %></td>
          <td><%= rs.getString("BookingSite") %></td>
          <td><%= rs.getString("SpecialRequest") %></td>
          <td><%= rs.getString("HotelName") %></td>
          <td><%= rs.getString("HotelLocation") %></td>
          <td><%= rs.getString("RoomNumber") %></td>
          <td><%= rs.getString("CheckIn") %></td>
          <td><%= rs.getString("CheckOut") %></td>
        </tr>
        <% } %>
      </tbody>
    </table>
    <%
            rs.close();
            ps.close();
        }
        con.close();
    } catch (SQLException | ClassNotFoundException e) {
        out.println("Exception caught: " + e.getMessage());
    }
    %>
  </body>
</html>
