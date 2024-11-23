package org.example.atelier1;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class Test {
    public static void main(String[] args) {

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("myentity");

        EntityManager em = emf.createEntityManager();

        em.getTransaction().begin();




    }
}
