<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<html>
<head>
    <title>Check In & Out</title>
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
<h1 class="header-text">Check In & Out</h1>
<form method="post">
    <table class = 'table'>
        <tr>
            <td>Booking Number: </td>
            <td><input type="text" name="BN" required/></td>
        </tr>
        <tr>
            <td>Check-In: </td>
            <td><input type="text" name="CheckIn" required/></td>
        </tr>
        <tr>
            <td>Check-Out: </td>
            <td><input type="text" name="CheckOut" required/></td>
        </tr>
    </table>
    <input type="submit" value="Submit"/>
</form>
<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String BookingNumber = request.getParameter("BN");
    int BookingN = Integer.parseInt(BookingNumber);
    String CheckIn = request.getParameter("CheckIn");
    String CheckOut = request.getParameter("CheckOut");

    String user = "root";
    String pass = "Ken30526296@";
    String query = "UPDATE Project.Stay SET CheckIn=?, CheckOut=? WHERE BookingNumber=?";

    try {
        java.sql.Connection con;
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, pass);
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, CheckIn);
        ps.setString(2, CheckOut);
        ps.setInt(3, BookingN);
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
