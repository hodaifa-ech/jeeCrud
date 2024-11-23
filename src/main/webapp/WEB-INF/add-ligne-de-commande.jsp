<!DOCTYPE html>
<html>
<head>
    <title>Add Ligne De Commande</title>
</head>
<body>
<h1>Add Ligne De Commande</h1>
<form action="lignes-de-commande" method="post">
    <input type="hidden" name="action" value="add"/>
    <label>ID:</label>
    <input type="text" name="id"/><br/>
    <label>Commande:</label>
    <select name="commandeId">
        <c:forEach var="commande" items="${commandes}">
            <option value="${commande.id}">${commande.id}</option>
        </c:forEach>
    </select><br/>
    <label>Produit:</label>
    <select name="produitId">
        <c:forEach var="produit" items="${produits}">
            <option value="${produit.id}">${produit.nom}</option>
        </c:forEach>
    </select><br/>
    <label>Quantité:</label>
    <input type="number" name="quantite"/><br/>
    <button type="submit">Save</button>
</form>
</body>
</html>
