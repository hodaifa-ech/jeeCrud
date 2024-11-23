<!DOCTYPE html>
<html>
<head>
    <title>Add Produit</title>
</head>
<body>
<h1>Add Produit</h1>
<form action="produits" method="post">
   
    <input type="text" name="id"/><br/>
    <label>Nom:</label>
    <input type="text" name="nom"/><br/>
    <label>Prix:</label>
    <input type="number" step="0.01" name="prix"/><br/>
    <button type="submit">Save</button>
</form>
</body>
</html>
