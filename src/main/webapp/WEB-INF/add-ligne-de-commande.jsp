<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Ligne De Commande</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            // Confirm before submission
            $("form").on("submit", function (e) {
                if (!confirm("Are you sure you want to add this Ligne De Commande?")) {
                    e.preventDefault();
                }
            });

            // Highlight invalid inputs dynamically
            $("input, select").on("blur", function () {
                if (!$(this).val()) {
                    $(this).css("border", "1px solid red");
                } else {
                    $(this).css("border", "");
                }
            });
        });
    </script>
</head>
<body>
<h1>Add Ligne De Commande</h1>
<form action="${pageContext.request.contextPath}/ligneDeCommande/save" method="post">
    <label>Commande:</label>
    <select name="commandeId" required>
        <c:forEach var="commande" items="${commandes}">
            <option value="${commande.id}">Commande ID: ${commande.id}</option>
        </c:forEach>
    </select>
    <br/>

    <label>Produit:</label>
    <select name="produitId" required>
        <c:forEach var="produit" items="${produits}">
            <option value="${produit.id}">${produit.nom}</option>
        </c:forEach>
    </select>
    <br/>

    <label>Quantite:</label>
    <input type="number" name="quantite" min="1" required />
    <br/>

    <button type="submit">Save</button>
</form>
</body>
</html>
