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
                        <form:form action="" method="post" modelAttribute="customerDTO">
                            <div class="form-group">
                                <label>ID</label>
                                <form:input path="id" class="form-control" readonly="true"/>
                            </div>
                            <div class="form-group">
                                <label>Tên tài khoản</label>
                                <form:input path="userName" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label>Mật khẩu</label>
                                <form:input path="passWord" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <form:input path="email" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label>Kích hoạt</label>
                                <div class="form-control">
                                    <form:radiobutton path="activated" value="true" label="yes" />
                                    <form:radiobutton path="activated" value="false" label="no" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Quyền</label>
                                <div class="form-control">
                                    <form:radiobutton path="role.role_ID" value="1" label="admin" />
                                    <form:radiobutton path="role.role_ID" value="2" label="user" />
                                </div>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-primary" formaction="/admin/customer/create">Create</button>
                                <button class="btn btn-warning" formaction="/admin/customer/update">Update</button>
                                <a class="btn btn-default" href="/admin/customer/index">Reset</a>
                            </div>
                        </form:form>
                    </div>
                </div>

            </div>
            <div id="tab2" class="tab-pane fade">
                <hr style="border-top: 1px dashed;margin: 35px 0">
                <h2>Danh sách khách hàng</h2>
                <hr style="border-top: 1px dashed;margin: 35px 0">
                <table class="table table-hover">
                    <thead>
                    <th>Id</th>
                    <th>Tài khoản</th>
                    <th>Mật khẩu</th>
                    <th>Email</th>
                    <th>Kích hoạt</th>
                    <th>Quyền</th>

                    </thead>
                    <tbody>
                    <c:forEach var="c" items="${listCustomer}">
                        <tr>
                            <td>${c.id}</td>
                            <td>${c.userName}</td>
                            <td>${c.passWord}</td>
                            <td>${c.email}</td>
                            <td>${c.activated?'yes':'no'}</td>
                            <td>${c.role.role_Name}</td>
                            <td>
                                <a class="btn btn-sm btn-info" href="/admin/customer/edit/${c.id}">edit</a>
                                <a class="btn btn-sm btn-info" href="/admin/customer/delete/${c.id}">delete</a>
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
