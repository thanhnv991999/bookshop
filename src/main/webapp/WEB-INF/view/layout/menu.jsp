<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page pageEncoding="UTF-8" %>

                <div class="container-fluid">
                        <div class="navbar-header">
                                <a class="navbar-brand" href="/home/index">Trang chủ</a>
                        </div>

                <nav class="row">
                    <nav>
                        <div class="menu">
                            <ul>
                                <li><a href="/home/index">Trang chủ</a></li>
                                <li><a href="/home/about">Giới thiệu</a></li>
                                <li><a href="/home/contact">Liên hệ</a></li>
                                <li><a href="/home/feedback">Phản hồi</a></li>
                                <li><a href="/home/faq">Hỏi Đáp</a></li>
                                <li><a href="#">Tài khoản
                                <!--=================Sub menu=================-->
                                            <c:choose>
                                                <c:when test="${empty sessionScope.user}">
                                                    <ul class="sub-menu">
                                                    <li><a href="/account/login">Đăng nhập</a></li>
                                                    <li><a href="/account/register">Đăng ký</a></li>
                                                    <li><a href="/account/forget">Quên mật khẩu?</a></li>
                                                    </ul>
                                                </c:when>
                                                <c:otherwise>
                                                    <ul class="sub-menu">
                                                    <li><a href="/account/change">Đổi mật khẩu</a></li>
                                                    <li><a href="/account/edit">Cập nhật tài khoản</a></li>
                                                    <li><a href="/order/list">Đơn hàng</a></li>
                                                    <li><a href="/order/item">Sách đã mua</a></li>
                                                    <li><a href="/account/logout">Đăng xuất</a></li>
                                                    </ul>
                                                </c:otherwise>
                                            </c:choose>
                                        </a>
                                </li>
                            </ul>
                        </div>
                     </nav>
                    </nav>
                </div>

