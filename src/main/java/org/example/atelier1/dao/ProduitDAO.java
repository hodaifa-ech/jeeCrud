package org.example.atelier1.dao;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import org.example.atelier1.entities.Produit;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@ApplicationScoped
@Transactional
public class ProduitDAO implements ProduitRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Produit trouverById(Long id) {
        return entityManager.find(Produit.class, id);
    }

    @Override
    public void ajouterProduit(Produit produit) {
        entityManager.persist(produit);
    }

    @Override
    public void modifierProduit(Produit produit) {
        entityManager.merge(produit);
    }

    @Override
    public void supprimerProduit(Long id) {
        Produit produit = trouverById(id);
        if (produit != null) {
            entityManager.remove(produit);
        }
    }

    @Override
    public List<Produit> trouverTous() {
        return entityManager.createQuery("SELECT p FROM Produit p", Produit.class).getResultList();
    }
}