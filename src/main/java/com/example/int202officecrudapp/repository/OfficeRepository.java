package com.example.int202officecrudapp.repository;

import com.example.int202officecrudapp.model.Office;
import com.example.int202officecrudapp.utils.EntityManagerBuilder;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceException;

import java.util.Collections;
import java.util.List;

public class OfficeRepository {

    private EntityManager getEntityManager() {
        return EntityManagerBuilder.getEntityManager();
    }

    public List<Office> findAll() {
        EntityManager em = getEntityManager();
        try {
            return em.createNamedQuery("Office.FindAll", Office.class).getResultList();
        } finally {
            em.close();
        }
    }

    public Office find(String officeCode) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Office.class, officeCode);
        } finally {
            em.close();
        }
    }

    public List<Office> findByCountryOrCity(String cityOrCountry) {
        EntityManager em = getEntityManager();
        try {
            List<Office> offices = em.createNamedQuery("Office.FindByCityOrCountry", Office.class)
                    .setParameter("cityParam", "%" + cityOrCountry + "%")
                    .setParameter("countryParam", "%" + cityOrCountry + "%")
                    .getResultList();
            if (offices.isEmpty()) {
                return Collections.emptyList();
            }
            return offices;
        } finally {
            em.close();
        }
    }

    public void create(Office office) throws PersistenceException {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(office);
            em.getTransaction().commit();
        } catch (PersistenceException e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }

    public void delete(Office office) throws IllegalArgumentException, PersistenceException {
        if (office.getOfficeCode() == null) {
            throw new IllegalArgumentException("Office cannot be updated with null officeCode");
        }

        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            em.remove(em.merge(office));
            em.getTransaction().commit();
        } catch (PersistenceException e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }

    public void update(Office office) throws IllegalArgumentException, PersistenceException {
        if (office.getOfficeCode() == null) {
            throw new IllegalArgumentException("Office cannot be updated with null officeCode");
        }

        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(office);
            em.getTransaction().commit();
        } catch (PersistenceException e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }
}