<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>

<html lang="en">
<head>
    <title>Shop Book</title>
    <jsp:include page="/WEB-INF/view/admin/layout/head.jsp"/>
</head>
<body>

<div class="container">
    <header class="row">
        <div class="head-h1">
            <h1>ADMIN</h1>
        </div>
    </header>
    <nav class="row">
        <jsp:include page="/WEB-INF/view/admin/layout/menu.jsp"/>
    </nav>
    <h3 class="label label-success">${param.mess}</h3>
    <div class="row">
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#tab1">Danh sách</a></li>
            <li><a data-toggle="tab" href="#tab2">Chi tiết</a></li>
        </ul>

        <div class="tab-content">
            <div id="tab1" class="tab-pane fade in active">
                <hr style="border-top: 1px dashed;margin: 35px 0">
                <h2>Danh sách đơn hàng</h2>
                <hr style="border-top: 1px dashed;margin: 35px 0">
                <table class="table table-hover">
                    <thead>
                    <th>Id</th>
                    <th>Khách hàng</th>
                    <th>Địa chỉ</th>
                    <th>Tổng tiền</th>
                    <th>Mô tả</th>
                    <th>Ngày tạo</th>
                    <th>Trạng thái</th>

                    </thead>
                    <tbody>
                    <c:forEach var="o" items="${orderList}">
                        <tr>
                            <td>${o.id}</td>
                            <td>${o.customer.id}</td>
                            <td>${o.address}</td>
                            <td>${o.amount}</td>
                            <td>${o.description}</td>
                            <td>${o.orderDate}</td>
                            <c:if test="${o.status==true}">
                                <td><i class="glyphicon glyphicon-ok" style="color: #1eff49"></i></td>
                            </c:if>
                            <c:if test="${o.status==false}">
                                <td><i class="glyphicon glyphicon-remove" style="color: red"></i></td>
                            </c:if>
                            <td>
                                <a class="btn btn-sm btn-info" href="/admin/order/status/${o.id}">Duyệt</a>
                                <a class="btn btn-sm btn-info" href="/admin/order/detail/${o.id}">Chi tiết</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div id="tab2" class="tab-pane fade">
                <hr style="border-top: 1px dashed;margin: 35px 0">
                <h2>Thông tin chi tiết</h2>
                <hr style="border-top: 1px dashed;margin: 35px 0">
                <table class="table table-hover">
                    <thead>
                    <th>Id đơn hàng</th>
                    <th>Tên khách hàng</th>
                    <th>Tên sách</th>
                    <th>Số lượng</th>
                    <th>Giá</th>
                    <th>Giảm</th>
                    </thead>
                    <tbody>
                    <c:forEach var="o" items="${orderDetails}">
                        <tr>
                            <td>${o.order.id}</td>
                            <td>${o.order.customer.fullName}</td>
                            <td>${o.product.name}</td>
                            <td>${o.quantity}</td>
                            <td>${o.price}</td>
                            <td>${o.discount}%</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
          </div>

    </div>
    <footer class="row">
        <p class="text-center">&copy; Shop Book 2021</p>
    </footer>
</div>

</body>
</html>
