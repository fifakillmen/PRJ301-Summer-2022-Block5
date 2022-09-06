/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import TimeHelper.HelpTime;
import dal.AttendenceDBcontext;
import dal.EmployeeDBcontex;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Attendence;
import model.Employee;

import java.io.IOException;
import java.text.ParseException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author fifak
 */
public class attendenceControleer extends HttpServlet {

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

        //int month = 7;
        ArrayList<java.sql.Date> dates = null;
        EmployeeDBcontex db = new EmployeeDBcontex();
        ArrayList<Employee> employees = db.getEmployees(7, 2022);
        int size = employees.size();
        AttendenceDBcontext dbA = new AttendenceDBcontext();
        ArrayList<Attendence> attendences = null;
        try {
            today = HelpTime.getDayoflastmonth(today);
            dates = HelpTime.getDates(HelpTime.getDayoflastmonth(today));
            attendences = dbA.getAttendences(HelpTime.getDayoflastmonth(today));
            //month=HelpTime.getMonth(HelpTime.);
            //int size = attendences.size();
        } catch (ParseException ex) {
            Logger.getLogger(attendenceControleer.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("dates", dates);
        request.setAttribute("employees", employees);
        request.setAttribute("attendences", attendences);
        request.getRequestDispatcher("View/AttendenceSheet.jsp").forward(request, response);
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
        // processRequest(request, response);
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
