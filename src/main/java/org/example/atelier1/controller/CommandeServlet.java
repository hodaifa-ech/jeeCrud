package org.example.atelier1.controller;


import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.atelier1.entities.Client;
import org.example.atelier1.entities.Commande;
import org.example.atelier1.service.ClientService;
import org.example.atelier1.service.CommandeService;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/commandes")
public class CommandeServlet extends HttpServlet {

    @Inject
    private CommandeService commandeService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        try {
            if ("list".equals(action)) {
                listCommandes(req, resp);
            } else if ("edit".equals(action)) {
                editCommande(req, resp);
            } else {
                showAddCommandeForm(req, resp);
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
                addCommande(req, resp);
            } else if ("update".equals(action)) {
                updateCommande(req, resp);
            } else if ("delete".equals(action)) {
                deleteCommande(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action");
            }
        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
        }
    }

    private void listCommandes(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Commande> commandes = commandeService.getAllCommandes();
        req.setAttribute("commandes", commandes);
        req.getRequestDispatcher("/WEB-INF/views/commandes.jsp").forward(req, resp);
    }

    private void editCommande(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");

        if (idParam != null) {
            Long id = Long.valueOf(idParam);
            Commande commande = commandeService.getCommandeById(id);

            if (commande != null) {
                req.setAttribute("commande", commande);
                req.getRequestDispatcher("/WEB-INF/views/edit-commande.jsp").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Commande not found");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing ID");
        }
    }

    private void showAddCommandeForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/add-commande.jsp").forward(req, resp);
    }

    private void addCommande(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Date dateCommande = Date.valueOf(req.getParameter("dateCommande"));
        Long clientId = Long.valueOf(req.getParameter("clientId"));

        Client client = new Client();
        client.setId(clientId);

        Commande commande = new Commande();
        commande.setDateCommande(dateCommande);
        commande.setClient(client);

        commandeService.saveCommande(commande);

        resp.sendRedirect("commandes?action=list");
    }

    private void updateCommande(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.valueOf(req.getParameter("id"));
        Date dateCommande = Date.valueOf(req.getParameter("dateCommande"));
        Long clientId = Long.valueOf(req.getParameter("clientId"));

        Client client = new Client();
        client.setId(clientId);

        Commande commande = new Commande();
        commande.setId(id);
        commande.setDateCommande(dateCommande);
        commande.setClient(client);

        commandeService.updateCommande(commande);

        resp.sendRedirect("commandes?action=list");
    }

    private void deleteCommande(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.valueOf(req.getParameter("id"));

        commandeService.deleteCommande(id);

        resp.sendRedirect("commandes?action=list");
    }
}
