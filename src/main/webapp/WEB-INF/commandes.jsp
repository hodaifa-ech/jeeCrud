<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Commandes</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>Commandes</h1>
<a href="commandes?action=add">Add Commande</a>
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
                <a href="commandes?action=edit&id=${commande.id}">Edit</a>
                <form action="commandes" method="post" style="display:inline;" class="deleteForm">
                    <input type="hidden" name="action" value="delete"/>
                    <input type="hidden" name="id" value="${commande.id}"/>
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script>
    // Confirmation dialog for delete actions
    $(".deleteForm").on("submit", function (e) {
        if (!confirm("Are you sure you want to delete this Commande?")) {
            e.preventDefault();
        }
    });
</script>
</body>
</html>
