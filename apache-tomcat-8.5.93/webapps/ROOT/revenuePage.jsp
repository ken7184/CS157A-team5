<%@ page import="java.sql.*"%>
<%@ page import="java.time.*"%>
<html>
    <head>
      <title>Revenue Page</title>
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
          .dollarSign{
            align: left;
          }
      </style>
    </head>
    <body>

      <%@ include file="navbar.jspf" %>
      <h1 class="header-text">Revenue</h1>
      <form method="post" action="">
        <input class="button is-light" style="margin-top: 2px; margin-left: 48px;" type="submit" name="sortbyDate" value="Sort by date">
      </form>
 <%
    String displayRevenue = "select * from Revenue";
    String displayTotal = "select SUM(Credit) from Revenue";
    String displayIncome;
    String displayExpense;
    String user = "root";
    String pass = "Ken30526296@";
    boolean sortByClicked = false;

    String buttonClicked = request.getParameter("sortbyDate");

    if ("Sort by date".equalsIgnoreCase(buttonClicked)) {
        displayRevenue = "select * from Revenue order by Date";
    }

    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, pass);
        
        PreparedStatement ps1 = con.prepareStatement(displayRevenue);
        PreparedStatement ps2 = con.prepareStatement(displayTotal);
        ResultSet rs1 = ps1.executeQuery();
        ResultSet rs2 = ps2.executeQuery();
        
        rs2.next();
        int total = rs2.getInt(1);
    %>
    <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth" style="width: 90%; margin-left: 48px;">
      <thead>
        <tr>
          <td>ID</td>
          <td>Booking Number</td>
          <td>Date</td>
          <td>Type</td>
          <td>Item Name</td>
          <td align = "right">Credit</td>
        </tr>
      </thead>
      <tbody>
        <% while(rs1.next()) {%>
        <tr>
          <td><%= rs1.getInt("ID") %></td>
          <td><%= rs1.getInt("BookingNumber") %></td>
          <td><%= rs1.getObject("Date", OffsetDateTime.class) %></td>
          <td><%= rs1.getString("Type") %></td>
          <td><%= rs1.getString("ItemName") %></td>
          <td align = "right"><span class = 'dollarSign'>$</span><%= rs1.getInt("Credit") %></td>
        </tr>
        <% } %>
      </tbody>
      <tfoot>
        <tr>
          <th>Total</th>
          <th>$<%= total %></th>
        </tr>
      </tfoot>
    </table>
    
    <% 

        rs1.close();
        ps1.close();
        rs2.close();
        ps2.close();
        con.close();
    }
    catch (SQLException e) {
        out.println("Exception caught: " + e.getMessage());
    }
    %>
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
        function setSortToTrue() {
          sortByClicked = true;
        }
    </script>
    </body>
</html>
