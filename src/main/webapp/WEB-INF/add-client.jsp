<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add Client</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function() {
      // Form validation example
      $('form').on('submit', function(e) {
        const email = $('#email').val();
        if (!email.includes('@')) {
          alert('Please enter a valid email.');
          e.preventDefault(); // Prevent form submission
        }
      });
    });
  </script>
</head>
<body>
<h1>Add Client</h1>
<form method="post" action="${pageContext.request.contextPath}/client/save">
  <p>
    <label for="nom">Name:</label>
    <input type="text" name="nom" id="nom" required/>
  </p>
  <p>
    <label for="adresse">Address:</label>
    <input type="text" name="adresse" id="adresse" required/>
  </p>
  <p>
    <label for="email">Email:</label>
    <input type="email" name="email" id="email" required/>
  </p>
  <button type="submit">Save</button>
</form>
<p>
  <a href="${pageContext.request.contextPath}/client/list">Back to List</a>
</p>
</body>
</html>
