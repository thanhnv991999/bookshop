    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page pageEncoding="UTF-8" %>
        <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                        <div class="navbar-header">
                                 <a class="navbar-brand" href="/admin/index ">Trang chủ</a>
                        </div>
                        <ul class="nav navbar-nav">
                                <li class="dropdown">
                                    <a href="" class="btn dropdown-toggle" data-toggle="dropdown">Quản lý</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="/admin/category/index">Loại</a></li>
                                        <li><a href="/admin/product/index">Sản phẩm</a></li>
                                        <li><a href="/admin/customer/index">Khách hàng</a></li>
                                        <li><a href="/admin/order/index">Đơn hàng</a></li>
                                    </ul>
                                 </li>
                                 <li><a href="">Thống kê</a></li>
                        </ul>
                </div>
        </nav>
