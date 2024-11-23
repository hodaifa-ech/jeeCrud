<!DOCTYPE html>
<html>
<head>
    <title>Edit Produit</title>
</head>
<body>
<h1>Edit Produit</h1>
<form action="produits" method="post">
    <input type="hidden" name="action" value="update"/>
    <label>ID:</label>
    <input type="text" name="id" value="${produit.id}" readonly/><br/>
    <label>Nom:</label>
    <input type="text" name="nom" value="${produit.nom}"/><br/>
    <label>Prix:</label>
    <input type="number" step="0.01" name="prix" value="${produit.prix}"/><br/>
    <button type="submit">Update</button>
</form>
</body>
</html>
