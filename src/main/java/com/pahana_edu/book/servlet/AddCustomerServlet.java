package com.pahana_edu.book.servlet;

import com.pahana_edu.book.DAO.CustomerDAO;
import com.pahana_edu.book.model.Customer;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/AddCustomerServlet")
public class AddCustomerServlet extends HttpServlet{
    protected void doPost (HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
         try{
             request.setCharacterEncoding("UTF-8");
             // Get form data
             String firstName = request.getParameter("firstName");
             String lastName = request.getParameter("lastName");
             String email = request.getParameter("email");
             String phone = request.getParameter("phone");
             String gender = request.getParameter("gender");

             String birthDateStr = request.getParameter("birthDate");
             String joinDateStr = request.getParameter("joinDate");

             String streetAddress = request.getParameter("streetAddress");
             String city = request.getParameter("city");
             String state = request.getParameter("state");
             String postalCode = request.getParameter("postalCode");
             String country = request.getParameter("country");

             String membershipType = request.getParameter("membershipType");

             // Parse dates
             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             Date birthDate = birthDateStr != null && !birthDateStr.isEmpty() ? sdf.parse(birthDateStr) : null;
             Date joinDate = sdf.parse(joinDateStr);

             // Create Customer object
             Customer customer = new Customer(
                     firstName, lastName, email, phone, gender,
                     birthDate, joinDate, streetAddress, city,
                     state, postalCode, country, membershipType
             );

             // DAO operation
             CustomerDAO dao = new CustomerDAO();
             boolean isSaved = dao.addCustomer(customer);

             if (isSaved) {
                 request.setAttribute("success", "Customer added successfully!");
             } else {
                 request.setAttribute("error", "Error saving customer to database.");
             }

         } catch (Exception e) {
             e.printStackTrace();
             request.setAttribute("error", "Something went wrong: " + e.getMessage());
         }

        request.getRequestDispatcher("add-customer.jsp").forward(request, response);

         }
}

