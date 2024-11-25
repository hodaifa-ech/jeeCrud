<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lignes De Commande</title>
</head>
<body>
<h1>List of Lignes De Commande</h1>

<table border="1" cellpadding="10" cellspacing="0">
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
            <td>Commande ID: ${ligne.commande.id}</td>
            <td>${ligne.produit.nom}</td>
            <td>${ligne.quantite}</td>
            <td>

                <form action="${pageContext.request.contextPath}/ligneDeCommande/delete?id=${ligne.id}" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete"/>
                    <input type="hidden" name="id" value="${ligne.id}"/>
                    <button type="submit" onclick="return confirm('Are you sure?')">Delete</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<p>
    <a href="${pageContext.request.contextPath}/ligneDeCommande/add">Add New Ligne De Commande</a>
</p>

</body>
</html>
