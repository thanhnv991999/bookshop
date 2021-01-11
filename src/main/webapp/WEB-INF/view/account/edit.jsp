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
            <h1>Cập nhật tài khoản</h1>
            <hr style="border-top: 1px dashed;margin: 35px 0">
            <h3 style="color: #1eff49">${mess}</h3>
            <form:form action="/account/edit" method="post" modelAttribute="form" >
                <div class="form-group">
                    <label>Username</label>
                    <form:input path="userName" class="form-control" readonly="true"/>
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
                    <form:hidden path="activated"/>
                    <form:hidden path="id"/>
                    <form:hidden path="role.role_ID"/>
                    <form:hidden path="passWord"/>
                    <button class="btn btn-default">Cập nhật</button>
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
