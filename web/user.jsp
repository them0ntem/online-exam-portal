<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% int total_quiz = (int) request.getAttribute("total_quiz"); %>
<% String name = (String) request.getAttribute("name"); %>
<% String email = (String) request.getAttribute("email"); %>
<% float average = (float) request.getAttribute("average_score"); %>
<% String upgrade_request = (String) request.getAttribute("upgrade_request"); %>

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
        <jsp:include page="nav_user.jsp">
            <jsp:param name="page" value="user_index" />
        </jsp:include>
    </header>


    <% String info = (String) request.getAttribute("info");
        String info_msg = (String) request.getAttribute("info_msg"); %>
    <% if (info == "true") { %>
    <div class="alert alert-dismissible alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong><%= info_msg%>
        </strong>
    </div>
    <% } %>
    <div class="row">
        <div class="col-lg-6"><h4 class="userlist">Name :> <%= name%>
        </h4></div>
        <div class="col-lg-6 text-right"><h4 class="userlist">Email Address :> <%= email%>
        </h4></div>
    </div>
    <div class="row">
        <div class="col-lg-6"><h4 class="userlist">Average Score :> <fmt:formatNumber type="number" maxFractionDigits="2" value="<%= average%>"/>

        </h4></div>
        <div class="col-lg-6 text-right"><h4 class="userlist">Total No. of Quiz :> <%= total_quiz%>
        </h4></div>
    </div>
    <fieldset style="margin-top: 20px;">
        <legend style="margin-bottom: 0px;">Previous Result</legend>
    </fieldset>
    <div class="col-lg-12">
        <table id="previous-result" class="table table-striped table-hover ">
            <thead>
            <tr>
                <th>#</th>
                <th>Quiz Topic</th>
                <th>Total Question</th>
                <th>Correct Question</th>
                <th>Score</th>
                <th>Date</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${resultset}" var="result">
                <tr>
                    <td><c:out value="${result.id}"/> </td>
                    <td><c:out value="${result.topic_name}"/></td>
                    <td><c:out value="${result.no_of_question}"/></td>
                    <td><c:out value="${result.no_of_correct_question}"/></td>
                    <td><c:out value="${result.no_of_correct_question * 5}"/></td>
                    <td><c:out value="${result.created_at}"/></td>
                </tr>
                <br>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<div class="modal" id="upgrade_request" style="-webkit-transform: translate(0, 50%) !important; ">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Upgrade Request</h4>
            </div>
            <div class="modal-body">
                <p>Do you want to confirm ??</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                <form action="Upgrade" style="display: inline;" method="post"> <button type="submit" class="btn btn-primary">Yes</button></form>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    $('.nav-collapse').click('li', function () {
        $('.nav-collapse').collapse('hide');
    });
    <% if (upgrade_request == "true") { %>
    $("#upgrade_request").modal()
    <% } %>

</script>
</html>