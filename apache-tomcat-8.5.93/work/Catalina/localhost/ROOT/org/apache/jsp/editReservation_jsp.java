/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.93
 * Generated at: 2023-12-02 19:05:37 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.PrintWriter;

public final class editReservation_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/navbar.jspf", Long.valueOf(1699404577502L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.io.PrintWriter");
    _jspx_imports_classes.add("java.util.Date");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Edit Reservation</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"navbar.css\"/>\n");
      out.write("    <style>\n");
      out.write("        .header-text {\n");
      out.write("            background-color: lightblue;\n");
      out.write("            font-size: 100px;\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .hotel-location-text {\n");
      out.write("            font-size: 24px;\n");
      out.write("            text-align: start;\n");
      out.write("            padding-bottom: 16px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .table {\n");
      out.write("            width: 100%;\n");
      out.write("        }\n");
      out.write("        .error-message{\n");
      out.write("            font-size: 16px;\n");
      out.write("            margin-left: 48px;\n");
      out.write("            color: red;\n");
      out.write("          }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<nav class=\"navbar is-transparent\" role=\"navigation\" aria-label=\"main navigation\">\n");
      out.write("  <div id=\"navbarBasicExample\" class=\"navbar-menu\">\n");
      out.write("    <div class=\"navbar-start\">\n");
      out.write("      <a class=\"navbar-item\" href=\"Menu.jsp\">\n");
      out.write("        <span class=\"icon-text\">\n");
      out.write("          <span class=\"icon\">\n");
      out.write("            <i class=\"fas fa-home\"></i>\n");
      out.write("          </span>\n");
      out.write("          <span>Home</span>\n");
      out.write("        </span>\n");
      out.write("      </a>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"navbar-end\">\n");
      out.write("      <div class=\"navbar-item\">\n");
      out.write("        <div class=\"buttons\">\n");
      out.write("          <a class=\"navbar-item\" href=\"hotelsPage.jsp\">\n");
      out.write("            Hotels\n");
      out.write("          </a>\n");
      out.write("          <a class=\"navbar-item\" href=\"shiftPage.jsp\">\n");
      out.write("            Shift\n");
      out.write("          </a>\n");
      out.write("          <a class=\"navbar-item\">\n");
      out.write("            Account\n");
      out.write("          </a>\n");
      out.write("          <a class=\"button is-light\" onclick=\"logOut()\">\n");
      out.write("            Log Out\n");
      out.write("          </a>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</nav>");
      out.write("\n");
      out.write("<h1 class=\"header-text\">Edit Reservation</h1>\n");
      out.write("<form method=\"post\">\n");
      out.write("    <table class = 'table'>\n");
      out.write("        <tr>\n");
      out.write("            <td>Booking Number: </td>\n");
      out.write("            <td><input type=\"text\" name=\"BN\" required/></td>\n");
      out.write("        </tr>\n");
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>Number of Rooms: </td>\n");
      out.write("            <td><input type=\"text\" name=\"Nrooms\" /></td>\n");
      out.write("        </tr>\n");
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>Number of Guests: </td>\n");
      out.write("            <td><input type=\"text\" name=\"Nguests\"/></td>\n");
      out.write("        </tr>\n");
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>Start Date: (yyyy-mm-dd) </td>\n");
      out.write("            <td><input type = \"date\" name = \"startDate\"/></td>\n");
      out.write("        </tr>\n");
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>End Date: (yyyy-mm-dd)</td>\n");
      out.write("            <td><input type = \"date\" name = \"endDate\"/></td>\n");
      out.write("        </tr>\n");
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>Special Request: </td>\n");
      out.write("            <td><input type=\"text\" name=\"specialRequest\"/></td>\n");
      out.write("        </tr>\n");
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>Hotel Name: </td>\n");
      out.write("            <td><input type=\"text\" name=\"hotelName\"/></td>\n");
      out.write("        </tr>\n");
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>Hotel Location: </td>\n");
      out.write("            <td><input type=\"text\" name=\"hotelLocation\"/></td>\n");
      out.write("        </tr>\n");
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>Room Number: </td>\n");
      out.write("            <td><input type=\"text\" name=\"roomNumber\"/></td>\n");
      out.write("        </tr>\n");
      out.write("    </table>\n");
      out.write("    <input type=\"submit\" value=\"Submit\"/>\n");
      out.write("</form>\n");

if ("POST".equalsIgnoreCase(request.getMethod())) {
    String BookingNumber = request.getParameter("BN");
    int BookingN = Integer.parseInt(BookingNumber);
    String Nrooms = request.getParameter("Nrooms");
    String Nguests = request.getParameter("Nguests");

    String startDateStr = request.getParameter("startDate");
    String endDateStr = request.getParameter("endDate");

    if (startDateStr != null) {
        startDateStr = startDateStr.replace("T", " ");
    } else {
        startDateStr = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    }

    if (endDateStr != null) {
        endDateStr = endDateStr.replace("T", " ");
    } else {
        endDateStr = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    }

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date startDate = dateFormat.parse(startDateStr);
    Date endDate = dateFormat.parse(endDateStr);


    String specialRequest = request.getParameter("specialRequest");
    String hotelName = request.getParameter("hotelName");
    String hotelLocation = request.getParameter("hotelLocation");
    String rNumber = request.getParameter("roomNumber");

    String user = "root";
    String pass = "Ken30526296@";
   

    try {
        java.sql.Connection con;
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project?autoReconnect=true&useSSL=false", user, pass);

        String checkQuery = "SELECT s.RoomNumber FROM Project.ReservationInfo r JOIN Project.Stay s ON r.BookingNumber = s.BookingNumber WHERE r.EndDate >= ?  AND s.RoomNumber = ?";
        PreparedStatement ps0 = con.prepareStatement(checkQuery);

        ps0.setTimestamp(1, new Timestamp(startDate.getTime()));
        ps0.setString(2, rNumber);
        ResultSet rs = ps0.executeQuery();

        if (rs.next()) {
            out.println("<h2 class='error-message'>Room is not available: " + rs.getString("RoomNumber") + "</h2>");
        }
        else {
            String query = "SELECT * FROM Project.ReservationInfo r JOIN Project.Stay s ON r.BookingNumber = s.BookingNumber WHERE r.BookingNumber = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, BookingN);
            rs = ps.executeQuery();

      out.write("\n");
      out.write("            <table class = 'table'>\n");
      out.write("                <thead>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Booking Number</td>\n");
      out.write("                    <td>Guest Id</td>\n");
      out.write("                    <td>Number of Rooms</td>\n");
      out.write("                    <td>Number of Guests</td>\n");
      out.write("                    <td>Start Date</td>\n");
      out.write("                    <td>End Date</td>\n");
      out.write("                    <td>Reservation Date</td>\n");
      out.write("                    <td>Booking Site</td>\n");
      out.write("                    <td>Special Request</td>\n");
      out.write("                    <td>Hotel Name</td>\n");
      out.write("                    <td>Hotel Location</td>\n");
      out.write("                    <td>Room Number</td>\n");
      out.write("                    <td>Check In</td>\n");
      out.write("                    <td>Check Out</td>\n");
      out.write("                </tr>\n");
      out.write("                </thead>\n");
      out.write("            <tbody>\n");
      out.write("            ");
 while(rs.next()) { 
      out.write("\n");
      out.write("              <tr>\n");
      out.write("                <td>");
      out.print( rs.getInt("BookingNumber") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getInt("GuestID") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString("NumberOfRooms") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString("NumberOfGuests") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( new SimpleDateFormat("yyyy-MM-dd").format(rs.getTimestamp("StartDate")) );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( new SimpleDateFormat("yyyy-MM-dd").format(rs.getTimestamp("EndDate")) );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( new SimpleDateFormat("yyyy-MM-dd").format(rs.getTimestamp("ReservationDate")));
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString("BookingSite") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString("SpecialRequest") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString("HotelName") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString("HotelLocation") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString("RoomNumber") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString("CheckIn") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString("CheckOut") );
      out.write("</td>\n");
      out.write("              </tr>\n");
      out.write("              ");
 } 
      out.write("\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
          ps.close();

            String query2 = "UPDATE Project.ReservationInfo SET";

            if (!Nrooms.isEmpty()) {
                query2 += " NumberOfRooms='" + Nrooms + "'";
            }
    
            if (!Nguests.isEmpty()) {
                if (!Nrooms.isEmpty()) {
                    query2 += ",";
                }
                query2 += " NumberOfGuests='" + Nguests + "'";
            }

            if (!startDateStr.isEmpty()) {
                if (!Nrooms.isEmpty() || !Nguests.isEmpty()) {
                    query2 += ",";
                }
                query2 += " StartDate='" + new Timestamp(startDate.getTime()) + "'";
            }

            if (!endDateStr.isEmpty()) {
                if (!Nrooms.isEmpty() || !Nguests.isEmpty() || !startDateStr.isEmpty()) {
                    query2 += ",";
                }
                query2 += " EndDate='" + new Timestamp(endDate.getTime()) + "'";
            }

            if (!specialRequest.isEmpty()) {
                if (!Nrooms.isEmpty() || !Nguests.isEmpty() || !startDateStr.isEmpty() || !endDateStr.isEmpty()) {
                    query2 += ",";
                }
                query2 += " SpecialRequest='" + specialRequest + "'";
            }

            query2 += " WHERE BookingNumber=?";
            PreparedStatement ps2 = con.prepareStatement(query2);
            ps2.setInt(1, BookingN);
            ps2.executeUpdate();

            String query3 = "UPDATE Project.Stay SET";

            if (!hotelName.isEmpty()) {
                query3 += " HotelName='" + hotelName + "'";
            }

            if (!hotelLocation.isEmpty()) {
                if (!hotelName.isEmpty()) {
                    query3 += ",";
                }
                query3 += " HotelLocation='" + hotelLocation + "'";
            }

            if (!rNumber.isEmpty()) {
                if (!hotelName.isEmpty() || !hotelLocation.isEmpty()) {
                    query3 += ",";
                }
                query3 += " RoomNumber='" + rNumber + "'";
            }
            query3 += " WHERE BookingNumber=?";
            PreparedStatement ps3 = con.prepareStatement(query3);
            ps3.setInt(1, BookingN);
            ps3.executeUpdate();
            ps3.close();

            String changeRoom = "UPDATE Project.Room SET Availability = 'Yes' WHERE RoomNumber = ?";
            PreparedStatement psc = con.prepareStatement(changeRoom);
            psc.setString(1, rNumber);
            psc.executeUpdate();
            psc.close();

            String query4 = "SELECT * FROM Project.ReservationInfo r JOIN Project.Stay s ON r.BookingNumber = s.BookingNumber WHERE r.BookingNumber = ?";
            PreparedStatement ps4 = con.prepareStatement(query4);
            ps4.setInt(1, BookingN);
            rs = ps4.executeQuery();

      out.write("\n");
      out.write("    <table class = 'table'>\n");
      out.write("        <thead>\n");
      out.write("        <tr>\n");
      out.write("            <td>Booking Number</td>\n");
      out.write("            <td>Guest Id</td>\n");
      out.write("            <td>Number of Rooms</td>\n");
      out.write("            <td>Number of Guests</td>\n");
      out.write("            <td>Start Date</td>\n");
      out.write("            <td>End Date</td>\n");
      out.write("            <td>Reservation Date</td>\n");
      out.write("            <td>Booking Site</td>\n");
      out.write("            <td>Special Request</td>\n");
      out.write("            <td>Hotel Name</td>\n");
      out.write("            <td>Hotel Location</td>\n");
      out.write("            <td>Room Number</td>\n");
      out.write("            <td>Check In</td>\n");
      out.write("            <td>Check Out</td>\n");
      out.write("        </tr>\n");
      out.write("        </thead>\n");
      out.write("    <tbody>\n");
      out.write("        ");
 while(rs.next()) { 
      out.write("\n");
      out.write("      <tr>\n");
      out.write("        <td>");
      out.print( rs.getInt("BookingNumber") );
      out.write("</td>\n");
      out.write("        <td>");
      out.print( rs.getInt("GuestID") );
      out.write("</td>\n");
      out.write("        <td>");
      out.print( rs.getString("NumberOfRooms") );
      out.write("</td>\n");
      out.write("        <td>");
      out.print( rs.getString("NumberOfGuests") );
      out.write("</td>\n");
      out.write("        <td>");
      out.print( new SimpleDateFormat("yyyy-MM-dd").format(rs.getTimestamp("StartDate")) );
      out.write("</td>\n");
      out.write("        <td>");
      out.print( new SimpleDateFormat("yyyy-MM-dd").format(rs.getTimestamp("EndDate")) );
      out.write("</td>\n");
      out.write("        <td>");
      out.print( new SimpleDateFormat("yyyy-MM-dd").format(rs.getTimestamp("ReservationDate")));
      out.write("</td>\n");
      out.write("        <td>");
      out.print( rs.getString("BookingSite") );
      out.write("</td>\n");
      out.write("        <td>");
      out.print( rs.getString("SpecialRequest") );
      out.write("</td>\n");
      out.write("        <td>");
      out.print( rs.getString("HotelName") );
      out.write("</td>\n");
      out.write("        <td>");
      out.print( rs.getString("HotelLocation") );
      out.write("</td>\n");
      out.write("        <td>");
      out.print( rs.getString("RoomNumber") );
      out.write("</td>\n");
      out.write("        <td>");
      out.print( rs.getString("CheckIn") );
      out.write("</td>\n");
      out.write("        <td>");
      out.print( rs.getString("CheckOut") );
      out.write("</td>\n");
      out.write("      </tr>\n");
      out.write("      ");
 } 
      out.write("\n");
      out.write("    </tbody>\n");
      out.write("    </table>\n");

        ps4.close();
        rs.close();
        con.close();
    }
}   catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
    }
}
    
      out.write("\n");
      out.write("        \n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
