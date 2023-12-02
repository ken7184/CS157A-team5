<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date"%>
<%@ page import="java.io.PrintWriter"%>
<html>
<head>
    <title>Edit Reservation</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="navbar.css"/>
    <style>
        .header-text {
            background-color: lightblue;
            font-size: 100px;
            text-align: center;
        }

        .hotel-location-text {
            font-size: 24px;
            text-align: start;
            padding-bottom: 16px;
        }

        .table {
            width: 100%;
        }
    </style>
</head>
<body>
<%@ include file="navbar.jspf" %>
<h1 class="header-text">Edit Reservation</h1>
<form method="post">
    <table class = 'table'>
        <tr>
            <td>Booking Number: </td>
            <td><input type="text" name="BN" required/></td>
        </tr>

        <tr>
            <td>Number of Rooms: </td>
            <td><input type="text" name="Nrooms" /></td>
        </tr>

        <tr>
            <td>Number of Guests: </td>
            <td><input type="text" name="Nguests"/></td>
        </tr>

        <tr>
            <td>Start Date: (yyyy-mm-dd) </td>
            <td><input type = "date" name = "startDate"/></td>
        </tr>

        <tr>
            <td>End Date: (yyyy-mm-dd)</td>
            <td><input type = "date" name = "endDate"/></td>
        </tr>

        <tr>
            <td>Special Request: </td>
            <td><input type="text" name="specialRequest"/></td>
        </tr>

        <tr>
            <td>Hotel Name: </td>
            <td><input type="text" name="hotelName"/></td>
        </tr>

        <tr>
            <td>Hotel Location: </td>
            <td><input type="text" name="hotelLocation"/></td>
        </tr>

        <tr>
            <td>Room Number: </td>
            <td><input type="text" name="roomNumber"/></td>
        </tr>
    </table>
    <input type="submit" value="Submit"/>
</form>
<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String BookingNumber = request.getParameter("BN");
    int BookingN = Integer.parseInt(BookingNumber);
    String Nrooms = request.getParameter("Nrooms");
    String Nguests = request.getParameter("Nguests");

    String startDateStr = request.getParameter("startDate");
    String endDateStr = request.getParameter("endDate");

    if (startDateStr != null) {
        startDateStr = startDateStr.replace("T", " ");
    } else {
        startDateStr = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    }

    if (endDateStr != null) {
        endDateStr = endDateStr.replace("T", " ");
    } else {
        endDateStr = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    }

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date startDate = dateFormat.parse(startDateStr);
    Date endDate = dateFormat.parse(endDateStr);


    String specialRequest = request.getParameter("specialRequest");
    String hotelName = request.getParameter("hotelName");
    String hotelLocation = request.getParameter("hotelLocation");
    String rNumber = request.getParameter("roomNumber");

    String user = "root";
    String pass = "Ken30526296@";
    String query = "SELECT * FROM Project.ReservationInfo r JOIN Project.Stay s ON r.BookingNumber = s.BookingNumber WHERE r.BookingNumber = ?";

    try {
        java.sql.Connection con;
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, pass);
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, BookingN);
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
<%      ps.close();

        String query2 = "UPDATE Project.ReservationInfo SET";

        if (!Nrooms.isEmpty()) {
            query2 += " NumberOfRooms='" + Nrooms + "'";
        }
    
        if (!Nguests.isEmpty()) {
            if (!Nrooms.isEmpty()) {
                query2 += ",";
            }
            query2 += " NumberOfGuests='" + Nguests + "'";
        }

        if (!startDateStr.isEmpty()) {
            if (!Nrooms.isEmpty() || !Nguests.isEmpty()) {
                query2 += ",";
            }
            query2 += " StartDate='" + new Timestamp(startDate.getTime()) + "'";
        }

        if (!endDateStr.isEmpty()) {
            if (!Nrooms.isEmpty() || !Nguests.isEmpty() || !startDateStr.isEmpty()) {
                query2 += ",";
            }
            query2 += " EndDate='" + new Timestamp(endDate.getTime()) + "'";
        }

        if (!specialRequest.isEmpty()) {
            if (!Nrooms.isEmpty() || !Nguests.isEmpty() || !startDateStr.isEmpty() || !endDateStr.isEmpty()) {
                query2 += ",";
            }
            query2 += " SpecialRequest='" + specialRequest + "'";
        }

        query2 += " WHERE BookingNumber=?";
        PreparedStatement ps2 = con.prepareStatement(query2);
        ps2.setInt(1, BookingN);
        ps2.executeUpdate();

        String query3 = "UPDATE Project.Stay SET";

        if (!hotelName.isEmpty()) {
            query3 += " HotelName='" + hotelName + "'";
        }

        if (!hotelLocation.isEmpty()) {
            if (!hotelName.isEmpty()) {
                query3 += ",";
            }
            query3 += " HotelLocation='" + hotelLocation + "'";
        }

        if (!rNumber.isEmpty()) {
            if (!hotelName.isEmpty() || !hotelLocation.isEmpty()) {
                query3 += ",";
            }
            query3 += " RoomNumber='" + rNumber + "'";
        }
        query3 += " WHERE BookingNumber=?";
        PreparedStatement ps3 = con.prepareStatement(query3);
        ps3.setInt(1, BookingN);
        ps3.executeUpdate();
        ps3.close();

        String query4 = "SELECT * FROM Project.ReservationInfo r JOIN Project.Stay s ON r.BookingNumber = s.BookingNumber WHERE r.BookingNumber = ?";
        PreparedStatement ps4 = con.prepareStatement(query4);
        ps4.setInt(1, BookingN);
        rs = ps4.executeQuery();
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
        ps4.close();
        rs.close();
        con.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    %>
</body>
</html>
