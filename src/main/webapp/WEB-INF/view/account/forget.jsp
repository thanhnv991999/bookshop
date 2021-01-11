<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Shop Book</title>
    <%--    <tiles:insertAttribute name="head"/>--%>
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
        <%--        <tiles:insertAttribute name="menu"/>--%>
        <jsp:include page="../layout/menu.jsp"/>
    </nav>
    <div class="row">
        <article class="col-sm-9">
            <h1>Quên mật khẩu</h1>
            <hr style="border-top: 1px dashed;margin: 35px 0">
            <%--            <tiles:insertAttribute name="body"/>--%>
            <form action="/account/forget" method="post">
                <div class="form-group">
                    <label>Username</label>
                    <input name="username" class="form-control">
                </div>
                <div class="form-group">
                    <label>Email tài khoản</label>
                    <input name="email" class="form-control">
                </div>
                <div class="form-group">
                    <button class="btn btn-defalut">Gửi</button>
                </div>
            </form>
        </article>
        <aside class="col-sm-3">
            <%--            <tiles:insertAttribute name="aside"/>--%>
            <jsp:include page="../layout/aside.jsp"/>
        </aside>
    </div>
    <footer class="row">
        <p class="text-center">&copy; Shop Book 2021</p>
    </footer>
</div>

</body>
</html>
