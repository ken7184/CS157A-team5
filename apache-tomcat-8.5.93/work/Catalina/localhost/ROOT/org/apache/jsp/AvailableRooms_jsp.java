/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.93
 * Generated at: 2023-12-01 19:22:24 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.LinkedHashMap;
import java.util.Map;

public final class AvailableRooms_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("java.util.LinkedHashMap");
    _jspx_imports_classes.add("java.util.Map");
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
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("      <title>Available Rooms</title>\n");
      out.write("      <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css\">\n");
      out.write("      <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css\">\n");
      out.write("      <link rel=\"stylesheet\" href=\"navbar.css\"/>\n");
      out.write("      <style>\n");
      out.write("          .manage-reservation{\n");
      out.write("              padding: 24px 48px 0px 48px;\n");
      out.write("          }\n");
      out.write("\n");
      out.write("          .reservation-title{\n");
      out.write("              font-size: 24px;\n");
      out.write("              font-weight: 400;\n");
      out.write("            }\n");
      out.write("      </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("      ");
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
      out.write("      <div class=\"manage-reservation\">\n");
      out.write("        <h2 class=\"reservation-title\">Available Rooms</h2>\n");
      out.write("        <hr class=\"solid\" style=\"border-top: 1px solid; opacity: 0.2;\">\n");
      out.write("        \n");
      out.write("    </div>\n");
      out.write("    ");

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
    
      out.write("\n");
      out.write("        <div class=\"dropdown\" style=\"margin-left: 48px; margin-bottom: 16px;\">\n");
      out.write("            <div class=\"dropdown-trigger\">\n");
      out.write("            <button class=\"button\" aria-haspopup=\"true\" aria-controls=\"dropdown-menu\">\n");
      out.write("                ");

                    String hotel = request.getParameter("hotel");
                    if(hotel != null && !hotel.isEmpty()) {
                        out.println("<span>" + hotel + "</span>");
                    } else {
                        out.println("<span>Select Hotel</span>");
                    }
                
      out.write("\n");
      out.write("                <span class=\"icon is-small\">\n");
      out.write("                <i class=\"fas fa-angle-down\" aria-hidden=\"true\"></i>\n");
      out.write("                </span>\n");
      out.write("            </button>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"dropdown-menu\" id=\"dropdown-menu\" role=\"menu\">\n");
      out.write("            <div class=\"dropdown-content\">\n");
      out.write("                ");

                    while(rs.next()) {
                        String hotelName = rs.getString("Name");
                        out.println("<a class='dropdown-item button is-white' href='AvailableRooms.jsp?hotel=" + hotelName + "' >" + hotelName + "</a>");
                    }
                
      out.write("\n");
      out.write("            </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        ");

            String roomTypeQuery = "SELECT DISTINCT TypeName From Room";
            ps = con.prepareStatement(roomTypeQuery);
            rs = ps.executeQuery();
        
      out.write("\n");
      out.write("        <div class=\"dropdown\" style=\"margin-left: 48px; margin-bottom: 16px;\">\n");
      out.write("            <div class=\"dropdown-trigger\">\n");
      out.write("            <button class=\"button\" aria-haspopup=\"true\" aria-controls=\"dropdown-menu\">\n");
      out.write("                ");

                    hotel = request.getParameter("hotel");
                    String type = request.getParameter("type");
                    if(type != null && !type.isEmpty()) {
                        out.println("<span>" + type + "</span>");
                    } else {
                        out.println("<span>Room Type</span>");
                    }
                
      out.write("\n");
      out.write("                <span class=\"icon is-small\">\n");
      out.write("                <i class=\"fas fa-angle-down\" aria-hidden=\"true\"></i>\n");
      out.write("                </span>\n");
      out.write("            </button>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"dropdown-menu\" id=\"dropdown-menu\" role=\"menu\">\n");
      out.write("            <div class=\"dropdown-content\">\n");
      out.write("                ");

                    while(rs.next()) {
                        String typeName = rs.getString("TypeName");
                        if (hotel != null && !hotel.trim().isEmpty()) {
                            out.println("<a class='dropdown-item button is-white' href='AvailableRooms.jsp?hotel=" + hotel + "&type=" + typeName + "' >" + typeName + "</a>");
                        }
                        else{
                            out.println("<a class='dropdown-item button is-white' href='AvailableRooms.jsp?type=" + typeName + "' >" + typeName + "</a>");
                        }
                    }
                
      out.write("\n");
      out.write("            </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("            document.addEventListener('DOMContentLoaded', () => {\n");
      out.write("                // Get all \"dropdown-trigger\" elements\n");
      out.write("                const dropdowns = document.querySelectorAll('.dropdown-trigger');\n");
      out.write("            \n");
      out.write("                // Add a click event on each of them\n");
      out.write("                dropdowns.forEach(dropdown => {\n");
      out.write("                    dropdown.addEventListener('click', () => {\n");
      out.write("                        // Toggle the class on click to show/hide the dropdown\n");
      out.write("                        dropdown.parentElement.classList.toggle('is-active');\n");
      out.write("                    });\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("            </script>\n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("    <table class=\"table is-bordered is-striped is-narrow is-hoverable is-fullwidth\" style=\"width: 90%; margin-left: 48px;\">\n");
      out.write("            <thead>\n");
      out.write("                <th>Hotel Name</th>\n");
      out.write("                <th>Hotel Location</th>\n");
      out.write("                <th>Room Number</th>\n");
      out.write("                <th>Price</th>\n");
      out.write("                <th>Availability</th>\n");
      out.write("                <th>Type</th>\n");
      out.write("                <th>Beds</th>\n");
      out.write("                <th>Breakfast</th>\n");
      out.write("            </thead>\n");
      out.write("            <tbody>\n");
      out.write("    ");
 
        while(rs.next()) {
    
      out.write("\n");
      out.write("            <tr>\n");
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
      out.print( rs.getInt("Price") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString("Availability") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString("TypeName") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString("Beds") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString("hasBreakfast") );
      out.write("</td>\n");
      out.write("            </tr>\n");
      out.write("        ");

        }       
            rs.close();
            ps.close();
            con.close();
        }
     catch (SQLException | ClassNotFoundException e) {
        out.println("Exception caught: " + e.getMessage());
    }
    
      out.write("\n");
      out.write("  </body>\n");
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
