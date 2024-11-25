<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>


<html>
<head>
    <title>Add Commande</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>Add Commande</h1>
<form action="${pageContext.request.contextPath}/commandes/save" method="post" id="addCommandeForm">

    <label>Date Commande:</label>
    <input type="date" name="dateCommande" required/><br/>

    <label>Client:</label>
    <select name="clientId" required>
        <option value="">Select a Client</option>
        <c:forEach var="client" items="${clients}">
            <option value="${client.id}">${client.nom}</option>
        </c:forEach>
    </select><br/>

    <button type="submit">Save</button>
</form>

<script>
    // Example: Adding confirmation before submitting
    $("#addCommandeForm").on("submit", function (e) {
        if (!confirm("Are you sure you want to add this Commande?")) {
            e.preventDefault();
        }
    });
</script>
</body>
</html>
