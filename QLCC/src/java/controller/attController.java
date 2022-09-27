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
@WebServlet(name = "attController", urlPatterns = {"/loadAtt"})
public class attController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet attController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet attController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Date today = new Date();
        today = HelpTime.removeTime(today);
        int year = HelpTime.getYear(today);
        int month = HelpTime.getMonth(today);
        EmployeeDBcontex db = new EmployeeDBcontex();
        ArrayList<Employee> employees = db.getEmployees(month, year);
        AttendenceDBcontext dbA = new AttendenceDBcontext();
        ArrayList<java.sql.Date> dates = null;
        dates = HelpTime.getDates(today);
        ArrayList<Attendence> attendences = dbA.getAttendences(today);
        conventionAttendenceDBcontext cdb = new conventionAttendenceDBcontext();
        List<String> conventions = cdb.getConventionAttendence();
        request.setAttribute("convention", conventions);
        request.setAttribute("year", year);
        request.setAttribute("month", month);
        request.setAttribute("dates", dates);
        request.setAttribute("employees", employees);
        request.setAttribute("attendences", attendences);
        request.getRequestDispatcher("./View/AttendenceSheet.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
