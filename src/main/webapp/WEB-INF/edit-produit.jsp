<!DOCTYPE html>
<html>
<head>
    <title>Edit Produit</title>
</head>
<body>
<h1>Edit Produit</h1>
<form action="${pageContext.request.contextPath}/produit/update" method="post">
    <input type="hidden" name="action" value="update"/>
    <input type="hidden" name="id" value="${produit.id}"/>
    <label>Nom:</label>
    <input type="text" name="nom" value="${produit.nom}" required/><br/>
    <label>Prix:</label>
    <input type="number" step="0.01" name="prix" value="${produit.prix}" required/><br/>
    <button type="submit">Update</button>
</form>
</body>
</html>
