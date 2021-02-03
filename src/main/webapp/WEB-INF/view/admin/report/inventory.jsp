<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page pageEncoding="UTF-8" %>

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
    <h3 class="alert alert-warning">Hàng tồn kho</h3>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Thể Loại</th>
                <th>Số lượng</th>
                <th>Tổng số tiền</th>
                <th>Giá thấp nhất</th>
                <th>Giá cao nhất</th>
                <th>Giá trung bình</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="data" items="${data}">
                <tr>
                    <td>${data[0]}</td>
                    <td>${data[1]}</td>
                    <td><f:formatNumber value="${data[2]}" pattern="#,###,###"/> VNĐ</td>
                    <td><f:formatNumber value="${data[3]}" pattern="#,###,###"/> VNĐ</td>
                    <td><f:formatNumber value="${data[4]}" pattern="#,###,###"/> VNĐ</td>
                    <td><f:formatNumber value="${data[5]}" pattern="#,###,###"/> VNĐ</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <html>
    <head>

        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load("current", {packages:["corechart"]});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Thể loại', 'Hours per Day'],
                    <c:forEach items="${data}" var="data">
                        ['${data[0]}',  ${data[2]}],
                    </c:forEach>
                ]);

                var options = {
                    title: 'Tồn kho theo thể loại',
                    is3D: true,
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
                chart.draw(data, options);
            }
        </script>
    </head>
    <body>
    <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
    </body>
    </html>

    <footer class="row">
        <p class="text-center">&copy; Shop Book 2021</p>
    </footer>
</div>


