<!DOCTYPE html>
<html>
<head>
    <title>Add Produit</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            // Confirm submission
            $("form").on("submit", function (e) {
                if (!confirm("Are you sure you want to add this Produit?")) {
                    e.preventDefault();
                }
            });

            // Validate inputs dynamically
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
