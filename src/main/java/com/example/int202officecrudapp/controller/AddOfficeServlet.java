package com.example.int202officecrudapp.controller;

import com.example.int202officecrudapp.model.Office;
import com.example.int202officecrudapp.repository.OfficeRepository;
import com.example.int202officecrudapp.utils.Validator;
import jakarta.persistence.PersistenceException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Map;

@WebServlet(name = "AddOfficeServlet", value = "/add-office")
public class AddOfficeServlet extends HttpServlet {
    private final OfficeRepository officeRepository = new OfficeRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("add-office.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Capture the form data
        String officeCode = request.getParameter("officeCode");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String territory = request.getParameter("territory");
        String postalCode = request.getParameter("postalCode");
        String country = request.getParameter("country");
        String phone = request.getParameter("phone");
        String addressLine1 = request.getParameter("addressLine1");
        String addressLine2 = request.getParameter("addressLine2");

        // validate data
        if (Validator.isNullOrEmpty(officeCode) ||
                Validator.isNullOrEmpty(city) ||
                Validator.isNullOrEmpty(territory) ||
                Validator.isNullOrEmpty(postalCode) ||
                Validator.isNullOrEmpty(country) ||
                Validator.isNullOrEmpty(phone) ||
                Validator.isNullOrEmpty(addressLine1)) {
            // Set error message and send back to form
            request.setAttribute("errorMessage", "Please fill in all required fields.");
            request.getRequestDispatcher("add-office.jsp").forward(request, response);
            return;
        }

        // If validation passes, create the office object
        Office office = new Office();
        office.setOfficeCode(officeCode);
        office.setCity(city);
        office.setState(state);
        office.setTerritory(territory);
        office.setPostalCode(postalCode);
        office.setCountry(country);
        office.setPhone(phone);
        office.setAddressLine1(addressLine1);
        office.setAddressLine2(addressLine2);

        try {
            // Persist office using the repository
            officeRepository.create(office);
            // Redirect to a success page or back to the form with a success message
            response.sendRedirect("office-list"); // assuming you have a success.jsp page
        } catch (PersistenceException e) {
            // Handle the exception, for instance, by setting an error message and forwarding to an error page
            request.setAttribute("errorMessage", "Error occurred while adding the office: " + e.getMessage());
            request.getRequestDispatcher("add-office.jsp").forward(request, response);
        }
    }
}

