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
        <jsp:include page="header.jsp"/>
        <jsp:include page="nav_user.jsp">
            <jsp:param name="page" value="user_index"/>
        </jsp:include>
    </header>
    <form class="form-horizontal" action="AddTopic" method="post">
        <fieldset>
            <legend>
                Add Topic
            </legend>
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <div class="form-group">
                    <label for="inputTopicName" class="col-lg-2 control-label">Name</label>
                    <div class="col-lg-10">
                        <input type="text" name="topicname" class="form-control" id="inputTopicName" placeholder="Name">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputTopicDesc" class="col-lg-2 control-label">Description</label>
                    <div class="col-lg-10">
                        <textarea rows="4" style="resize: none;" name="topicdesc" class="form-control"
                                  id="inputTopicDesc" placeholder="Description"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-5">
                        <button type="reset" class="btn btn-default">Reset</button>
                        <button type="submit" class="btn btn-primary">Add Topic</button>
                    </div>
                </div>
            </div>
            <div class="col-lg-1"></div>

        </fieldset>
    </form>
</div>
</body>
<script>
    $('.nav-collapse').click('li', function () {
        $('.nav-collapse').collapse('hide');
    });
</script>
</html>