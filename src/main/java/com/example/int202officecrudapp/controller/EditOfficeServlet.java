package com.example.int202officecrudapp.controller;

import com.example.int202officecrudapp.model.Office;
import com.example.int202officecrudapp.repository.OfficeRepository;
import com.example.int202officecrudapp.utils.Validator;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "EditOfficeServlet", value = "/edit-office")
public class EditOfficeServlet extends HttpServlet {
    private final OfficeRepository officeRepository = new OfficeRepository();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String officeCode = request.getParameter("officeCode");
        request.setAttribute("office", officeRepository.find(officeCode));
        request.getRequestDispatcher("/edit-office.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("_method");
        if ("put".equalsIgnoreCase(method)) {
            doPut(request, response);
        } else if ("delete".equalsIgnoreCase(method)) {
            doDelete(request, response);
        }
    }

    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String officeCode = request.getParameter("officeCode");
        Office officeToUpdate = officeRepository.find(officeCode);

        // Update the fields if new values have been provided, otherwise keep the existing values.
        officeToUpdate.setAddressLine1(getOrDefault(request.getParameter("addressLine1"), officeToUpdate.getAddressLine1()));
        officeToUpdate.setAddressLine2(request.getParameter("addressLine2")); // Allow clearing this field
        officeToUpdate.setCity(getOrDefault(request.getParameter("city"), officeToUpdate.getCity()));
        officeToUpdate.setState(getOrDefault(request.getParameter("state"), officeToUpdate.getState()));
        officeToUpdate.setCountry(getOrDefault(request.getParameter("country"), officeToUpdate.getCountry()));
        officeToUpdate.setPostalCode(getOrDefault(request.getParameter("postalCode"), officeToUpdate.getPostalCode()));
        officeToUpdate.setPhone(getOrDefault(request.getParameter("phone"), officeToUpdate.getPhone()));
        officeToUpdate.setTerritory(getOrDefault(request.getParameter("territory"), officeToUpdate.getTerritory()));

        officeRepository.update(officeToUpdate);
        response.sendRedirect(request.getContextPath() + "/office-list");
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // handle delete request
        String officeCode = request.getParameter("officeCode");
        Office officeToDelete = officeRepository.find(officeCode);
        officeRepository.delete(officeToDelete);
        response.sendRedirect(request.getContextPath() + "/office-list");
    }

    private String getOrDefault(String value, String defaultValue) {
        return Validator.isNullOrEmpty(value) ? defaultValue : value;
    }
}