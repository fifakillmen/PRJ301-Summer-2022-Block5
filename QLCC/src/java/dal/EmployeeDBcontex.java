/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Attendence;
import model.Employee;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author fifak
 */
public class EmployeeDBcontex extends DBcontext {
    
    public ArrayList<model.Employee> getEmployees(int month,int year) {
        ArrayList<model.Employee> employees = new ArrayList<>();
        
        try {
            String sql = "select e.Erollnumber,e.fullname,a.day,a.conventionRoll,a.attendId\n"
                    + "from Employee e\n"
                    + "left join (select * from [attendence]  \n"
                    + "where MONTH(day)=? and YEAR(day)=?) a \n"
                    + "on e.Erollnumber=a.Erollnumber";
            PreparedStatement stm = connection.prepareStatement(sql);
            
             stm.setInt(1, month);
             stm.setInt(2, year);
            ResultSet rs = stm.executeQuery();
            Employee curEmp = new Employee();
            curEmp.setErollnumber("");
            while (rs.next()) {
                String Erollnumber = rs.getString("Erollnumber");
                if (!Erollnumber.equalsIgnoreCase(curEmp.getErollnumber())) {
                    curEmp = new Employee();
                    curEmp.setErollnumber(Erollnumber);
                    curEmp.setFullname(rs.getString("fullname"));                    
                    employees.add(curEmp);
                }
                int attendId = rs.getInt("attendId");
                if (attendId != -1) {
                    Attendence t = new Attendence();
                    t.setEmployee(curEmp);
                    t.setAttendId(attendId);
                    t.setDay(rs.getDate("day"));
                    t.setConventionRoll(rs.getString("conventionRoll"));
                    curEmp.getAttendences().add(t);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return employees;
    }
    
}
