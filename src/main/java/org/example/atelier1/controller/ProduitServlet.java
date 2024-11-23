package org.example.atelier1.controller;

import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.atelier1.entities.Produit;
import org.example.atelier1.service.ProduitService;

import java.io.IOException;
import java.util.List;



@WebServlet("/produits")
public class ProduitServlet extends HttpServlet {

    @Inject
    private ProduitService produitService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        try {
            if ("list".equals(action)) {
                listProduits(req, resp);
            } else if ("edit".equals(action)) {
                editProduit(req, resp);
            } else {
                showAddProduitForm(req, resp);
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
                addProduit(req, resp);
            } else if ("update".equals(action)) {
                updateProduit(req, resp);
            } else if ("delete".equals(action)) {
                deleteProduit(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action");
            }
        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
        }
    }

    private void listProduits(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Produit> produits = produitService.getAllProduits();
        req.setAttribute("produits", produits);
        req.getRequestDispatcher("/WEB-INF/views/produits.jsp").forward(req, resp);
    }

    private void editProduit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");

        if (idParam != null) {
            Long id = Long.valueOf(idParam);
            Produit produit = produitService.getProduitById(id);

            if (produit != null) {
                req.setAttribute("produit", produit);
                req.getRequestDispatcher("/WEB-INF/views/edit-produit.jsp").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Produit not found");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing ID");
        }
    }

    private void showAddProduitForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/add-produit.jsp").forward(req, resp);
    }

    private void addProduit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String nom = req.getParameter("nom");
        double prix = Double.parseDouble(req.getParameter("prix"));

        Produit produit = new Produit();
        produit.setNom(nom);
        produit.setPrix(prix);

        produitService.saveProduit(produit);

        resp.sendRedirect("produits?action=list");
    }

    private void updateProduit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.valueOf(req.getParameter("id"));
        String nom = req.getParameter("nom");
        double prix = Double.parseDouble(req.getParameter("prix"));

        Produit produit = new Produit();
        produit.setId(id);
        produit.setNom(nom);
        produit.setPrix(prix);

        produitService.updateProduit(produit);

        resp.sendRedirect("produits?action=list");
    }

    private void deleteProduit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.valueOf(req.getParameter("id"));

        produitService.deleteProduit(id);

        resp.sendRedirect("produits?action=list");
    }
}