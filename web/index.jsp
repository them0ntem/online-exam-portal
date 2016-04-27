<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LNMIIT Quiz Portal</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="bootstrap/css/custom-theme.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="bootstrap/js/jquery-2.2.2.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header>
        <jsp:include page="header.jsp" />
        <jsp:include page="nav_public.jsp" />
    </header>
    <div class="page-header">
        <h3>About Us</h3>
    </div>
    <% String info = (String) session.getAttribute("info");
        String info_msg = (String) session.getAttribute("info_msg"); %>
    <% if (info == "true") { %>
    <div class="alert alert-dismissible alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong><%= info_msg%>
        </strong>
    </div>
    <% } %>
    <div class="col-lg-1"></div>
    <div class="col-lg-10">
        <p style="font-size: 1.5em;">Online Quiz Portal is the project made in Java Servlet in this user has to first register his or her account then registered user can select desired topic for quiz.<br /><br />

            This project is developed by :><br>

            1. Manthan Sharma<br>
            2. Rahul Deewan<br>
            3. Mridul Garg
        </p>
    </div>
    <div class="col-lg-1"></div>
</div>
</body>
<script>
    $('.nav-collapse').click('li', function () {
        $('.nav-collapse').collapse('hide');
    });
</script>
</html>