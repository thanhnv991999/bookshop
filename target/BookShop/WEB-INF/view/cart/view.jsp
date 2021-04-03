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

                <h2>Giỏ hàng</h2>
                <table class="table">
                    <tr>
                        <th>Id</th>
                        <th>Ảnh</th>
                        <th>Tên sách</th>
                        <th>Giá</th>
                        <th>Giảm giá</th>
                        <th>Số lượng</th>
                        <th>Tổng tiền</th>
                    </tr>
                    <tbody>
                        <c:forEach var="p" items="${sessionScope['scopedTarget.cartServices'].items}">
                            <tr data-id="${p.id}" data-price="${p.price}" data-discount="${p.discount}" >
                                <td>${p.id}</td>
                                <td><img src="/resources/images/product/${p.image}" width="30px"></td>
                                <td>${p.name}</td>
                                <td><f:formatNumber value="${p.price}" pattern="#,###,###"/> VNĐ</td>
                                <td><f:formatNumber value="${p.discount}" pattern="#"/>%</td>
                                <td><input id="evc" value="${p.quantity}" type="number" min="1" style="width: 70px"></td>
                                <td class="amt"><f:formatNumber value="${((p.quantity * p.price)- ((p.quantity * p.price)/100*p.discount))}" pattern="#,###,###"/></td>
                                <td>
                                    <button class="btn btn-sm btn-warning btn-cart-remove">
                                        <i class="glyphicon glyphicon-trash"></i>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <button class="btn btn-sm btn-danger btn-cart-clear">clear</button>
                <button class="btn btn-sm btn-info">continue</button>
                <a href="/order/checkout" class="btn btn-sm btn-success">checkout</a>

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

