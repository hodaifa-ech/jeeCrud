<!DOCTYPE html>
<html>
<head>
    <title>Edit Commande</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>Edit Commande</h1>
<form action="commandes" method="post" id="editCommandeForm">
    <input type="hidden" name="action" value="update"/>
    <label>ID:</label>
    <input type="text" name="id" value="${commande.id}" readonly/><br/>
    <label>Date Commande:</label>
    <input type="date" name="dateCommande" value="${commande.dateCommande}" required/><br/>
    <label>Client ID:</label>
    <input type="text" name="clientId" value="${commande.client.id}" required/><br/>
    <button type="submit">Update</button>
</form>

<script>
    // Example: Highlight invalid inputs dynamically
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
