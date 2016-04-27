<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        <jsp:include page="nav_user.jsp" />

    </header>
    <form class="form-horizontal" action="SelectTopic" method="post">
        <fieldset>
            <legend>
                Select Topic
            </legend>
            <div class="form-group">
                <div class="col-lg-1"></div>
                <div class="text-center col-lg-10" style="margin: 40px 0px;">
                    <select class="form-control" required="required" name="topic" id="select">
                        <option disabled="disabled" selected="selected">Select Topic</option>
                        <c:forEach items="${topic_list}" var="topic">
                            <option value="${topic.id}">${topic.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-lg-1"></div>
            </div>
            <div class="text-left">
                <h5>Terms and Conditions:</h5>
                <ul>
                    <li>Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat.</li>
                    <li>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.</li>
                    <li>Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus. Nam nulla quam, gravida non, commodo a, sodales sit amet, nisi.</li>
                    <li>Pellentesque fermentum dolor. Aliquam quam lectus, facilisis auctor, ultrices ut, elementum vulputate, nunc.</li>
                    <li>Sed adipiscing ornare risus. Morbi est est, blandit sit amet, sagittis vel, euismod vel, velit. Pellentesque egestas sem. Suspendisse commodo ullamcorper magna.</li>
                    <li>Nulla sed leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</li>
                    <li>Fusce lacinia arcu et nulla. Nulla vitae mauris non felis mollis faucibus.</li>
                </ul>
            </div>
            <div class="form-group">
                <div class="col-lg-10 col-lg-offset-5">
                    <button type="submit" class="btn btn-primary">Start Quiz</button>
                </div>
            </div>
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