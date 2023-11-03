<%@ page import="java.sql.*"%>
<%@ page session= "true" %>
<html>
  <head>
    <title>Home Page</title>
  </head>
  <body>
    <h1>My Menu</h1>
    <form method="post" >
      <input type="hidden" id="employeeIDField" name="employeeIDon" value="">
      <input type="submit" value="Start" />
      <input type="button" onClick="logOut()" value="Log Out" />
    </form>
  
  <script>
      var employeeIDon = localStorage.getItem("employeeID");
      var usernameOn = localStorage.getItem("username");
      console.log("employeeIDon: " + employeeIDon);
      console.log("usernameOn: " + usernameOn);
      document.getElementById("employeeIDField").value = employeeIDon;

      function logOut(){
        localStorage.removeItem("employeeID");
        localStorage.removeItem("username");
        window.location.href="loginPage.jsp"
      }
  </script>

        <%
        String roleN = "0"; 
        if ("post".equalsIgnoreCase(request.getMethod())) {
          String employeeIDStr = request.getParameter("employeeIDon");
          String user = "root";
          String pass = "password";
          try {
            int employeeID2 = Integer.parseInt(employeeIDStr);
            out.println("Employee ID: " + employeeID2);
            java.sql.Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, pass);
            String query = "SELECT Role FROM Employee WHERE ID = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, employeeID2);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
              roleN = rs.getString("Role");
            }
            rs.close();
            ps.close();
            con.close();
          } catch (NumberFormatException e) {
            out.println("Invalid employee ID format");
          } catch (SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
          } catch (ClassNotFoundException e) {
            out.println("ClassNotFoundException: " + e.getMessage());
          }
        } 

        if(roleN.equals("1")) {
      %>
          <h1>Manager Menu</h1>
          <form action="shiftPage.jsp" method="post">
          <label for="1. See my Shift">1. See my Shift</label>
          <button type="submit" name="submitBtn" value="text1">Go</button><br>
          </form>

          <form action="managerShift.jsp" method="post">
          <label for="2. See Employees' Shift">2. See Employees' Shift</label>
          <button type="submit" name="submitBtn" value="text1">Go</button><br>
          </form>
          
          <form action="reservationInfo.jsp" method="post">
            <label for="3. Reservation Info">3. See Reservation info</label>
            <button type="submit" name="submitBtn" value="text1">Go</button><br>
          </form>

          <form action="makeReservation.jsp" method="post">
            <label for="4. Reservation Info">4. Make Reservation </label>
            <button type="submit" name="submitBtn" value="text1">Go</button><br>
          </form>


      <%
        }
        else if(roleN.equals("3")) {
      %>
          <h1>Front Desk Menu</h1>
          <form action="shiftPage.jsp" method="post">
          <label for="1. See my Shift">1. See my Shift</label>
          <button type="submit" name="submitBtn" value="text1">Go</button><br>
          </form>
          <form action="reservationInfo.jsp" method="post">
            <label for="2. Reservation Info">2. See Reservation info</label>
            <button type="submit" name="submitBtn" value="text1">Go</button><br>
          </form>
          <form action="makeReservation.jsp" method="post">
            <label for="3. Reservation Info">3. Make Reservation </label>
            <button type="submit" name="submitBtn" value="text1">Go</button><br>
          </form>

      <%
        }
        else if(roleN.equals("2") || roleN.equals("4") || roleN.equals("5") || roleN.equals("6")){
      %>
          <h1>Employee Menu</h1>
          <form action="shiftPage.jsp" method="post">
          <label for="1. See my Shift">1. See my Shift</label>
          <button type="submit" name="submitBtn" value="text1">Go</button><br>
          </form>
      <%
        }
      %>

  </body>
</html>
