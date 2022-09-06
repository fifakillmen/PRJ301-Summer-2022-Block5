/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import TimeHelper.HelpTime;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import model.Attendence;
import model.Employee;

public class AttendenceDBcontext extends DBcontext {

    public ArrayList<Attendence> getAttendences(Date date) {
        ArrayList<Attendence> attendences = new ArrayList<>();
        try {
            String sql = "select a.Erollnumber,e.fullname, a.day,a.conventionRoll from attendence a\n"
                    + "                     join (select fullname,Erollnumber from Employee) e \n"
                    + "                     on a.Erollnumber=e.Erollnumber\n"
                    + "                     where MONTH(a.day)= ? "
                    + "                     and YEAR(a.day)= ? ";

            PreparedStatement stm = connection.prepareStatement(sql);
            int month=HelpTime.getMonth(date);
            int year=HelpTime.getYear(date);
            stm.setInt(1, month);
            stm.setInt(2, year);
            ResultSet rs = stm.executeQuery();
            int count = 0;
            while (rs.next()) {
                Attendence a = new Attendence();
                Employee e = new Employee();
                a.setAttendId(count);
                a.setConventionRoll(rs.getString("conventionRoll"));
                a.setDay(rs.getDate("day"));
                e.setErollnumber(rs.getString("Erollnumber"));
                e.setFullname(rs.getString("fullname"));
                a.setEmployee(e);
                attendences.add(a);
                count++;
            }
        } catch (SQLException e) {
            System.out.println("ngu vcl ra sai o att dbcontex");
        }
        return attendences;
    }
}
