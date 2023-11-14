<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date"%>
<html>
  <head>
    <title>Create Reservation</title>
    <link href="createAccountPage.css" rel="stylesheet" />
  </head>
  <body>
    <div class="content">
      <h1>Create Reservation</h1>
      <form method = "post">
        <table style="width: 50%">
            <tr>
                <td>Guest ID: </td>
                <td><input type = "text" name = "guestId" required/></td>
            </tr>
        
            <tr>
                <td>Number of Rooms: </td>
                <td><input type = "text" name = "Nrooms" required/></td>
            </tr>
        
            <tr>
                <td>Number of Guests: </td>
                <td><input type = "text" name = "Nguests" required/></td>
            </tr>

            <tr>
                <td>Start Date: (yyyy-mm-dd) </td>
                <td><input type = "datetime-local" name = "startDate" required/></td>
            </tr>

            <tr>
                <td>End Date: (yyyy-mm-dd)</td>
                <td><input type = "datetime-local" name = "endDate" required/></td>
            </tr>

            <tr>
                <td>Reservation Date: (yyyy-mm-dd)</td>
                <td><input type = "datetime-local" name = "reserveDate" required/></td>
            </tr>

            <tr>
                <td>Special Request: </td>
                <td><input type = "text" name = "specialRequest" required/></td>
            </tr>

            <tr>
                <td>Hotel Name: </td>
                <td><input type = "text" name = "hotel_name" required/></td>
            </tr>

            <tr>
                <td>Hotel Location: </td>
                <td><input type = "text" name = "hotel_location" required/></td>
            </tr>

            <tr>
                <td>Room Number: </td>
                <td><input type = "text" name = "rNumber" required/></td>
            </tr>

        </table>
        <input type="submit" value="Submit" />
        </form>
    </div>


    <%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String guestIdStr = request.getParameter("guestId");
        String nRooms = request.getParameter("Nrooms");
        String Nguests = request.getParameter("Nguests");

        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        String reserveDateStr = request.getParameter("reserveDate");

        if (startDateStr != null) {
            startDateStr = startDateStr.replace("T", " ");
        } else {
            startDateStr = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
        }

        if (endDateStr != null) {
            endDateStr = endDateStr.replace("T", " ");
        } else {
            endDateStr = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
        }

        if (reserveDateStr != null) {
            reserveDateStr = reserveDateStr.replace("T", " ");
        } else {
            reserveDateStr = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
        }

        String specialRequest = request.getParameter("specialRequest");
        String hotelName = request.getParameter("hotel_name");
        String hotelLocation = request.getParameter("hotel_location");
        String rNumber = request.getParameter("rNumber");

        if (guestIdStr != null && !guestIdStr.isEmpty()) {
            try {
                int guestId = Integer.parseInt(guestIdStr);

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                Date startDate = dateFormat.parse(startDateStr);
                Date endDate = dateFormat.parse(endDateStr);
                Date reserveDate = dateFormat.parse(reserveDateStr);

                String user = "root";
                String password = "Ken30526296@";

                Connection con = null;
                PreparedStatement preparedStatement = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, password);

                    String sql = "INSERT INTO Project.ReservationInfo (GuestID, NumberOfRooms, NumberOfGuests, StartDate, EndDate, ReservationDate, SpecialRequest) VALUES (?, ?, ?, ?, ?, ?, ?)";
                    preparedStatement = con.prepareStatement(sql);
                    preparedStatement.setInt(1, guestId);
                    preparedStatement.setString(2, nRooms);
                    preparedStatement.setString(3, Nguests);
                    preparedStatement.setTimestamp(4, new Timestamp(startDate.getTime()));
                    preparedStatement.setTimestamp(5, new Timestamp(endDate.getTime()));
                    preparedStatement.setTimestamp(6, new Timestamp(reserveDate.getTime()));
                    preparedStatement.setString(7, specialRequest);
                    preparedStatement.executeUpdate();

                    String sql2 = "INSERT INTO Project.Stay (HotelName, HotelLocation, RoomNumber) VALUES (?, ?, ?)";
                    preparedStatement = con.prepareStatement(sql2);
                    preparedStatement.setString(1, hotelName);
                    preparedStatement.setString(2, hotelLocation);
                    preparedStatement.setString(3, rNumber);
                    preparedStatement.executeUpdate();

                    con.close();
                } catch (Exception e) {
                    out.println("Exception caught: " + e.getMessage());
                } finally {
                    try {
                        if (preparedStatement != null) {
                            preparedStatement.close();
                        }
                        if (con != null) {
                            con.close();
                        }
                    } catch (SQLException e) {
                        out.println("SQLException caught: " + e.getMessage());
                    }
                }
            } catch (NumberFormatException e) {
                out.println("Invalid guestId format");
            }
        } else {
            out.println("Enter Information.");
        }
    }
    %>

  </body>
</html>
