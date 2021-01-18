<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Shop Book</title>
  <jsp:include page="/WEB-INF/view/admin/layout/head.jsp"/>
</head>
<body>

<div class="container">
  <header class="row">
    <div class="head-h1">
      <h1>PAGE ADMIN</h1>
    </div>
  </header>
  <nav class="row">
    <nav>
      <div class="menu">
        <ul>
          <li><a href="/admin/index">Trang chủ</a></li>
          <li><a href="">Quản Lý
            <!--=================Sub menu=================-->
            <ul class="sub-menu">
              <li><a href="/admin/category/index">Loại</a></li>
              <li><a href="/admin/product/index">Sản Phẩm</a></li>
              <li><a href="/admin/customer/index">khách hàng</a></li>
              <li><a href="/admin/order/index">Đơn hàng</a></li>
            </ul>
          </a>
          </li>
          <li><a href="">Thống kê
            <ul class="sub-menu">
              <li><a href="#">Mobile</a></li>
              <li><a href="#">Email</a></li>
              <li><a href="#">Diễn dàn</a></li>
              <li><a href="#">Facebook</a></li>
            </ul>
          </a></li>
        </ul>
      </div>
    </nav>
  </nav>
  <div class="row">
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
  <footer class="row">
    <p class="text-center">&copy; Shop Book 2021</p>
  </footer>
</div>

</body>
</html>
