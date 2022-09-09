/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TimeHelper;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author fifak
 */
public class HelpTime {

    public static int getDayOfMonth(Date datetime) {
        LocalDate localDate = datetime.toInstant()
                .atZone(ZoneId.systemDefault())
                .toLocalDate();
        return localDate.getDayOfMonth();
    }

    public static Timestamp getTimeStamp(Date date) {
        return new Timestamp(date.getTime());
    }

    public static int getDayOfWeek(java.sql.Date datetime) {
        Date date = convertSqlDateToJavaDate(datetime);
        LocalDate localDate = date.toInstant()
                .atZone(ZoneId.systemDefault())
                .toLocalDate();
        return localDate.getDayOfWeek().getValue();
    }

    public static Date addDays(Date d, int days) {
        Calendar c = Calendar.getInstance();
        c.setTime(d);
        c.add(Calendar.DATE, days);
        Date newdate = c.getTime();
        return newdate;
    }

    public static Date addMonths(Date d, int months) {
        Calendar c = Calendar.getInstance();
        c.setTime(d);
        c.add(Calendar.MONTH, months);
        Date newdate = c.getTime();
        return newdate;
    }

    public static Date removeTime(Date d) {
        Calendar c = Calendar.getInstance();
        c.setTime(d);
        c.set(Calendar.HOUR_OF_DAY, 0);
        c.set(Calendar.MINUTE, 0);
        c.set(Calendar.SECOND, 0);
        c.set(Calendar.MILLISECOND, 0);
        Date newdate = c.getTime();
        return newdate;
    }

    public static ArrayList<java.sql.Date> getDates(Date date) {
        ArrayList<java.sql.Date> dates = new ArrayList<>();
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.HOUR, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        cal.set(Calendar.DAY_OF_MONTH, 1);

        int myMonth = cal.get(Calendar.MONTH);

        while (myMonth == cal.get(Calendar.MONTH)) {
            dates.add(convertJavaDateToSqlDate(cal.getTime()));
            cal.add(Calendar.DAY_OF_MONTH, 1);
        }

        return dates;
    }

    public static Date getDateFrom(Timestamp ts) {
        return new Date(ts.getTime());
    }

    public static int getYear(Date d) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(d);
        int year = cal.get(Calendar.YEAR);
        return year;
    }

    public static int getMonth(Date d) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(d);
        int month = cal.get(Calendar.MONTH);
        return month;
    }

    public static java.sql.Date convertJavaDateToSqlDate(java.util.Date date) {
        return new java.sql.Date(date.getTime());
    }

    public static Date convertSqlDateToJavaDate(java.util.Date sqlDate) {
        java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
        return utilDate;
    }

    public static Date getDayoflastmonth(Date date) {
        LocalDate localDate = date.toInstant()
                .atZone(ZoneId.systemDefault())
                .toLocalDate();
        localDate = localDate.minusMonths(1);
        java.util.Date d = null;
        try {
            d = new SimpleDateFormat("yyyy-MM-dd").parse(localDate.toString());
        } catch (ParseException ex) {
            Logger.getLogger(HelpTime.class.getName()).log(Level.SEVERE, null, ex);
        }
        return d;
    }

}
