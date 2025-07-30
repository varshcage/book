package com.pahana_edu.book.DAO;

import com.pahana_edu.book.model.Customer;
import com.pahana_edu.book.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
public class CustomerDAO {
    public boolean addCustomer(Customer customer) {
        String sql = "INSERT INTO customers (first_name, last_name, email, phone, gender, birth_date, join_date, " +
                "street_address, city, state, postal_code, country, membership_type) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, customer.getFirstName());
            stmt.setString(2, customer.getLastName());
            stmt.setString(3, customer.getEmail());
            stmt.setString(4, customer.getPhone());
            stmt.setString(5, customer.getGender());

            java.sql.Date birthDate = customer.getBirthDate() != null
                    ? new java.sql.Date(customer.getBirthDate().getTime()) : null;
            stmt.setDate(6, birthDate);

            java.sql.Date joinDate = new java.sql.Date(customer.getJoinDate().getTime());
            stmt.setDate(7, joinDate);

            stmt.setString(8, customer.getStreetAddress());
            stmt.setString(9, customer.getCity());
            stmt.setString(10, customer.getState());
            stmt.setString(11, customer.getPostalCode());
            stmt.setString(12, customer.getCountry());
            stmt.setString(13, customer.getMembershipType());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}
