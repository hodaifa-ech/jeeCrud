<!DOCTYPE html>
<html>
<head>
    <title>Edit Produit</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            // Confirm submission
            $("form").on("submit", function (e) {
                if (!confirm("Are you sure you want to update this Produit?")) {
                    e.preventDefault();
                }
            });

            // Highlight invalid inputs dynamically
            $("input").on("blur", function () {
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
