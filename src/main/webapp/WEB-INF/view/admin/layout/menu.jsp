    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page pageEncoding="UTF-8" %>
        <nav>
        <div class="menu">
        <ul>
        <li><a href="/admin/index">Trang chủ</a></li>
        <li><a href="">Quản Lý
        <!--=================Sub menu=================-->
        <ul class="sub-menu">
        <li><a href="/admin/category/index">Thể Loại</a></li>
        <li><a href="/admin/product/index">Sản Phẩm</a></li>
        <li><a href="/admin/customer/index">khách hàng</a></li>
        <li><a href="/admin/order/index">Đơn hàng</a></li>
        </ul>
        </a>
        </li>
        <li><a href="">Thống kê
        <ul class="sub-menu">
        <li><a href="/admin/report/inventory">Loại tồn kho</a></li>
        <li><a href="/admin/report/revenue-category">Doanh thu sản phẩm</a></li>
        <li><a href="/admin/report/revenue-month">Doanh thu theo tháng</a></li>
        </ul>
        </a></li>
        <li><a href="/logout">Thoát</a></li>
        </ul>
        </div>
        </nav>
