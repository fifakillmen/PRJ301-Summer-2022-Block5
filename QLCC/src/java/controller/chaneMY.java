/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import TimeHelper.HelpTime;
import dal.AttendenceDBcontext;
import dal.EmployeeDBcontex;
import dal.conventionAttendenceDBcontext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Attendence;
import model.Employee;

/**
 *
 * @author fifak
 */
@WebServlet(name = "chaneMY", urlPatterns = {"/chaneMY"})
public class chaneMY extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int year = 0;

        int month = 0;

        try {
            year = Integer.parseInt(request.getParameter("year"));
            month = Integer.parseInt(request.getParameter("month"));
        } catch (Exception e) {
        }
        EmployeeDBcontex db = new EmployeeDBcontex();
        ArrayList<Employee> employees = db.getEmployees(month, year);
        ArrayList<java.sql.Date> dates = HelpTime.getDatesWithMonthYear(month, year);
        request.setAttribute("dates", dates);
        request.setAttribute("employees", employees);

        if (request.getAttribute("REFRESH") != null) {
            request.getRequestDispatcher("./View/AttendenceSheet.jsp")
                    .forward(request, response);
        } else {
            response.sendRedirect("../loadAtt");

        }

    }

}
