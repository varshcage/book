package com.pahana_edu.book.DAO;

import com.pahana_edu.book.model.Customer;
import com.pahana_edu.book.util.DBConnection;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {
    // SQL queries
    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO customers " +
            "(first_name, last_name, email, phone, birth_date, gender, street_address, " +
            "city, state, postal_code, country, membership_type, join_date) VALUES " +
            "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String SELECT_CUSTOMER_BY_ID = "SELECT * FROM customers WHERE customer_id = ?";
    private static final String SELECT_ALL_CUSTOMERS = "SELECT * FROM customers";
    private static final String DELETE_CUSTOMER_SQL = "DELETE FROM customers WHERE customer_id = ?";
    private static final String UPDATE_CUSTOMER_SQL = "UPDATE customers SET " +
            "first_name = ?, last_name = ?, email = ?, phone = ?, birth_date = ?, " +
            "gender = ?, street_address = ?, city = ?, state = ?, postal_code = ?, " +
            "country = ?, membership_type = ?, join_date = ? WHERE customer_id = ?";

    // Add a new customer
    public boolean addCustomer(Customer customer) {
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL)) {

            preparedStatement.setString(1, customer.getFirstName());
            preparedStatement.setString(2, customer.getLastName());
            preparedStatement.setString(3, customer.getEmail());
            preparedStatement.setString(4, customer.getPhone());

            if (customer.getBirthDate() != null) {
                preparedStatement.setDate(5, Date.valueOf(customer.getBirthDate()));
            } else {
                preparedStatement.setNull(5, Types.DATE);
            }

            preparedStatement.setString(6, customer.getGender());
            preparedStatement.setString(7, customer.getStreetAddress());
            preparedStatement.setString(8, customer.getCity());
            preparedStatement.setString(9, customer.getState());
            preparedStatement.setString(10, customer.getPostalCode());
            preparedStatement.setString(11, customer.getCountry());
            preparedStatement.setString(12, customer.getMembershipType());
            preparedStatement.setDate(13, Date.valueOf(customer.getJoinDate()));

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Other CRUD methods (get, update, delete) can be added here as needed
    // For example:
    public Customer getCustomerById(int id) {
        Customer customer = null;
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID)) {

            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                customer = new Customer();
                customer.setCustomerId(rs.getInt("customer_id"));
                customer.setFirstName(rs.getString("first_name"));
                customer.setLastName(rs.getString("last_name"));
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone"));

                Date birthDate = rs.getDate("birth_date");
                if (birthDate != null) {
                    customer.setBirthDate(birthDate.toLocalDate());
                }

                customer.setGender(rs.getString("gender"));
                customer.setStreetAddress(rs.getString("street_address"));
                customer.setCity(rs.getString("city"));
                customer.setState(rs.getString("state"));
                customer.setPostalCode(rs.getString("postal_code"));
                customer.setCountry(rs.getString("country"));
                customer.setMembershipType(rs.getString("membership_type"));

                Date joinDate = rs.getDate("join_date");
                customer.setJoinDate(joinDate.toLocalDate());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    public List<Customer> getAllCustomers() {
        List<Customer> customers = new ArrayList<>();
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMERS)) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Customer customer = new Customer();
                customer.setCustomerId(rs.getInt("customer_id"));
                customer.setFirstName(rs.getString("first_name"));
                customer.setLastName(rs.getString("last_name"));
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone"));

                Date birthDate = rs.getDate("birth_date");
                if (birthDate != null) {
                    customer.setBirthDate(birthDate.toLocalDate());
                }

                customer.setGender(rs.getString("gender"));
                customer.setStreetAddress(rs.getString("street_address"));
                customer.setCity(rs.getString("city"));
                customer.setState(rs.getString("state"));
                customer.setPostalCode(rs.getString("postal_code"));
                customer.setCountry(rs.getString("country"));
                customer.setMembershipType(rs.getString("membership_type"));

                Date joinDate = rs.getDate("join_date");
                customer.setJoinDate(joinDate.toLocalDate());

                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }
}