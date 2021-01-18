<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>

<html lang="en">
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
    <h3 class="label label-success">${param.mess}</h3>
    <div class="row">
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#tab1">Edit</a></li>
            <li><a data-toggle="tab" href="#tab2">List</a></li>
        </ul>

        <div class="tab-content">
            <div id="tab1" class="tab-pane fade in active">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <h2>FORM</h2>
                        <hr style="border-top: 1px dashed;margin: 35px 0">
                        <form:form action="" method="post" modelAttribute="categoryDTO">
                            <div class="form-group">
                                <label>ID</label>
                                <form:input path="id" class="form-control" readonly="true"/>
                            </div>
                            <div class="form-group">
                                <label>Thêm Thể Loại</label>
                                <form:input path="categoryName" class="form-control" />
                            </div>
                            <div class="form-group">
                                <button class="btn btn-primary" formaction="/admin/category/create">Create</button>
                                <button class="btn btn-warning" formaction="/admin/category/update">Update</button>
                                <a class="btn btn-default" href="/admin/category/index">Reset</a>
                            </div>
                        </form:form>
                    </div>
                </div>

            </div>
            <div id="tab2" class="tab-pane fade">
                <hr style="border-top: 1px dashed;margin: 35px 0">
                <h2>Danh sách loại</h2>
                <hr style="border-top: 1px dashed;margin: 35px 0">
                <table class="table table-hover">
                    <thead>
                    <th>Id</th>
                    <th>Tên thể loại</th>
                    </thead>
                    <tbody>
                    <c:forEach var="c" items="${listCate}">
                        <tr>
                            <td>${c.id}</td>
                            <td>${c.categoryName}</td>
                            <td>
                                <a class="btn btn-sm btn-info" href="/admin/category/edit/${c.id}">edit</a>
                                <a class="btn btn-sm btn-info" href="/admin/category/delete/${c.id}">delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
    <footer class="row">
        <p class="text-center">&copy; Shop Book 2021</p>
    </footer>
</div>

</body>
</html>
