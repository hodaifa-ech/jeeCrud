package org.example.atelier1.controller;


import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.atelier1.entities.Commande;
import org.example.atelier1.entities.LigneDeCommande;
import org.example.atelier1.entities.Produit;
import org.example.atelier1.service.CommandeService;
import org.example.atelier1.service.LigneDeCommandeService;
import org.example.atelier1.service.ProduitService;

import java.io.IOException;
import java.util.List;

@WebServlet("/lignes-de-commande")
public class LigneDeCommandeServlet extends HttpServlet {

    @Inject
    private LigneDeCommandeService ligneDeCommandeService;

    @Inject
    private CommandeService commandeService;

    @Inject
    private ProduitService produitService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        try {
            if ("list".equals(action)) {
                listLignesDeCommande(req, resp);
            } else if ("edit".equals(action)) {
                editLigneDeCommande(req, resp);
            } else {
                showAddLigneDeCommandeForm(req, resp);
            }
        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        try {
            if ("add".equals(action)) {
                addLigneDeCommande(req, resp);
            } else if ("update".equals(action)) {
                updateLigneDeCommande(req, resp);
            } else if ("delete".equals(action)) {
                deleteLigneDeCommande(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action");
            }
        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
        }
    }

    private void listLignesDeCommande(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<LigneDeCommande> lignesDeCommande = ligneDeCommandeService.getAllLignesDeCommande();
        req.setAttribute("lignesDeCommande", lignesDeCommande);
        req.getRequestDispatcher("/WEB-INF/views/lignes-de-commande.jsp").forward(req, resp);
    }

    private void editLigneDeCommande(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");

        if (idParam != null) {
            Long id = Long.valueOf(idParam);
            LigneDeCommande ligneDeCommande = ligneDeCommandeService.getLigneDeCommandeById(id);

            if (ligneDeCommande != null) {
                List<Commande> commandes = commandeService.getAllCommandes();
                List<Produit> produits = produitService.getAllProduits();

                req.setAttribute("ligneDeCommande", ligneDeCommande);
                req.setAttribute("commandes", commandes);
                req.setAttribute("produits", produits);

                req.getRequestDispatcher("/WEB-INF/views/edit-ligne-de-commande.jsp").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Ligne de commande not found");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing ID");
        }
    }

    private void showAddLigneDeCommandeForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Commande> commandes = commandeService.getAllCommandes();
        List<Produit> produits = produitService.getAllProduits();
        req.setAttribute("commandes", commandes);
        req.setAttribute("produits", produits);
        req.getRequestDispatcher("/WEB-INF/views/add-ligne-de-commande.jsp").forward(req, resp);
    }

    private void addLigneDeCommande(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long commandeId = Long.valueOf(req.getParameter("commandeId"));
        Long produitId = Long.valueOf(req.getParameter("produitId"));
        int quantite = Integer.parseInt(req.getParameter("quantite"));

        Commande commande = commandeService.getCommandeById(commandeId);
        Produit produit = produitService.getProduitById(produitId);

        if (commande == null || produit == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Commande or Produit ID");
            return;
        }

        LigneDeCommande ligneDeCommande = new LigneDeCommande();
        ligneDeCommande.setCommande(commande);
        ligneDeCommande.setProduit(produit);
        ligneDeCommande.setQuantite(quantite);

        ligneDeCommandeService.saveLigneDeCommande(ligneDeCommande);

        resp.sendRedirect("lignes-de-commande?action=list");
    }

    private void updateLigneDeCommande(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.valueOf(req.getParameter("id"));
        Long commandeId = Long.valueOf(req.getParameter("commandeId"));
        Long produitId = Long.valueOf(req.getParameter("produitId"));
        int quantite = Integer.parseInt(req.getParameter("quantite"));

        Commande commande = commandeService.getCommandeById(commandeId);
        Produit produit = produitService.getProduitById(produitId);

        if (commande == null || produit == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Commande or Produit ID");
            return;
        }

        LigneDeCommande ligneDeCommande = ligneDeCommandeService.getLigneDeCommandeById(id);

        if (ligneDeCommande != null) {
            ligneDeCommande.setCommande(commande);
            ligneDeCommande.setProduit(produit);
            ligneDeCommande.setQuantite(quantite);

            ligneDeCommandeService.updateLigneDeCommande(ligneDeCommande);

            resp.sendRedirect("lignes-de-commande?action=list");
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Ligne de commande not found");
        }
    }

    private void deleteLigneDeCommande(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.valueOf(req.getParameter("id"));

        ligneDeCommandeService.deleteLigneDeCommande(id);

        resp.sendRedirect("lignes-de-commande?action=list");
    }
}
