<%@ page import="java.sql.*"%>
<%@ page session= "true" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
  <head>
    <title>Home Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="navbar.css"/>
    <style>
      .body{
        display: flex;
        flex-direction: column;
      }
      .welcome-message{
        font-size: 80px;
        text-align: center;
      }

      .header-pic{
        width: 100%;
        height: 300px;
        object-fit: cover;
      }

      .date-text{
        font-size: 24px;
        text-align: center;
      }

      .guests-box-container{
        display: flex;
        justify-content: space-between;
        padding: 48px 48px;
        height: 250px;
      }
      .box{
        width: 25%;
        height: 100%;
      }

      .title-flex{
        display: flex;
        justify-content: space-between;
        flex-direction: row;
      }
      .box-title{
        font-size: 16px;
        font-weight: bold;
      }
      .box-text{
        font-size: 24px;
        padding: 16px 16px;
        text-align: center;
      }

      .reservation-section{
        padding: 48px 48px;
        width: 100%;
        gap: 24px;
      }
      .reservation-title{
        font-size: 24px;
        font-weight:400;
      }

      .tab-content {
        display: none;
      }

      .tab-content.active {
        display: block;
      }

      .manage-reservation{
        padding: 48px 48px;
      }
    </style>
  </head>
  <script>
    window.onload = function() {
        const employeeIDon = localStorage.getItem("employeeID");
        const employeeRoleon = localStorage.getItem("employeeRole");
        const queryParams = "?employeeIDon=" + encodeURIComponent(employeeIDon) + "&employeeRoleon=" + encodeURIComponent(employeeRoleon);
        const targetURL = window.location.pathname + queryParams;
        if (window.location.search != queryParams) {
            window.location.href = targetURL;
        }
    };

    function logOut(){
      localStorage.removeItem("employeeID");
      localStorage.removeItem("username");
      window.location.href="loginPage.jsp"
    }
</script>
  <body class="body">
    <%@ include file="navbar.jspf" %>
        <%
        int totalGuestsCheckingIn = 0;
        int totalGuestsCheckingOut = 0;
        int totalStay = 0;

        SimpleDateFormat sdf = new SimpleDateFormat("EEE, MMM dd, yyyy");
        Date date = new Date();
        String todayDate = sdf.format(date);
        sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date cdate = new Date();
        String currentDate = sdf.format(date);

        String employeeIDStr = request.getParameter("employeeIDon");
        String testRole = request.getParameter("employeeRoleon");
        String roleN = "0"; 
        if (employeeIDStr != null && !employeeIDStr.trim().isEmpty()) {
          String user = "root";
          String pass = "Ken30526296@";
          try {
            int employeeID2 = Integer.parseInt(employeeIDStr);
            java.sql.Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, pass);
            String query = "SELECT Name, Role FROM Employee WHERE ID = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, employeeID2);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
              roleN = rs.getString("Role");
              String name = rs.getString("Name");
              if (!name.isEmpty()) {
                out.println("<h1 class='welcome-message'>Welcome, " + name + "!</h1>"); 
                out.println("<h2 class='date-text'>" + todayDate + "</h2>");
              }
            }
            String checkInQuery = "SELECT COUNT(GuestID) AS TotalGuests FROM ReservationInfo WHERE StartDate = ?";
            ps = con.prepareStatement(checkInQuery);
            ps.setString(1, currentDate);
            rs = ps.executeQuery();
            if (rs.next()) {
              totalGuestsCheckingIn = rs.getInt("TotalGuests");
            }
            String checkOutQuery = "SELECT COUNT(GuestID) AS TotalCheckouts FROM ReservationInfo WHERE EndDate = ?";
            ps = con.prepareStatement(checkOutQuery);
            ps.setString(1, currentDate);
            rs = ps.executeQuery();
            if (rs.next()) {
              totalGuestsCheckingOut = rs.getInt("TotalCheckouts");
            }
            
            String totalStayQuery = "SELECT COUNT(GuestID) AS TotalStay FROM ReservationInfo WHERE StartDate <= ? AND EndDate > ?";
            ps = con.prepareStatement(totalStayQuery);
            ps.setString(1, currentDate);
            ps.setString(2, currentDate);
            rs = ps.executeQuery();
            if (rs.next()) {
              totalStay = rs.getInt("TotalStay");
            }
            %>
              <div class="guests-box-container">
                <div class="box">
                  <div class="title-flex">
                    <p class="box-title">Checking In Today</p>
                    <span class="icon">
                      <i class="fas fa-plane-arrival"></i>
                    </span>
                  </div>
                <%
                out.println("<p class='box-text'>" + totalGuestsCheckingIn + "</p>");
                %>
                </div>
                <div class="box">
                  <div class="title-flex">
                    <p class="box-title">Checking Out Today</p>
                    <span class="icon">
                      <i class="fas fa-plane-departure"></i>
                    </span>
                  </div>
                <%
                  out.println("<p class='box-text'>" + totalGuestsCheckingOut + "</p>");
                %>
                </div>
                <div class="box">
                  <div class="title-flex">
                    <p class="box-title">Total Stay Today</p>
                    <span class="icon">
                      <i class="fas fa-bed"></i>
                    </span>
                  </div>
                <%
                  out.println("<p class='box-text'>" + totalStay + "</p>");
                %>
                </div>
              </div>
           <%
        if(roleN.equals("1") || roleN.equals("3")) {
      %>  
      <div class="reservation-section">
        <h2 class="reservation-title" style="padding-left: 16px;">Reservation Information</h2>
        <div class="tabs">
          <ul>
            <li class="tab-link is-active" data-tab="tab-ongoing"><a>Ongoing</a></li>
            <li class="tab-link" data-tab="tab-future"><a>Future Reservation</a></li>
            <li class="tab-link" data-tab="tab-history"><a>History</a></li>
          </ul>
        </div>
        <div id="tab-ongoing" class="tab-content">
          <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
            <thead>
              <th>Booking Number</th>
              <th>Guest ID</th>
              <th>Number of Rooms</th>
              <th>Number of Guests</th>
              <th>Start Date</th>
              <th>End Date</th>
              <th>Reservation Date</th>
              <th>Booking Site</th>
              <th>Special Request</th>
              <th>Hotel Name</th>
              <th>Hotel Location</th>
              <th>Checked In</th>
              <th>Checked Out</th>
            </thead>
            <tbody>
          <%
          String ongoingQuery = "SELECT * FROM Project.ReservationInfo r LEFT JOIN Project.Stay s ON r.BookingNumber = s.BookingNumber WHERE StartDate <= ? AND EndDate > ?";
          ps = con.prepareStatement(ongoingQuery);
          ps.setString(1, currentDate);
          ps.setString(2, currentDate);
          rs = ps.executeQuery();
          while(rs.next()) {
          %>
              <tr>
                <td><%= rs.getInt("BookingNumber") %></td>
                <td><%= rs.getInt("GuestID") %></td>
                <td><%= rs.getString("NumberOfRooms") %></td>
                <td><%= rs.getString("NumberOfGuests") %></td>
                <td><%= rs.getString("StartDate") %></td>
                <td><%= rs.getString("EndDate") %></td>
                <td><%= rs.getString("ReservationDate") %></td>
                <td><%= rs.getString("BookingSite") %></td>
                <td><%= rs.getString("SpecialRequest") %></td>
                <td><%= rs.getString("HotelName") %></td>
                <td><%= rs.getString("HotelLocation") %></td>
                <td><%= rs.getString("CheckIn") %></td>
                <td><%= rs.getString("CheckOut") %></td>
              </tr>
          <%
            }
          %>
            </tbody>
          </table>
        </div>
        <div id="tab-future" class="tab-content">
          <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
            <thead>
              <th>Booking Number</th>
              <th>Guest ID</th>
              <th>Number of Rooms</th>
              <th>Number of Guests</th>
              <th>Start Date</th>
              <th>End Date</th>
              <th>Reservation Date</th>
              <th>Booking Site</th>
              <th>Special Request</th>
              <th>Hotel Name</th>
              <th>Hotel Location</th>
              <th>Checked In</th>
              <th>Checked Out</th>
            </thead>
            <tbody>
          <%
          String futureQuery = "SELECT * FROM Project.ReservationInfo r LEFT JOIN Project.Stay s ON r.BookingNumber = s.BookingNumber WHERE StartDate > ?";
          ps = con.prepareStatement(futureQuery);
          ps.setString(1, currentDate);
          rs = ps.executeQuery();
          while(rs.next()) {
          %>
              <tr>
                <td><%= rs.getInt("BookingNumber") %></td>
                <td><%= rs.getInt("GuestID") %></td>
                <td><%= rs.getString("NumberOfRooms") %></td>
                <td><%= rs.getString("NumberOfGuests") %></td>
                <td><%= rs.getString("StartDate") %></td>
                <td><%= rs.getString("EndDate") %></td>
                <td><%= rs.getString("ReservationDate") %></td>
                <td><%= rs.getString("BookingSite") %></td>
                <td><%= rs.getString("SpecialRequest") %></td>
                <td><%= rs.getString("HotelName") %></td>
                <td><%= rs.getString("HotelLocation") %></td>
                <td><%= rs.getString("CheckIn") %></td>
                <td><%= rs.getString("CheckOut") %></td>
              </tr>
          <%
            }
          %>
            </tbody>
          </table>
        </div>
        <div id="tab-history" class="tab-content">
          <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
            <thead>
              <th>Booking Number</th>
              <th>Guest ID</th>
              <th>Number of Rooms</th>
              <th>Number of Guests</th>
              <th>Start Date</th>
              <th>End Date</th>
              <th>Reservation Date</th>
              <th>Booking Site</th>
              <th>Special Request</th>
              <th>Hotel Name</th>
              <th>Hotel Location</th>
              <th>Checked In</th>
              <th>Checked Out</th>
            </thead>
            <tbody>
          <%
          String historyQuery = "SELECT * FROM Project.ReservationInfo r LEFT JOIN Project.Stay s ON r.BookingNumber = s.BookingNumber WHERE EndDate < ?";
          ps = con.prepareStatement(historyQuery);
          ps.setString(1, currentDate);
          rs = ps.executeQuery();
          while(rs.next()) {
          %>
              <tr>
                <td><%= rs.getInt("BookingNumber") %></td>
                <td><%= rs.getInt("GuestID") %></td>
                <td><%= rs.getString("NumberOfRooms") %></td>
                <td><%= rs.getString("NumberOfGuests") %></td>
                <td><%= rs.getString("StartDate") %></td>
                <td><%= rs.getString("EndDate") %></td>
                <td><%= rs.getString("ReservationDate") %></td>
                <td><%= rs.getString("BookingSite") %></td>
                <td><%= rs.getString("SpecialRequest") %></td>
                <td><%= rs.getString("HotelName") %></td>
                <td><%= rs.getString("HotelLocation") %></td>
                <td><%= rs.getString("CheckIn") %></td>
                <td><%= rs.getString("CheckOut") %></td>
              </tr>
          <%
            }
          %>
            </tbody>
          </table>
        </div>
        <a class="button is-light" href="reservationInfo.jsp" style="margin-top: 16px;">
          Search By Reservation Number
        </a>
      </div>
      <script>
        document.querySelectorAll('.tab-link').forEach(tab => {
          tab.addEventListener('click', function(e) {
            e.preventDefault();
            var activeTabs = document.querySelectorAll('.tab-link.is-active');
            activeTabs.forEach(function(activeTab) {
              activeTab.classList.remove('is-active');
            });
        
            tab.classList.add('is-active');
            var activeContents = document.querySelectorAll('.tab-content.active');
            activeContents.forEach(function(content) {
              content.classList.remove('active');
            });
        
            var tabId = tab.getAttribute('data-tab');
            var activeContent = document.getElementById(tabId);
            activeContent.classList.add('active');
          });
        });
        </script>

        <div class="manage-reservation">
          <h2 class="reservation-title">Manage Reservation</h2>
          <hr class="solid" style="border-top: 1px solid; opacity: 0.2;">
          <a class="button is-light" href="makeReservation.jsp" style="margin-top: 2px;">
            Create Reservation
          </a>
          <a class="button is-light" href="checkInOut.jsp" style="margin-top: 2px;">
            Check In & Check Out
          </a>
        </div>

        <div class="manage-reservation">
          <h2 class="reservation-title">Billing</h2>
          <hr class="solid" style="border-top: 1px solid; opacity: 0.2;">
          <a class="button is-light" href="billingInfo.jsp" style="margin-top: 2px;">
            Manage Billing
          </a>
        </div>

        <div class="manage-reservation">
          <h2 class="reservation-title">Hotels</h2>
          <hr class="solid" style="border-top: 1px solid; opacity: 0.2;">
          <a class="button is-light" href="roomInventory.jsp" style="margin-top: 2px;">
            Room Inventory
          </a>
          <a class="button is-light" href="roomResponsibility.jsp" style="margin-top: 2px; margin-left: 24px;">
            Assigned Room
          </a>
        </div>
      <%
        }
        if(roleN.equals("1")) {
      %>
          <div class="manage-reservation">
            <h2 class="reservation-title">Employees</h2>
            <hr class="solid" style="border-top: 1px solid; opacity: 0.2;">
            <a class="button is-light" href="managerShift.jsp" style="margin-top: 2px;">
              Employee Shift
            </a>
            <a class="button is-light" href="makeShift.jsp" style="margin-top: 2px;">
              Create Shift
            </a>
          </div>

      <%
        }
        else if(roleN.equals("1") || roleN.equals("2") || roleN.equals("6")) {
      %>
        <div class="manage-reservation">
          <h2 class="reservation-title">Hotels</h2>
          <hr class="solid" style="border-top: 1px solid; opacity: 0.2;">
          <a class="button is-light" href="roomInventory.jsp" style="margin-top: 2px;">
            Room Inventory
          </a>
          <a class="button is-light" href="roomResponsibility.jsp" style="margin-top: 2px; margin-left: 24px;">
            Assigned Room
          </a>
        </div>
       <% 
      }else if(roleN.equals("5")) {
        %>
        <div class="manage-reservation">
          <h2 class="reservation-title">Hotels</h2>
          <hr class="solid" style="border-top: 1px solid; opacity: 0.2;">
          <a class="button is-light" href="roomResponsibility.jsp" style="margin-top: 2px; margin-left: 24px;">
            Assigned Room
          </a>
        </div>
          <%
        }
      {      
            rs.close();
            ps.close();
            con.close();
          }
          } catch (NumberFormatException e) {
            out.println("Invalid employee ID format");
          } catch (SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
          } catch (ClassNotFoundException e) {
            out.println("ClassNotFoundException: " + e.getMessage());
          }
        } 
      
      %>
  </body>
</html>
