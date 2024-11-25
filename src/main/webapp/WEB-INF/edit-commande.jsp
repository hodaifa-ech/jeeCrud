
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>


<html>
<head>
    <title>Edit Commande</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>Edit Commande</h1>
<form action="${pageContext.request.contextPath}/commandes/update" method="post" id="editCommandeForm">

    <!-- Hidden input to send the Commande ID -->
    <input type="hidden" name="id" value="${commande.id}" />

    <label>Date Commande:</label>
    <input type="date" name="dateCommande" value="${commande.dateCommande}" required /><br/>

    <label>Client:</label>
    <select name="clientId" required>
        <option value="">Select a Client</option>
        <c:forEach var="client" items="${clients}">
            <option value="${client.id}" ${client.id == commande.client.id ? 'selected="selected"' : ''}>
                    ${client.nom}
            </option>
        </c:forEach>
    </select><br/>

    <button type="submit">Update</button>
</form>

<script>
    // Highlight invalid inputs dynamically
    $("#editCommandeForm input").on("blur", function () {
        if (!$(this).val()) {
            $(this).css("border", "1px solid red");
        } else {
            $(this).css("border", "");
        }
    });
</script>
</body>
</html>
