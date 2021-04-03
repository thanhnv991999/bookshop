<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <div class="row">
                    <div class="col-sm-5 text-center">
                        <div class="detail-img">
                            <img class="prod" src="/resources/images/product/${productDetail.get().image}" alt="Lights"></a>
                        </div>
                    </div>
                <div class="col-sm-7">
                    <ul class="details-info">
                        <li>Tên sách :${productDetail.get().name}</li>
                        <li>Giá : <f:formatNumber value="${productDetail.get().price}" pattern="#,###đ"/> </li>
                        <li>Giảm : <f:formatNumber value="${productDetail.get().discount}" pattern="#"/>%</li>
                        <li>Thể Loại : ${productDetail.get().category.categoryName}</li>
                        <li>Số lượng : ${productDetail.get().quantity}</li>
                    </ul>
                    <div class="details-info">
                            Mô Tả : ${productDetail.get().description}
                    </div>
                </div>

            </div>
            <hr style="border-top: 1px dashed;margin: 35px 0">
            <h2>Sách Cùng Thể Loại</h2>
            <c:forEach var="c" items="${catePrd}">
                <a href="/product/details/?id=${c.id}">
                    <img class="prod" src="/resources/images/product/${c.image}" alt="Lights">
                </a>
            </c:forEach>
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
