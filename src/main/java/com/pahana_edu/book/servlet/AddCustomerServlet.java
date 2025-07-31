package com.pahana_edu.book.servlet;

import com.pahana_edu.book.model.Customer;
import com.pahana_edu.book.DAO.CustomerDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "AddCustomerServlet", value = "/AddCustomerServlet")
public class AddCustomerServlet extends HttpServlet {
    private CustomerDAO customerDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        customerDAO = new CustomerDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        LocalDate birthDate = null;
        if (request.getParameter("birthDate") != null && !request.getParameter("birthDate").isEmpty()) {
            birthDate = LocalDate.parse(request.getParameter("birthDate"));
        }

        String gender = request.getParameter("gender");
        String streetAddress = request.getParameter("streetAddress");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String postalCode = request.getParameter("postalCode");
        String country = request.getParameter("country");
        String membershipType = request.getParameter("membershipType");

        LocalDate joinDate = LocalDate.now();
        if (request.getParameter("joinDate") != null && !request.getParameter("joinDate").isEmpty()) {
            joinDate = LocalDate.parse(request.getParameter("joinDate"));
        }

        // Create customer object
        Customer customer = new Customer(
                firstName,
                lastName,
                email,
                phone,
                birthDate,
                gender,
                streetAddress,
                city,
                state,
                postalCode,
                country,
                membershipType,
                joinDate
        );

        // Add customer to database
        boolean success = customerDAO.addCustomer(customer);

        // Set response message
        if (success) {
            request.setAttribute("success", "Customer added successfully!");
        } else {
            request.setAttribute("error", "Failed to add customer. Please try again.");
        }

        // Forward back to the form page
        RequestDispatcher dispatcher = request.getRequestDispatcher("AddCustomer.jsp");
        dispatcher.forward(request, response);
    }
}