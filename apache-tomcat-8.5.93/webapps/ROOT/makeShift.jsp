<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date"%>
<html>
  <head>
    <title>Create Shift</title>
  </head>
  <body>
    <div class="content">
      <h1>Create Shift</h1>
      <form method = "post">
        <table style="width: 50%">
            <tr>
                <td>Employee ID: </td>
                <td><input type = "text" name = "employeeId" required/></td>
            </tr>
        
            <tr>
                <td>Hotel Location: </td>
                <td><input type = "text" name = "hotelLocation" required/></td>
            </tr>
        
            <tr>
                <td>Hotel Name: </td>
                <td><input type = "text" name = "hotelName" required/></td>
            </tr>

            <tr>
                <td>Date: (yyyy-mm-dd) </td>
                <td><input type = "datetime-local" name = "date" required/></td>
            </tr>

            <tr>
                <td>Start Time: (yyyy-mm-dd)</td>
                <td><input type = "datetime-local" name = "startTime" required/></td>
            </tr>

            <tr>
                <td>End Time: (yyyy-mm-dd)</td>
                <td><input type = "datetime-local" name = "endTime" required/></td>
            </tr>

            <tr>
                <td>Task: </td>
                <td><input type = "text" name = "task" required/></td>
            </tr>

            <tr>
                <td>Assigned Room:  </td>
                <td><input type = "text" name = "assignedRoom"/></td>
            </tr>

        </table>
        <input type="submit" value="Submit" />
        </form>
    </div>


    <%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String employeeIDStr = request.getParameter("employeeId");

        String hotelLocation = request.getParameter("hotelLocation");
        String hotelName = request.getParameter("hotelName");

        String dateStr = request.getParameter("date");

        String startTimeStr = request.getParameter("startTime");
        String endTimeStr = request.getParameter("endTime");

        if (dateStr != null) {
            dateStr = dateStr.replace("T", " ");
        } else {
            dateStr = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
        }

        if (startTimeStr != null) {
            startTimeStr = startTimeStr.replace("T", " ");
        } else {
            startTimeStr = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
        }

        if (endTimeStr != null) {
            endTimeStr = endTimeStr.replace("T", " ");
        } else {
            endTimeStr = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
        }

        String task = request.getParameter("task");
        String assignedRoom = request.getParameter("assignedRoom");

        if (employeeIDStr != null && !employeeIDStr.isEmpty()) {
            try {
                int employeeIDInt = Integer.parseInt(employeeIDStr);

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                Date date = dateFormat.parse(dateStr);
                Date startTime = dateFormat.parse(startTimeStr);
                Date endTime = dateFormat.parse(endTimeStr);

                String user = "root";
                String password = "Ken30526296@";

                Connection con = null;
                PreparedStatement preparedStatement = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, password);

                    String sql = "INSERT INTO Project.Shift (EmployeeID, HotelLocation, HotelName, Date, StartTime, endTime, Task, AssignedRoom) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                    preparedStatement = con.prepareStatement(sql);
                    preparedStatement.setInt(1, employeeIDInt);
                    preparedStatement.setString(2, hotelLocation);
                    preparedStatement.setString(3, hotelName);
                    preparedStatement.setTimestamp(4, new Timestamp(date.getTime()));
                    preparedStatement.setTimestamp(5, new Timestamp(startTime.getTime()));
                    preparedStatement.setTimestamp(6, new Timestamp(endTime.getTime()));
                    preparedStatement.setString(7, task);
                    preparedStatement.setString(8, assignedRoom);
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
                out.println("Invalid EmployeetId format");
            }
        } else {
            out.println("Enter Information.");
        }
    }
    %>

  </body>
</html>
