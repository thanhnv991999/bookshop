<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            <%--<tiles:insertAttribute name="body"/>--%>

            <h2>Đơn hàng</h2>
            <table class="table">
                <tr>
                    <th>Id</th>
                    <th>Ngày tạo</th>
                    <th>Địa chỉ</th>
                    <th>Tổng tiền</th>
                    <th>Chi tiết</th>
                </tr>
                <tbody>
                <c:forEach items="${listOrder}" var="o">
                    <tr>
                        <td>${o.id}</td>
                        <td>${o.orderDate}</td>
                        <td>${o.address}</td>
                        <td>${o.amount}</td>
                        <td><a href="/order/detail/${o.id}" class="btn btn-sm btn-warning">Chi tiết</a> </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

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

