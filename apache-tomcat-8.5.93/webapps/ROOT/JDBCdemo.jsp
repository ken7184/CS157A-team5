<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Project Demo</title>
  </head>
  <body>
    <h1>JDBC Connection Example</h1>
    
    <table border="1">
      <tr>
        <td>SJSU ID</td>
        <td>Name</td>
        <td>Major</td>
   </tr>
    <% 
     String db = "cs157a";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "Ken30526296@";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false",user, password);
            out.println(db + " database successfully opened.<br/><br/>");
            
            out.println("Initial entries in table \"Student\": <br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Billing");
            while (rs.next()) {
                out.println(rs.getInt(1) + "    " + rs.getString(2) + "    " + rs.getString(3) + "<br/><br/>");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>
