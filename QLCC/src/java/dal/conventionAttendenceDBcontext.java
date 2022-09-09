/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author fifak
 */
public class conventionAttendenceDBcontext extends DBcontext {

    public List<String> getConventionAttendence() {
        List<String> allConvention = new ArrayList<>();
        allConvention = null;
        try {
            String sql = "Select conventionRoll,[name],amountWork,BHXH from conventionAttendence";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                if (!rs.getString("conventionRoll").isEmpty()) {
                    allConvention.add(rs.getString("conventionRoll"));
                }
            }
            return allConvention;
        } catch (SQLException ex) {
            Logger.getLogger(conventionAttendenceDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
