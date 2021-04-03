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
    <h3 class="alert alert-warning">Doanh thu theo tháng</h3>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Tháng</th>
            <th>Số lượng bán</th>
            <th>Tiền thu về</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="data" items="${data}">
            <tr>
                <td>${data[0]}</td>
                <td>${data[1]}</td>
                <td><f:formatNumber value="${data[2]}" pattern="#,###,###"/> VNĐ</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages':['corechart', 'bar']});
            google.charts.setOnLoadCallback(drawStuff);

            function drawStuff() {

                var button = document.getElementById('change-chart');
                var chartDiv = document.getElementById('chart_div');

                var data = google.visualization.arrayToDataTable([
                    ['Tháng', 'Số lượng', 'Tổng tiền'],
                    <c:forEach items="${data}" var="data">
                          ['${data[0]}', ${data[1]}, ${data[2]}],
                     </c:forEach>
                ]);

                var materialOptions = {
                    width: 900,
                    chart: {
                        title: 'Thống kê theo tháng',
                        subtitle: 'Tháng, số lượng, và tổng số tiền: 2020-2021'
                    },
                    series: {
                        0: { axis: 'distance' }, // Bind series 0 to an axis named 'distance'.
                        1: { axis: 'brightness' } // Bind series 1 to an axis named 'brightness'.
                    },
                };

                var classicOptions = {
                    width: 900,
                    series: {
                        0: {targetAxisIndex: 0},
                        1: {targetAxisIndex: 1}
                    },
                    title: 'Thống kê theo tháng từ 2020-2021',

                };

                function drawMaterialChart() {
                    var materialChart = new google.charts.Bar(chartDiv);
                    materialChart.draw(data, google.charts.Bar.convertOptions(materialOptions));
                    button.innerText = 'Kiểu xem 1';
                    button.onclick = drawClassicChart;
                }

                function drawClassicChart() {
                    var classicChart = new google.visualization.ColumnChart(chartDiv);
                    classicChart.draw(data, classicOptions);
                    button.innerText = 'Kiểu xem 2';
                    button.onclick = drawMaterialChart;
                }

                drawClassicChart();
            };
        </script>

    <button id="change-chart">Đổi kiểu xem</button>
    <br><br>
    <div id="chart_div" style="width: 500px; height: 500px;"></div>


</div>


