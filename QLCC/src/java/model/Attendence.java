/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author fifak
 */
public class Attendence {

    private int attendId;
    private Employee employee;
    private java.sql.Date day;
    private String conventionRoll;

    public Attendence() {
    }

    public Attendence(int attendId, Employee employee, java.sql.Date day, String conventionRoll) {
        this.attendId = attendId;
        this.employee = employee;
        this.day = day;
        this.conventionRoll = conventionRoll;
    }

    public int getAttendId() {
        return attendId;
    }

    public void setAttendId(int attendId) {
        this.attendId = attendId;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public java.sql.Date getDay() {
        return day;
    }

    public void setDay(java.sql.Date day) {
        this.day = day;
    }

    public String getConventionRoll() {
        return conventionRoll;
    }

    public void setConventionRoll(String conventionRoll) {
        this.conventionRoll = conventionRoll;
    }

}
