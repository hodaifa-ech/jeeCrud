package org.example.atelier1.dao;


import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import org.example.atelier1.entities.LigneDeCommande;

import java.util.List;

@ApplicationScoped
@Transactional
public class LigneDeCommandeDAO implements LigneDeCommandeRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public LigneDeCommande trouverById(Long id) {
        return entityManager.find(LigneDeCommande.class, id);
    }

    @Override
    public void ajouterLigneDeCommande(LigneDeCommande ligneDeCommande) {
        entityManager.persist(ligneDeCommande);
    }

    @Override
    public void modifierLigneDeCommande(LigneDeCommande ligneDeCommande) {
        entityManager.merge(ligneDeCommande);
    }

    @Override
    public void supprimerLigneDeCommande(Long id) {
        LigneDeCommande ligneDeCommande = trouverById(id);
        if (ligneDeCommande != null) {
            entityManager.remove(ligneDeCommande);
        }
    }

    @Override
    public List<LigneDeCommande> trouverTous() {
        return entityManager.createQuery("SELECT l FROM LigneDeCommande l", LigneDeCommande.class).getResultList();
    }
}