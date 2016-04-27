<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LNMIIT Quiz Portal</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" href="bootstrap/css/custom-theme.css">


    <!-- Latest compiled and minified JavaScript -->
    <script src="bootstrap/js/jquery-2.2.2.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header>
        <jsp:include page="header.jsp" />
        <jsp:include page="nav_public.jsp">
            <jsp:param name="page" value="login" />
        </jsp:include>
    </header>
    <div class="col-lg-1"></div>
    <div class="col-sm-10">
        <% String error = (String) request.getAttribute("error");
            String error_msg = (String) request.getAttribute("error_msg"); %>
        <% if (error == "true") { %>
        <div class="alert alert-dismissible alert-danger">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong><%= error_msg%>
            </strong>
        </div>
        <% } %>
        <form class="form-horizontal" action="Login" method="post">
            <fieldset>
                <legend>Login Form</legend>
                <div class="form-group">
                    <label for="inputUsername" class="col-lg-2 control-label">Username</label>
                    <div class="col-lg-10">
                        <input type="text" name="username" class="form-control" id="inputUsername"
                               placeholder="Username">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-lg-2 control-label">Password</label>
                    <div class="col-sm-8">
                        <input type="password" name="password" class="form-control" id="inputPassword"
                               placeholder="Password">
                    </div>
                    <div class="col-sm-2 text-right">
                        <button type="button" class="btn btn-primary" id="showpass">Show Password</button>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-5">
                        <button type="reset" class="btn btn-default">Reset</button>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
    <div class="col-lg-1"></div>
</div>
</body>
<script>
    $('.nav-collapse').click('li', function () {
        $('.nav-collapse').collapse('hide');
    });

    $('#showpass').mousedown(function () {
        $('#inputPassword').removeAttr("type").prop('type', 'text');
    }).mouseup(function () {
        $('#inputPassword').removeAttr("type").prop('type', 'password');
    })
    ;
</script>
</html>