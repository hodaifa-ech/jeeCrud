<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Commandes</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>List of Commandes</h1>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Date Commande</th>
        <th>Client ID</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="commande" items="${commandes}">
        <tr>
            <td>${commande.id}</td>
            <td>${commande.dateCommande}</td>
            <td>${commande.client.id}</td>
            <td>
                <a href="${pageContext.request.contextPath}/commandes/edit?id=${commande.id}">Edit</a> |
                <a href="${pageContext.request.contextPath}/commandes/delete?id=${commande.id}"
                   onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<p>
    <a href="${pageContext.request.contextPath}/commandes/add">Add New Commande</a>
</p>
</body>
</html>
