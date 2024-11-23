
<!-- clients.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Clients List</title>
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
                   onclick="return confirm('Are you sure?')">Delete</a>
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