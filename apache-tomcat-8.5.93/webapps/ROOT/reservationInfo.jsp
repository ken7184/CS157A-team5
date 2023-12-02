<%@ page import="java.sql.*"%>
<html>
    <head>
      <title>Search Reservation</title>
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
        <h2 class="title">Search Reservation</h2>
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
    String pass = "password";
    
    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, pass);

        String query;
        PreparedStatement ps;

        if ("Search".equalsIgnoreCase(buttonClicked) && reservationNumberInput != null && !reservationNumberInput.isEmpty()) {
            int rn = Integer.parseInt(reservationNumberInput);
            query = "SELECT * FROM Project.ReservationInfo r JOIN Project.Stay s ON r.BookingNumber = s.BookingNumber WHERE r.BookingNumber = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, rn);
        } else {
            query = "SELECT * FROM Project.ReservationInfo r JOIN Project.Stay s ON r.BookingNumber = s.BookingNumber";
            ps = con.prepareStatement(query);
        }   

        ResultSet rs = ps.executeQuery();

        if (!rs.isBeforeFirst()) { // Check if ResultSet is empty
          out.println("<h2 class='error-message'>No data found for reservation number: " + reservationNumberInput + "</h2>");
        } else {
        %>
          <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth" style="width: 90%; margin-left: 48px; font-size: 14px;">
            <thead>
                <th>Booking Number</th>
                <th>Guest Id</th>
                <th>Number of Rooms</th>
                <th>Number of Guests</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Reservation Date</th>
                <th>Booking Site</th>
                <th>Special Request</th>
                <th>Hotel Name</th>
                <th>Hotel Location</th>
                <th>Room Number</th>
                <th>Check In</th>
                <th>Check Out</th>
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
