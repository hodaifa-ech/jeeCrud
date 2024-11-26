<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Clients List</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            // Confirm delete with jQuery
            $('a.delete-link').on('click', function(e) {
                if (!confirm('Are you sure you want to delete this client?')) {
                    e.preventDefault(); // Prevent deletion
                }
            });
        });
    </script>
</head>
<body>
<h1>List of Clients</h1>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Email</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="client" items="${clients}">
        <tr>
            <td>${client.id}</td>
            <td>${client.nom}</td>
            <td>${client.adresse}</td>
            <td>${client.email}</td>
            <td>
                <a href="${pageContext.request.contextPath}/client/edit?id=${client.id}">Edit</a> |
                <a href="${pageContext.request.contextPath}/client/delete?id=${client.id}"
                   class="delete-link">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<p>
    <a href="${pageContext.request.contextPath}/client/add">Add New Client</a>
</p>
</body>
</html>
