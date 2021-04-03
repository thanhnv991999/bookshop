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
            <h1>Thông tin đơn hàng</h1>
            <form action="/order/checkout" method="post">
                <div class="form-group">
                    <label>Id đơn hàng</label>
                    <input value="${order.get().id}" class="form-control" readonly/>
                </div>
                <div class="form-group">
                    <label>Ngày Đặt</label>
                    <input value="${order.get().orderDate}" class="form-control" readonly/>
                </div>
                <div class="form-group">
                    <label>Địa chỉ</label>
                    <input value="${order.get().address}" class="form-control" readonly/>
                </div>
                <div class="form-group">
                    <label>Tổng tiền</label>
                    <input value="${order.get().amount}" class="form-control" readonly>
                </div>
                <div class="form-group">
                    <label>Ghi chú</label>
                    <input value="${order.get().description}" class="form-control" readonly/>
                </div>
            </form>
            <hr style="border-top: 1px dashed;margin: 35px 0">
            <h1>Chi tiết đơn hàng</h1>
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
                <c:forEach var="detail" items="${orderDetail}">
                    <tr>
                        <td>${detail.id}</td>
                        <td>${detail.product.name}</td>
                        <td>${detail.price}</td>
                        <td><f:formatNumber value="${detail.discount}" pattern="#"/>%</td>
                        <td>${detail.quantity}</td>
                        <td class="amt"><f:formatNumber value="${((detail.quantity * detail.price)-
                                ((detail.quantity * detail.price)/100*detail.discount))}"
                               pattern="#,###,###"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

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
