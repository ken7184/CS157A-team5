<%@ page import="java.sql.*"%>
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


    String user = "root";
    String pass = "Ken30526296@";
    String query = "SELECT * FROM Project.ReservationInfo r JOIN Project.Stay s ON r.BookingNumber = s.BookingNumber WHERE r.BookingNumber = ?";

    try {
        java.sql.Connection con;
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, pass);
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, BookingN);

        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
            // Update successful
            out.println("Update successful");
        } else {
            // No records were updated
            out.println("No records were updated");
        }
        ps.close();
        con.close();
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.println("Exception caught: " + e.getMessage());
    }
}
%>
</body>
</html>
