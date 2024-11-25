<!DOCTYPE html>
<html>
<head>
    <title>Add Produit</title>
</head>
<body>
<h1>Add Produit</h1>
<form action="${pageContext.request.contextPath}/produit/save" method="post">

    <label>Nom:</label>
    <input type="text" name="nom" required/><br/>
    <label>Prix:</label>
    <input type="number" step="0.01" name="prix" required/><br/>
    <button type="submit">Save</button>
</form>
</body>
</html>
