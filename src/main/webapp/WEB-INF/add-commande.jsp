<!DOCTYPE html>
<html>
<head>
    <title>Add Commande</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>Add Commande</h1>
<form action="commandes" method="post" id="addCommandeForm">
    <input type="hidden" name="action" value="add"/>
    <label>ID:</label>
    <input type="text" name="id" required/><br/>
    <label>Date Commande:</label>
    <input type="date" name="dateCommande" required/><br/>
    <label>Client ID:</label>
    <input type="text" name="clientId" required/><br/>
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
