package org.example.atelier1.dao;




import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import org.example.atelier1.entities.Client;
import org.example.atelier1.entities.Commande;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@ApplicationScoped
@Transactional
public class CommandeDAO implements CommandeRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Commande trouverById(Long id) {
        return entityManager.find(Commande.class, id);
    }

    @Override
    public void ajouterCommande(Commande commande) {
        entityManager.persist(commande);
    }

    @Override
    public void modifierCommande(Commande commande) {
        entityManager.merge(commande);
    }

    @Override
    public void supprimerCommande(Long id) {
        Commande commande = trouverById(id);
        if (commande != null) {
            entityManager.remove(commande);
        }
    }

    @Override
    public List<Commande> trouverTous() {
        return entityManager.createQuery("SELECT c FROM Commande c", Commande.class).getResultList();
    }
}