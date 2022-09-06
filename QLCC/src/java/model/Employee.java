/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author fifak
 */
public class Employee {

    private String Erollnumber;
    private String fullname;
    
    private ArrayList<Attendence> attendences = new ArrayList<>();

    public Employee() {
    }

    public Employee(String Erollnumber, String fullname) {
        this.Erollnumber = Erollnumber;
        this.fullname = fullname;
    }

    public String getErollnumber() {
        return Erollnumber;
    }

    public void setErollnumber(String Erollnumber) {
        this.Erollnumber = Erollnumber;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public ArrayList<Attendence> getAttendences() {
        return attendences;
    }

    public void setAttendences(ArrayList<Attendence> attendences) {
        this.attendences = attendences;
    }

    

   

}
