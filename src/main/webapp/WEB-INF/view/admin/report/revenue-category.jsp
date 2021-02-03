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
    <h3 class="alert alert-warning">Doanh thu sản phẩm</h3>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Thể Loại</th>
            <th>Số lượng bán</th>
            <th>Tiền thu về</th>
            <th>Giá bán thấp nhất</th>
            <th>Giá bán cao nhất</th>
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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load("current", {packages:['corechart']});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ["Thể loại", "giá", { role: "style" } ],
                <c:forEach items="${data}" var="data">
                    ["${data[0]}", ${data[2]}, "#b87333"],
                </c:forEach>
            ]);

            var view = new google.visualization.DataView(data);
            view.setColumns([0, 1,
                { calc: "stringify",
                    sourceColumn: 1,
                    type: "string",
                    role: "annotation" },
                2]);

            var options = {
                title: "Thống kê doanh thu theo thể loại",
                width: 600,
                height: 400,
                bar: {groupWidth: "95%"},
                legend: { position: "none" },
            };
            var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
            chart.draw(view, options);
        }
    </script>
    <div id="columnchart_values" style="width: 900px; height: 300px;"></div>
</div>


