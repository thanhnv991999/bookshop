<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Shop Book</title>
    <jsp:include page="../layout/head.jsp"/>
</head>
<body>

<div class="container">
    <header class="row">
        <div class="head-h1">
            <h1>BOOK SHOP</h1>
        </div>
    </header>
    <nav class="row">

        <jsp:include page="../layout/menu.jsp"/>
    </nav>
    <div class="row">
        <article class="col-sm-9">
            <h1>Đăng ký</h1>
            <form:form action="/account/register" method="post" modelAttribute="form">
                <h3 style="color: #1eff49">${mess}</h3>
                <div class="form-group">
                    <label>Username</label>
                    <form:input path="userName" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <form:input path="passWord" class="form-control" type="password"/>
                </div>
                <div class="form-group">
                    <label>Fullname</label>
                    <form:input path="fullName" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <form:input path="email" class="form-control"/>
                </div>
                <div class="form-group">
                       <button class="btn btn-default">Đăng Ký</button>
                </div>
            </form:form>
        </article>
        <aside class="col-sm-3">
            <jsp:include page="../layout/aside.jsp"/>
        </aside>
    </div>
    <footer class="row">
        <p class="text-center">&copy; Shop Book 2021</p>
    </footer>
</div>

</body>
</html>
