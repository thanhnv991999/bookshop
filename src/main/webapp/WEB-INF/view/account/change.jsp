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
            <h1>Đổi mật khẩu</h1>
            <form:form action="/account/change" method="post" modelAttribute="CusDTO">
                <h3 style="color: #1eff49">${mess}</h3>
                <form:hidden path="id" value="${user.id}"/>
                <div class="form-group">
                    <label>Username</label>
                    <input class="form-control" readonly="true" value="${user.userName}"/><h4 style="color: #ff3d1f">${errol}</h4>
                </div>
                <div class="form-group">
                    <label>Mật khẩu cũ</label>
                    <form:input path="passOld" class="form-control" type="password"/>
                </div>
                <div class="form-group">
                    <label>Mật khẩu mới</label>
                    <form:input path="passNew" class="form-control" type="password"/>
                </div>
                <div class="form-group">
                    <button class="btn btn-default">Thay đổi</button>
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
