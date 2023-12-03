<%@ page import="java.sql.*"%>
<%@ page import="java.time.*"%>
<html>
    <head>
      <title>Income Page</title>
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
      </style>
    </head>
    <body>

      <%@ include file="navbar.jspf" %>
      <h1 class="header-text">Income Statement</h1>
      <form method="post" action="">
        <input type="text" name="employeeIDInput" placeholder="Enter Employee ID">
        <input type="submit" name="showByID" value="Show by ID">
      </form>
 <%
    String query = "SELECT * FROM Project.billing SELECT * FROM Project.purchase";

    String user = "root";
    String pass = "Ken30526296@";

    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, pass);
        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
    %>
    <table class = 'table'>
      <thead>
        <tr>
          <td>ID</td>
          <td>Card Number</td>
          <td>Card Name</td>
          <td>Booking Number</td>
          <td>Date</td>
          <td>Billing Type</td>
          <td>Price</td>
          <td>Paid Status</td>
        </tr>
      </thead>
      <tbody>
        <% while(rs.next()) {%>
        <tr>
          <td><%= rs.getInt("ID") %></td>
          <td><%= rs.getString("CardNo") %></td>
          <td><%= rs.getString("CardName") %></td>
          <td><%= rs.getInt("BookingNumber") %></td>
          <td><%= rs.getObject("Date", OffsetDateTime.class) %></td>
          <td><%= rs.getString("BillingType") %></td>
          <td><%= rs.getInt("Price") %></td>
          <td><%= rs.getString("Paid Status") %></td>
        </tr>
        <% } %>
        </tbody>
        </table>
        <%
        rs.close();
        ps.close();
        con.close();
    }
    catch (SQLException e) {
        out.println("Exception caught: " + e.getMessage());
    }
    %>
      </body>
      </html>
