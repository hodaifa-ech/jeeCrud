<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Produits List</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            // Confirm delete with jQuery
            $("a.delete-link").on("click", function (e) {
                if (!confirm("Are you sure you want to delete this Produit?")) {
                    e.preventDefault();
                }
            });

            // Add hover effect to table rows
            $("tbody tr").hover(
                function () {
                    $(this).css("background-color", "#f9f9f9");
                },
                function () {
                    $(this).css("background-color", "");
                }
            );
        });
    </script>
</head>
<body>
<h1>List of Produits</h1>
<table border="1">
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
                <a href="${pageContext.request.contextPath}/produit/edit?id=${produit.id}">Edit</a> |
                <a href="${pageContext.request.contextPath}/produit/delete?id=${produit.id}" class="delete-link">
                    Delete
                </a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<p>
    <a href="${pageContext.request.contextPath}/produit/add">Add New Produit</a>
</p>
</body>
</html>
