package com.pahana_edu.book.DAO;

import com.pahana_edu.book.model.User;
import com.pahana_edu.book.util.DBConnection;

import java.sql.*;
public class UserDAO {
    public User authenticate(String username, String password, String role) {
        User user = null;
        String sql = "SELECT * FROM users WHERE username=? AND password=? AND role=?";

        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, role);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                user = new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("role")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
}
