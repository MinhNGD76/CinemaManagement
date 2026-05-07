package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

public class UserDAO extends DAO {

    public UserDAO() {
        super();
    }

    public boolean checkLogin(User user) {
        boolean isValid = false;
        String query = "SELECT * FROM tblUser WHERE username = ? AND password = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                isValid = true;
                user.setId(rs.getInt("id"));
                try {
                    user.setFullname(rs.getString("fullname"));
                } catch (Exception e) {}
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isValid;
    }

    public String getUserRole(int userId) {
        // Check if user is in tblManagementStaff
        String checkManagement = "SELECT staffId FROM tblManagementStaff WHERE staffId = ?";
        try {
            PreparedStatement ps = con.prepareStatement(checkManagement);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return "management";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return null;
    }
}