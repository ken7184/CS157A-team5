<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date"%>
<html>
  <head>
    <title>Create Shift</title>
  </head>
  <body>
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
        .error-message{
            font-size: 16px;
            margin-left: 48px;
            color: red;
          }
    </style>
    <%@ include file="navbar.jspf" %>
    <h1 class="header-text">Edit Shift</h1>
    <div class="content">
      <form method = "post">
        <table style="width: 50%">
            <tr>
                <td>Employee ID: </td>
                <td><input type = "text" name = "employeeId" required/></td>
            </tr>
        
            <tr>
                <td>Hotel Location: </td>
                <td><input type = "text" name = "hotelLocation" /></td>
            </tr>
        
            <tr>
                <td>Hotel Name: </td>
                <td><input type = "text" name = "hotelName" /></td>
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
                <td><input type = "text" name = "task" /></td>
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

                    String query = "SELECT EmployeeID, HotelLocation, HotelName, Date, StartTime, EndTime, Task, AssignedRoom FROM Shift WHERE EmployeeID = ?";
                    PreparedStatement ps = con.prepareStatement(query);
                    ps.setInt(1, employeeIDInt);
                    ResultSet rs = ps.executeQuery();
    %>
                    <table class = 'table'>
                        <thead>
                          <tr>
                            <td>Employee ID</td>
                            <td>Hotel Location</td>
                            <td>Hotel Name</td>
                            <td>Date</td>
                            <td>Start Time</td>
                            <td>End Time</td>
                            <td>Task</td>
                            <td>Assigned Room</td>
                          </tr>
                        </thead>
                        <tbody>
                  <%
                      while(rs.next()) {
                  %>
                    <tr>
                    <td><%= rs.getInt("EmployeeID") %></td>
                    <td><%= rs.getString("HotelLocation") %></td>
                    <td><%= rs.getString("HotelName") %></td>
                    <td><%= rs.getString("Date") %></td>
                    <td><%= rs.getString("StartTime") %></td>
                    <td><%= rs.getString("EndTime") %></td>
                    <td><%= rs.getString("Task") %></td>
                    <td><%= rs.getString("AssignedRoom") %></td>
                    </tr>
                  <%
                      }
                      rs.close();
                      ps.close();


                    String sql1 = "UPDATE Project.Shift SET";

                    if (!hotelLocation.isEmpty()) {
                        sql1 += " HotelLocation='" + hotelLocation + "'";
                    }

                    if (!hotelName.isEmpty()) {
                        if (!hotelLocation.isEmpty()) {
                            sql1 += ",";
                        }
                        sql1 += " HotelName='" + hotelName + "'";
                    }

                    if (!dateStr.isEmpty()) {
                        if (!hotelLocation.isEmpty() || !hotelName.isEmpty()) {
                            sql1 += ",";
                        }
                        sql1 += " Date='" + new Timestamp(date.getTime()) + "'";
                    }

                    if (!startTimeStr.isEmpty()) {
                        if (!hotelLocation.isEmpty() || !hotelName.isEmpty() || !dateStr.isEmpty()) {
                            sql1  += ",";
                        }
                        sql1 += " StartTime='" + new Timestamp(startTime.getTime()) + "'";
                    }

                    if (!endTimeStr.isEmpty()) {
                        if (!hotelLocation.isEmpty() || !hotelName.isEmpty() || !dateStr.isEmpty() || !startTimeStr.isEmpty()) {
                            sql1  += ",";
                        }
                        sql1 += " endTime='" + new Timestamp(endTime.getTime()) + "'";
                    }

                    if (!task.isEmpty()) {
                        if (!hotelLocation.isEmpty() || !hotelName.isEmpty() || !dateStr.isEmpty() || !startTimeStr.isEmpty() || !endTimeStr.isEmpty()) {
                            sql1  += ",";
                        }
                        sql1 += " Task='" + task + "'";
                    }

                    if (!assignedRoom.isEmpty()) {
                        if (!hotelLocation.isEmpty() || !hotelName.isEmpty() || !dateStr.isEmpty() || !startTimeStr.isEmpty() || !endTimeStr.isEmpty() || !task.isEmpty()) {
                            sql1  += ",";
                        }
                        sql1 += " AssignedRoom='" + assignedRoom + "'";
                    }
                    sql1 += " WHERE EmployeeID = ?";
                    PreparedStatement ps2 = con.prepareStatement(sql1);
                    ps2.setInt(1, employeeIDInt);
                    ps2.executeUpdate();
                    ps2.close();


                    String query2 = "SELECT EmployeeID, HotelLocation, HotelName, Date, StartTime, EndTime, Task, AssignedRoom FROM Shift WHERE EmployeeID = ?";
                    PreparedStatement ps3 = con.prepareStatement(query2);
                    ps3.setInt(1, employeeIDInt);
                    ResultSet rs1 = ps3.executeQuery();
%>
                    <table class = 'table'>
                        <thead>
                        <tr>
                            <td>Employee ID</td>
                            <td>Hotel Location</td>
                            <td>Hotel Name</td>
                            <td>Date</td>
                            <td>Start Time</td>
                            <td>End Time</td>
                            <td>Task</td>
                            <td>Assigned Room</td>
                        </tr>
                        </thead>
                        <tbody>
                    <%
                    while(rs1.next()) {
                    %>
                    <tr>
                    <td><%= rs1.getInt("EmployeeID") %></td>
                    <td><%= rs1.getString("HotelLocation") %></td>
                    <td><%= rs1.getString("HotelName") %></td>
                    <td><%= rs1.getString("Date") %></td>
                    <td><%= rs1.getString("StartTime") %></td>
                    <td><%= rs1.getString("EndTime") %></td>
                    <td><%= rs1.getString("Task") %></td>
                    <td><%= rs1.getString("AssignedRoom") %></td>
                    </tr>
                    <%
                    }


                    
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
