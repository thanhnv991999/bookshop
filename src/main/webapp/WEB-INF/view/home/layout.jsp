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
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="/resources/images/banner1.jpg" alt="Image">
                <div class="carousel-caption">
                </div>
            </div>

            <div class="item">
                <img src="/resources/images/banner2.jpg" alt="Image">
                <div class="carousel-caption">
                </div>
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="row">
        <article class="col-sm-9 mgi">
            <%--            <tiles:insertAttribute name="body"/>--%>
            <c:forEach var="c" items="${catePrd}">
                <div class="col-sm-4">
                    <div class="thumbnail">
                        <a href="/product/details/?id=${c.id}">
                            <img class="prod" src="/resources/images/product/${c.image}" alt="Lights">
                        </a>
                        <div class="caption">
                            <p>${c.name}</p>
                            <div class="pull-right" data-id="${c.id}">
                                <button class="btn btn-sm btn-danger btn-add-to-cart"><i
                                        class="glyphicon glyphicon-shopping-cart"></i></button>
                                <button class="btn btn-sm btn-warning btn-star"><i
                                        class="glyphicon glyphicon-star-empty"></i></button>
                                <button class="btn btn-sm btn-success btn-open-dialog" data-toggle="modal"
                                        data-target="#myModal"><i class="glyphicon glyphicon-envelope"></i></button>
                            </div>

                            <p><f:formatNumber value="${c.price}" pattern="#,###.0 đ"/></p>
                        </div>
                    </div>
                </div>

            </c:forEach>
            <jsp:include page="../product/dialog.jsp"/>
        </article>
        <aside class="col-sm-3 mgi">
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
