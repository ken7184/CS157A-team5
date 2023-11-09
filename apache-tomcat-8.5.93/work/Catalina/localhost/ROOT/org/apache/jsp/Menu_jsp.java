/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.93
 * Generated at: 2023-11-09 03:44:33 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class Menu_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = null;
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
      out.write("  <head>\n");
      out.write("    <title>Home Page</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"navbar.css\"/>\n");
      out.write("    <style>\n");
      out.write("\n");
      out.write("      .welcome-message{\n");
      out.write("        font-size: 100px;\n");
      out.write("        text-align: center;\n");
      out.write("      }\n");
      out.write("    </style>\n");
      out.write("  </head>\n");
      out.write("  <script>\n");
      out.write("    window.onload = function() {\n");
      out.write("        const employeeIDon = localStorage.getItem(\"employeeID\");\n");
      out.write("        const employeeRoleon = localStorage.getItem(\"employeeRole\");\n");
      out.write("        const queryParams = \"?employeeIDon=\" + encodeURIComponent(employeeIDon) + \"&employeeRoleon=\" + encodeURIComponent(employeeRoleon);\n");
      out.write("        const targetURL = window.location.pathname + queryParams;\n");
      out.write("        if (window.location.search != queryParams) {\n");
      out.write("            window.location.href = targetURL;\n");
      out.write("        }\n");
      out.write("    };\n");
      out.write("\n");
      out.write("    function logOut(){\n");
      out.write("      localStorage.removeItem(\"employeeID\");\n");
      out.write("      localStorage.removeItem(\"username\");\n");
      out.write("      window.location.href=\"loginPage.jsp\"\n");
      out.write("    }\n");
      out.write("</script>\n");
      out.write("  <body>\n");
      out.write("    ");
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
      out.write("        ");

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
              }
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
      
      out.write("\n");
      out.write("          <h1>Manager Menu</h1>\n");
      out.write("          <form action=\"shiftPage.jsp\" method=\"post\">\n");
      out.write("          <label for=\"1. See my Shift\">1. See my Shift</label>\n");
      out.write("          <button type=\"submit\" name=\"submitBtn\" value=\"text1\">Go</button><br>\n");
      out.write("          </form>\n");
      out.write("\n");
      out.write("          <form action=\"managerShift.jsp\" method=\"post\">\n");
      out.write("          <label for=\"2. See Employees' Shift\">2. See Employees' Shift</label>\n");
      out.write("          <button type=\"submit\" name=\"submitBtn\" value=\"text1\">Go</button><br>\n");
      out.write("          </form>\n");
      out.write("          \n");
      out.write("          <form action=\"reservationInfo.jsp\" method=\"post\">\n");
      out.write("            <label for=\"3. Reservation Info\">3. See Reservation info</label>\n");
      out.write("            <button type=\"submit\" name=\"submitBtn\" value=\"text1\">Go</button><br>\n");
      out.write("          </form>\n");
      out.write("\n");
      out.write("          <form action=\"makeReservation.jsp\" method=\"post\">\n");
      out.write("            <label for=\"4. Reservation Info\">4. Make Reservation </label>\n");
      out.write("            <button type=\"submit\" name=\"submitBtn\" value=\"text1\">Go</button><br>\n");
      out.write("          </form>\n");
      out.write("\n");
      out.write("          <form action=\"billingInfo.jsp\" method=\"post\">\n");
      out.write("            <label for=\"5. Check Billing\">5. Check Billing </label>\n");
      out.write("            <button type=\"submit\" name=\"submitBtn\" value=\"text1\">Go</button><br>\n");
      out.write("          </form>\n");
      out.write("\n");
      out.write("          <form action=\"roomResponsibility.jsp\" method=\"post\">\n");
      out.write("            <label for=\"6. Check who was assigned to room\">6. Check who was assigned to room </label>\n");
      out.write("            <button type=\"submit\" name=\"submitBtn\" value=\"text1\">Go</button><br>\n");
      out.write("          </form>\n");
      out.write("          <form action=\"roomInventory.jsp\" method=\"post\">\n");
      out.write("            <label for=\"7.Room Inventory\">7. Check room inventory </label>\n");
      out.write("            <button type=\"submit\" name=\"submitBtn\" value=\"text1\">Go</button><br>\n");
      out.write("          </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("      ");

        }
        else if(roleN.equals("3")) {
      
      out.write("\n");
      out.write("          <h1>Front Desk Menu</h1>\n");
      out.write("          <form action=\"shiftPage.jsp\" method=\"post\">\n");
      out.write("          <label for=\"1. See my Shift\">1. See my Shift</label>\n");
      out.write("          <button type=\"submit\" name=\"submitBtn\" value=\"text1\">Go</button><br>\n");
      out.write("          </form>\n");
      out.write("          <form action=\"reservationInfo.jsp\" method=\"post\">\n");
      out.write("            <label for=\"2. Reservation Info\">2. See Reservation info</label>\n");
      out.write("            <button type=\"submit\" name=\"submitBtn\" value=\"text1\">Go</button><br>\n");
      out.write("          </form>\n");
      out.write("          <form action=\"makeReservation.jsp\" method=\"post\">\n");
      out.write("            <label for=\"3. Reservation Info\">3. Make Reservation </label>\n");
      out.write("            <button type=\"submit\" name=\"submitBtn\" value=\"text1\">Go</button><br>\n");
      out.write("          </form>\n");
      out.write("          <form action=\"billingInfo.jsp\" method=\"post\">\n");
      out.write("            <label for=\"4. Check Billing\">4. Check Billing </label>\n");
      out.write("            <button type=\"submit\" name=\"submitBtn\" value=\"text1\">Go</button><br>\n");
      out.write("          </form>\n");
      out.write("          <form action=\"roomResponsibility.jsp\" method=\"post\">\n");
      out.write("            <label for=\"5. Check who was assigned to room\">5. Check who was assigned to room </label>\n");
      out.write("            <button type=\"submit\" name=\"submitBtn\" value=\"text1\">Go</button><br>\n");
      out.write("          </form>\n");
      out.write("          <form action=\"roomInventory.jsp\" method=\"post\">\n");
      out.write("            <label for=\"6.Room Inventory\">6. Check room inventory </label>\n");
      out.write("            <button type=\"submit\" name=\"submitBtn\" value=\"text1\">Go</button><br>\n");
      out.write("          </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("      ");

        }
        else if(roleN.equals("2") || roleN.equals("4") || roleN.equals("5")){
      
      out.write("\n");
      out.write("          <h1>Employee Menu</h1>\n");
      out.write("          <form action=\"shiftPage.jsp\" method=\"post\">\n");
      out.write("          <label for=\"1. See my Shift\">1. See my Shift</label>\n");
      out.write("          <button type=\"submit\" name=\"submitBtn\" value=\"text1\">Go</button><br>\n");
      out.write("          </form>\n");
      out.write("      ");

        }
        else if(roleN.equals("6")) {
      
      out.write("\n");
      out.write("        <h1>Employee Menu</h1>\n");
      out.write("        <form action=\"shiftPage.jsp\" method=\"post\">\n");
      out.write("        <label for=\"1. See my Shift\">1. See my Shift</label>\n");
      out.write("        <button type=\"submit\" name=\"submitBtn\" value=\"text1\">Go</button><br>\n");
      out.write("        </form>\n");
      out.write("        <form action=\"roomInventory.jsp\" method=\"post\">\n");
      out.write("          <label for=\"2.Room Inventory\">2. Check room inventory </label>\n");
      out.write("          <button type=\"submit\" name=\"submitBtn\" value=\"text1\">Go</button><br>\n");
      out.write("        </form>\n");
      out.write("       ");
 
        }
      
      out.write("\n");
      out.write("\n");
      out.write("\n");
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
