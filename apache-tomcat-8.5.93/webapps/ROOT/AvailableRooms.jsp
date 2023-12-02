<%@ page import="java.sql.*"%>
<%@ page import="java.util.LinkedHashMap"%>
<%@ page import="java.util.Map"%>
<html>
    <head>
      <title>Available Rooms</title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
      <link rel="stylesheet" href="navbar.css"/>
      <style>
          .manage-reservation{
              padding: 24px 48px 0px 48px;
          }

          .reservation-title{
              font-size: 24px;
              font-weight: 400;
            }
      </style>
    </head>
    <body>
      <%@ include file="navbar.jspf" %>
      <div class="manage-reservation">
        <h2 class="reservation-title">Available Rooms</h2>
        <hr class="solid" style="border-top: 1px solid; opacity: 0.2;">
        
    </div>
    <%
    String buttonClicked = request.getParameter("ReservationNumber");
    String reservationNumberInput = request.getParameter("RN");

    String user = "root";
    String pass = "Ken30526296@";

    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, pass);
        String query = "SELECT * From Hotel";
        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
    %>
        <div class="dropdown" style="margin-left: 48px; margin-bottom: 16px;">
            <div class="dropdown-trigger">
            <button class="button" aria-haspopup="true" aria-controls="dropdown-menu">
                <%
                    String hotel = request.getParameter("hotel");
                    if(hotel != null && !hotel.isEmpty()) {
                        out.println("<span>" + hotel + "</span>");
                    } else {
                        out.println("<span>Select Hotel</span>");
                    }
                %>
                <span class="icon is-small">
                <i class="fas fa-angle-down" aria-hidden="true"></i>
                </span>
            </button>
            </div>
            <div class="dropdown-menu" id="dropdown-menu" role="menu">
            <div class="dropdown-content">
                <%
                    while(rs.next()) {
                        String hotelName = rs.getString("Name");
                        out.println("<a class='dropdown-item button is-white' href='AvailableRooms.jsp?hotel=" + hotelName + "' >" + hotelName + "</a>");
                    }
                %>
            </div>
            </div>
        </div>

        <%
            String roomTypeQuery = "SELECT DISTINCT TypeName From Room";
            ps = con.prepareStatement(roomTypeQuery);
            rs = ps.executeQuery();
        %>
        <div class="dropdown" style="margin-left: 48px; margin-bottom: 16px;">
            <div class="dropdown-trigger">
            <button class="button" aria-haspopup="true" aria-controls="dropdown-menu">
                <%
                    hotel = request.getParameter("hotel");
                    String type = request.getParameter("type");
                    if(type != null && !type.isEmpty()) {
                        out.println("<span>" + type + "</span>");
                    } else {
                        out.println("<span>Room Type</span>");
                    }
                %>
                <span class="icon is-small">
                <i class="fas fa-angle-down" aria-hidden="true"></i>
                </span>
            </button>
            </div>
            <div class="dropdown-menu" id="dropdown-menu" role="menu">
            <div class="dropdown-content">
                <%
                    while(rs.next()) {
                        String typeName = rs.getString("TypeName");
                        if (hotel != null && !hotel.trim().isEmpty()) {
                            out.println("<a class='dropdown-item button is-white' href='AvailableRooms.jsp?hotel=" + hotel + "&type=" + typeName + "' >" + typeName + "</a>");
                        }
                        else{
                            out.println("<a class='dropdown-item button is-white' href='AvailableRooms.jsp?type=" + typeName + "' >" + typeName + "</a>");
                        }
                    }
                %>
            </div>
            </div>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', () => {
                // Get all "dropdown-trigger" elements
                const dropdowns = document.querySelectorAll('.dropdown-trigger');
            
                // Add a click event on each of them
                dropdowns.forEach(dropdown => {
                    dropdown.addEventListener('click', () => {
                        // Toggle the class on click to show/hide the dropdown
                        dropdown.parentElement.classList.toggle('is-active');
                    });
                });
            });
            </script>
        <%
            hotel = request.getParameter("hotel");
            type = request.getParameter("type");
            String roomQuery = "SELECT * FROM Room WHERE Availability='Yes'";
            int index = 1;
        
            if (hotel != null && !hotel.trim().isEmpty()) {
                roomQuery += " AND HotelName = ?";
            }
            if (type != null && !type.trim().isEmpty()) {
                roomQuery += " AND TypeName = ?";
            }
            ps = con.prepareStatement(roomQuery);

            if (hotel != null && !hotel.trim().isEmpty()) {
                ps.setString(index, hotel);
                index++;
            }
            if (type != null && !type.trim().isEmpty()) {
                ps.setString(index, type);
                index++;
            }
        
            rs = ps.executeQuery();
        %>
    <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth" style="width: 90%; margin-left: 48px;">
            <thead>
                <th>Hotel Name</th>
                <th>Hotel Location</th>
                <th>Room Number</th>
                <th>Price</th>
                <th>Availability</th>
                <th>Type</th>
                <th>Beds</th>
                <th>Breakfast</th>
            </thead>
            <tbody>
    <% 
        while(rs.next()) {
    %>
            <tr>
                <td><%= rs.getString("HotelName") %></td>
                <td><%= rs.getString("HotelLocation") %></td>
                <td><%= rs.getString("RoomNumber") %></td>
                <td><%= rs.getInt("Price") %></td>
                <td><%= rs.getString("Availability") %></td>
                <td><%= rs.getString("TypeName") %></td>
                <td><%= rs.getString("Beds") %></td>
                <td><%= rs.getString("hasBreakfast") %></td>
            </tr>
        <%
        }       
            rs.close();
            ps.close();
            con.close();
        }
     catch (SQLException | ClassNotFoundException e) {
        out.println("Exception caught: " + e.getMessage());
    }
    %>
  </body>
</html>
