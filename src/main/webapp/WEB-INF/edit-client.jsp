<!-- edit-client.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Client</title>
</head>
<body>
<h1>Edit Client</h1>
<form method="post" action="${pageContext.request.contextPath}/client/update">
    <input type="hidden" name="id" value="${client.id}"/>
    <p>
        <label for="nom">Name:</label>
        <input type="text" name="nom" id="nom" value="${client.nom}" required/>
    </p>
    <p>
        <label for="adresse">Address:</label>
        <input type="text" name="adresse" id="adresse" value="${client.adresse}" required/>
    </p>
    <p>
        <label for="email">Email:</label>
        <input type="email" name="email" id="email" value="${client.email}" required/>
    </p>
    <button type="submit">Save</button>
</form>
<p>
    <a href="${pageContext.request.contextPath}/client/list">Back to List</a>
</p>
</body>
</html>