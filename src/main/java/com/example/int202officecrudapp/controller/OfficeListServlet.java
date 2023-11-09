package com.example.int202officecrudapp.controller;

import com.example.int202officecrudapp.model.Office;
import com.example.int202officecrudapp.repository.OfficeRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "OfficeListServlet", value = "/office-list")
public class OfficeListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OfficeRepository officeRepository = new OfficeRepository();
        String cityOrCountry = request.getParameter("cityOrCountry");
        List<Office> offices = cityOrCountry != null && !cityOrCountry.trim().isEmpty() ?
                officeRepository.findByCountryOrCity(cityOrCountry) :
                officeRepository.findAll();
        request.setAttribute("cityOrCountry", cityOrCountry);
        request.setAttribute("offices", offices);
        request.getRequestDispatcher("/office-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}