<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cart" value="${sessionScope['scopedTarget.cartServices']}"/>
<%@ page pageEncoding="UTF-8" %>
        <div class="panel panel-default">
            <div class="panel-heading">Giỏ hàng</div>
            <div class="panel-body">
                    <img id="cart-img" src="/resources/images/cart.gif" class="col-sm-5">
                    <ul class="col-sm-7" style="list-style-type: circle;">
                            <li><b class="cart-cnt">${cart.count}</b> mặt hàng</li>
                            <li><b class="cart-amt"><f:formatNumber value="${cart.amount}" pattern="#,###,###"/></b> VNĐ</li>
                            <li>
                               <a href="/cart/view">Xem giỏ hàng</a>
                            </li>
                    </ul>
            </div>
        </div>

        <div class="panel panel-default">
        <div class="panel-heading">Tìm Kiếm</div>
                <div class="panel-body">
                       <form action="/product/search"><input name="keywords" class="form-control" placeholder="keywords"></form>
                </div>
        </div>
    <div class="panel panel-default">
    <div class="panel-heading">DANH MỤC</div>

        <div class="list-group">
            <c:forEach items="${cates}" var="c">
                <a href="/product/category?id=${c.id}" class="list-group-item">${c.categoryName}</a>
            </c:forEach>

        </div>
    </div>
        <div class="panel panel-default">
        <div class="panel-heading">Đặc Biệt</div>
        <div class="list-group">
        <a href="/product/sell" class="list-group-item">Bán Chạy</a>
        <a href="/product/view-a-lot" class="list-group-item">Xem nhiều</a>
        <a href="/product/discount" class="list-group-item">Giảm Giá</a>
        </div>
        </div>

