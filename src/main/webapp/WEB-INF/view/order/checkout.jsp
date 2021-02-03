<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <h1>Kiểm tra</h1>
            <hr style="border-top: 1px dashed;margin: 35px 0">
            <table class="table">
                <tr>
                    <th>Id</th>
                    <th>Tên sách</th>
                    <th>Giá</th>
                    <th>Giảm giá</th>
                    <th>Số lượng</th>
                    <th>Tổng tiền</th>
                </tr>
                <tbody>
                <c:forEach var="p" items="${sessionScope['scopedTarget.cartServices'].items}">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.name}</td>
                        <td>${p.price}</td>
                        <td><f:formatNumber value="${p.discount}" pattern="#"/>%</td>
                        <td>${p.quantity}</td>
                        <td class="amt"><f:formatNumber
                                value="${((p.quantity * p.price)- ((p.quantity * p.price)/100*p.discount))}"
                                pattern="#,###.0 đ"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <hr style="border-top: 1px dashed;margin: 35px 0">
            <form:form action="/order/checkout" method="post" modelAttribute="form">
                <h3 style="color: #1eff49">${mess}</h3>
                <div class="form-group">
                    <form:hidden path="customer.id"/>
                </div>
                <div class="form-group">
                    <label>Ngày Đặt</label>
                    <form:input path="orderDate" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>Địa chỉ</label>
                    <form:input path="address" class="form-control" required="true"/>
                </div>
                <div class="form-group">
                    <label>Tổng tiền</label>
                    <form:input path="amount" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>Ghi chú</label>
                    <form:textarea path="description" rows="3" class="form-control"/>
                </div>
                <div class="form-group">
                    <button class="btn btn-default">Đặt hàng</button>
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
