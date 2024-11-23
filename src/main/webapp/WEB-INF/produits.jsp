<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Produits</title>
</head>
<body>
<h1>Produits</h1>
<a href="produits?action=add">Add Produit</a>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Prix</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="produit" items="${produits}">
        <tr>
            <td>${produit.id}</td>
            <td>${produit.nom}</td>
            <td>${produit.prix}</td>
            <td>
                <a href="produits?action=edit&id=${produit.id}">Edit</a>
                <form action="produits" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete"/>
                    <input type="hidden" name="id" value="${produit.id}"/>
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
