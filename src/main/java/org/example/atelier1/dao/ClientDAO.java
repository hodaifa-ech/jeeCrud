package org.example.atelier1.dao;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import org.example.atelier1.entities.Client;


import java.util.List;



@ApplicationScoped
@Transactional
public class ClientDAO implements ClientRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Client trouverById(Long id) {
        return entityManager.find(Client.class, id);
    }

    @Override
    public void ajouterClient(Client client) {
        entityManager.persist(client);
    }

    @Override
    public void modifierClient(Client client) {
        entityManager.merge(client);
    }

    @Override
    public void supprimerClient(Long id) {
        Client client = trouverById(id);
        if (client != null) {
            entityManager.remove(client);
        }
    }

    @Override
    public List<Client> trouverTous() {
        return entityManager.createQuery("SELECT c FROM Client c", Client.class).getResultList();
    }
}