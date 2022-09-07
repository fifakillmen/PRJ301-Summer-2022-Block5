/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author fifak
 */
public class Attendence {

    private int attendId;
    private Employee employee;
    private java.sql.Date day;
    private String conventionRoll;
    private float amount_work;

    public Attendence() {
    }

    public Attendence(int attendId, Employee employee, Date day, String conventionRoll, float amount_work) {
        this.attendId = attendId;
        this.employee = employee;
        this.day = day;
        this.conventionRoll = conventionRoll;
        this.amount_work = amount_work;
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

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public String getConventionRoll() {
        return conventionRoll;
    }

    public void setConventionRoll(String conventionRoll) {
        this.conventionRoll = conventionRoll;
    }

    public float getAmount_work() {
        return amount_work;
    }

    public void setAmount_work(float amount_work) {
        this.amount_work = amount_work;
    }

}
