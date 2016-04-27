<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("page", request.getParameter("page")); %>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="true">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">LNMIIT Quiz Portal</a>
        </div>

        <div class="navbar-collapse collapse in" id="bs-example-navbar-collapse-1" aria-expanded="true">
            <ul class="nav navbar-nav">
                <li><a href="#">About Project</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li <c:out value="${(page == 'signup') ? 'class=active' : ''}"/>>
                    <a href="Signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a>
                </li>
                <li <c:out value="${(page == 'login') ? 'class=active' : ''}"/>>
                    <a href="Login"><span class="glyphicon glyphicon-log-in"></span> Login</a>
                </li>
            </ul>
        </div>
    </div>

</nav>