<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lignes De Commande</title>
</head>
<body>
<h1>Lignes De Commande</h1>
<a href="lignes-de-commande?action=add">Add Ligne De Commande</a>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Commande</th>
        <th>Produit</th>
        <th>Quantité</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="ligne" items="${lignesDeCommande}">
        <tr>
            <td>${ligne.id}</td>
            <td>${ligne.commande.id}</td>
            <td>${ligne.produit.nom}</td>
            <td>${ligne.quantite}</td>
            <td>
                <a href="lignes-de-commande?action=edit&id=${ligne.id}">Edit</a>
                <form action="lignes-de-commande" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete"/>
                    <input type="hidden" name="id" value="${ligne.id}"/>
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
