package com.example.int202officecrudapp.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "offices")
@Getter
@Setter
@NamedQueries({
        @NamedQuery(name = "Office.FindAll", query = "select o from Office o"),
        @NamedQuery(name = "Office.FindByCityOrCountry", query = "SELECT o FROM Office o WHERE o.city LIKE :cityParam OR o.country LIKE :countryParam")
})
public class Office {
    @Id
    private String officeCode;
    private String addressLine1;
    private String addressLine2;
    private String city;
    private String state;
    private String country;
    private String postalCode;
    private String phone;
    private String territory;
    @OneToMany(mappedBy = "officeCode")
    private List<Employee> employeeList;
}