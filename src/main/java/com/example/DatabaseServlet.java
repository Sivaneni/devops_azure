package com.example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DatabaseServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><head><title>User Data</title></head><body>");
        out.println("<h1>User Information</h1>");
        out.println("<table border='1'><tr><th>Name</th><th>Email</th></tr>");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://my-mysql-container:3306/mydatabase", "myuser",
                    "Password@123");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT name, email FROM users");
            while (rs.next()) {
                out.println("<tr><td>" + rs.getString("name") + "</td><td>" + rs.getString("email") + "</td></tr>");
            }
            con.close();
        } catch (Exception e) {
            out.println("<tr><td colspan='2'>Error: " + e.getMessage() + "</td></tr>");
        }
        out.println("</table>");
        out.println("</body></html>");
    }
}
